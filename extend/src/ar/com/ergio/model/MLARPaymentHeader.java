/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2007 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software, you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY, without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program, if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package ar.com.ergio.model;

import java.io.File;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.AbstractMap.SimpleImmutableEntry;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import javax.swing.JDialog;

import org.compiere.Adempiere;
import org.compiere.apps.ADialog;
import org.compiere.model.MAllocationHdr;
import org.compiere.model.MAllocationLine;
import org.compiere.model.MBPartner;
import org.compiere.model.MBPartnerLocation;
import org.compiere.model.MCharge;
import org.compiere.model.MCurrency;
import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.model.MInvoiceLine;
import org.compiere.model.MInvoiceTax;
import org.compiere.model.MOrg;
import org.compiere.model.MPayment;
import org.compiere.model.MPaymentAllocate;
import org.compiere.model.MSysConfig;
import org.compiere.model.MTax;
import org.compiere.model.ModelValidationEngine;
import org.compiere.model.ModelValidator;
import org.compiere.model.Query;
import org.compiere.model.Tax;
import org.compiere.process.DocAction;
import org.compiere.process.DocOptions;
import org.compiere.process.DocumentEngine;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.globalqss.model.X_LCO_WithholdingType;

import ar.com.ergio.util.LAR_Utils;

/**
 * Payment Header
 *
 * @author Wagner Germán
 *
 * @contributor Marcos Zuñiga - http://www.comit.com.ar
 */
public class MLARPaymentHeader extends X_LAR_PaymentHeader implements DocAction, DocOptions
{
	/**
	 *
	 */
	private static final long serialVersionUID = -2698873064570244615L;

	/** Process Message             */
    private String      m_processMsg = null;
    /** Just Prepared Flag          */
    private boolean     m_justPrepared = false;
    /** Marca para registrar la Ret de IIBB en las facturas (solo al Completar) */
    private boolean     registrarRetIIBB = false;
    // factura para registrar en el certificado.
    private ArrayList<SimpleImmutableEntry<Integer, BigDecimal>> facturaID_Cert;
    // Importe Sujeto a Retención
    private BigDecimal  impSujetoaRet = Env.ZERO;
    // TODO: Parametrizar estas constantes.
    // ID opción "Sin Especificar" en config Ganancias SdN
    private static final int     sinEspecificar_ID = 1000024;
    // Alicuota IVA General
    private static final BigDecimal alicuotaIVAGral = new BigDecimal(21);
    // Coeficiente IVA 21%
    private static final BigDecimal coef_IVA = Env.ONE.add(alicuotaIVAGral.divide(Env.ONEHUNDRED)
            .setScale(2, BigDecimal.ROUND_HALF_EVEN));
    // Coeficiente IVA 21%
    private static final BigDecimal alicuotaRetReducida = new BigDecimal(80);
    // Categoría de IVA Responsable Inscirpto
    final static private int responsableInscripto = 1000000;
    // C_SalesRegion_ID para Río Negro
    final static private int regionRioNegroID = 224;

    // @fchiappano variables necesarias para la generación automatica de NC.
    private MInvoice notaCredito = null;
    private List<MAllocationHdr> asignacionesNC = new ArrayList<MAllocationHdr>();
    private String generarNC = MSysConfig.getValue("LAR_GenerarNC_EnRecibos", "D", getAD_Client_ID());

    /**
     * Recupera la cabecera de pagos relacionada con el id de la factura dada
     *
     * @deprecated Luego de la funcionalidad Varias Facturas vs varios Cobros/Pagos en las
     *             cabeceras ya no se permite la carga de una factura en el Header, sino en la
     *             pestaña facturas que se refleja en la tabla C_PaymentAllocate.
     *
     * @param ctx
     *        contexto
     * @param C_Invoice_ID
     *        id de factura
     * @param trxName
     *        nombre de la transacción
     * @return Cabecera de pago asociada a la factura dada
     */
    public static MLARPaymentHeader getFromInvoice(final Properties ctx, int C_Invoice_ID, final String trxName)
    {
        final String whereClause = COLUMNNAME_C_Invoice_ID + "=?";
        final MLARPaymentHeader header = new Query(ctx, Table_Name, whereClause, trxName)
                                                .setParameters(C_Invoice_ID)
                                                .setClient_ID()
                                                .setOnlyActiveRecords(true)
                                                .firstOnly();
        return header;
    }

    /**
     * Actualiza la retención y el total de pago en la cabecera via sql.
     * (Esta forma evita el disparo de la validación)
     *
     * @return verdadero si se actualiza la cabecera
     */
    public static boolean updateHeaderWithholding(int LAR_PaymentHeader_ID, String trxName)
    {
        String sql = "UPDATE LAR_PaymentHeader"
                   + "   SET WithholdingAmt ="
                   + "         (SELECT COALESCE(SUM(TaxAmt),0)"
                   + "            FROM LAR_PaymentWithholding iw"
                   + "           WHERE iw.IsActive='Y'"
                   + "             AND LAR_PaymentHeader.LAR_PaymentHeader_ID=iw.LAR_PaymentHeader_ID)"
                   + "     , PayHeaderTotalAmt = "
                   + "         (SELECT COALESCE(SUM(PayAmt),0)"
                   + "            FROM C_Payment p"
                   + "           WHERE p.IsActive='Y'"
                   + "             AND LAR_PaymentHeader.LAR_PaymentHeader_ID=p.LAR_PaymentHeader_ID)"
                   + " WHERE LAR_PaymentHeader_ID=?";
        int no = DB.executeUpdate(sql, LAR_PaymentHeader_ID, trxName);

        return no == 1;
    }   //  updateHeaderWithholding

    /**
     * Establece un valor al campo retención directamente (via sql)
     *
     * @param header cabecera de pago
     * @param amt importe de retención
     * @return verdadero si se actualiza la cabecera
     */
    public static boolean setWithholdingAmtDirectly(final MLARPaymentHeader header, final BigDecimal amt)
    {
        DB.executeUpdate("UPDATE LAR_PaymentHeader SET WithholdingAmt=? WHERE LAR_PaymentHeader_ID=?",
                new Object[] {amt, header.getLAR_PaymentHeader_ID()},
                true,
                header.get_TrxName());
        return true;
    }

    /**
     * Establece un valor al campo PayAmt un Pago directamente (via sql)
     *
     * @param pago Pago
     * @param imp Importe del Pago
     * @return verdadero si se actualiza el Pagocabecera
     */
    public static boolean setPayAmtDirectly(final MPayment pago, final BigDecimal imp)
    {
        DB.executeUpdate("UPDATE C_Payment SET PayAmt=? WHERE C_Payment_ID=?",
                new Object[] {imp, pago.getC_Payment_ID()},
                true,
                pago.get_TrxName());
        return true;
    } //setPayAmtDirectly

    /**
     * Realiza el cálculo de la retención sobre la cabecera de pago dada.
     * Esto lo lleva a cabo creando por cada confiuración aplicable
     * un certificado de retención y un pago de tipo "retención".
     *
     * @param genera Si es true geera el pago retención y el correspondiente certificado.
     * @return verdadero si se generó la retención correctamente
     */
    public boolean recalcPaymentWithholding(boolean genera)
    {
        this.load(get_TrxName());

        final MDocType dt = new MDocType(getCtx(), getC_DocType_ID(), get_TrxName());
        String genwh = dt.get_ValueAsString("GenerateWithholding");
        if (genwh == null || genwh.equals("N"))
            return true;

        // Se Borran los certificados y Pagos Retención del Header
        BorrarCertificadosdeRetenciondelHeader();
        BorrarPagosRetenciondelHeader();
        updateHeaderWithholding(getLAR_PaymentHeader_ID(), get_TrxName());
        this.load(get_TrxName());


        // Recupera la configuración y calcula
        final MBPartner bp = new MBPartner(getCtx(), getC_BPartner_ID(), get_TrxName());
        final WithholdingConfig[] configs = WithholdingConfig.getConfig(bp, dt.isSOTrx(),
                get_TrxName(), null, getDateTrx());

        // Si se recuperó correctamente la configuración
        if (configs != null)
            // Se recorren las configuraciones recuperadas
            for (final WithholdingConfig wc : configs)
            {
                log.config("Withholding conf >> " + wc);
                BigDecimal impRetencion = Env.ZERO;
                BigDecimal impExencion = Env.ZERO;
                BigDecimal porcExencion = Env.ZERO;
                // Se recupera el tipo de documento para el Pago Retención
                // a partir del tipo de retencion
                final int c_DocType_ID = wc.getC_DocType_ID();
                int cargoRetencion;
                if (c_DocType_ID > 0)
                {
                    final MDocType docRet = new MDocType(getCtx(), c_DocType_ID, get_TrxName());
                    // Se recupera y valida el ID del cargo para retención desde el documento
                    cargoRetencion = docRet.get_ValueAsInt("LAR_Withholding_Charge_ID");
                    if (cargoRetencion < 0)
                    {
                        JDialog dialog = new JDialog();
                        dialog.setIconImage(Adempiere.getImage16());
                        ADialog.warn(1, dialog,
                                "Error al crear la retenci\u00f3n (No existe cargo retenci\u00f3n configurado en el documento)");
                        return false;
                    }
                } else
                {
                    JDialog dialog = new JDialog();
                    dialog.setIconImage(Adempiere.getImage16());
                    ADialog.warn(
                            1,
                            dialog,
                            "Error al crear la retenci\u00f3n (No existe tipo de documento configurado para el Pago Retenci\u00f3n)");
                    return false;
                }
                // En las retenciones de ganancias estos valores se pisan con los recuperados
                // desde la tabla de conceptos LAR_Concepto_Ret_Ganancias
                BigDecimal impNoSujeto = wc.getamountRefunded();
                BigDecimal impMinNoSujeto = wc.getPaymentThresholdMin();
                BigDecimal impRetMin = wc.getThresholdMin();
                // Se calcula el importe a retener según el tipo de retención
                final MPaymentAllocate[] facturas = getInvoices(get_TrxName());
                BigDecimal totalOP = getPayHeaderTotalAmt();
                impSujetoaRet = Env.ZERO;
                BigDecimal aliquot = wc.getAliquot();
                BigDecimal impFijo = Env.ZERO;
                if (wc.isCalcFromPayment())
                {
                    // Es retención de Ganancias
                    if (wc.usaTipoGananciasBP())
                    {
                        final String tipoGanancias = (String) bp.get_Value("LAR_TipoGanancias");
                        // Si no existen facturas, es un pago a cuenta
                        // Se toma el importe del pago sin IVA
                        if (facturas.length <= 0)
                            impSujetoaRet = totalOP.divide(coef_IVA, 2, RoundingMode.HALF_EVEN);
                        else 
                        {// Se calcula el importe sujeto a retención
                            BigDecimal sumaImpago = Env.ZERO;
                            for (final MPaymentAllocate mp : facturas)
                            {
                                MInvoice factura = mp.getInvoice();
                                BigDecimal neto = factura.getTotalLines();
                                BigDecimal impago = mp.getAmount();
                                /*
                                 * Se suma el importe "impago" de las facturas, si el importe
                                 * impago supera al neto de la factura, solo se suma el neto ya
                                 * que no podemos tomar como importe Sujeto a Retención los
                                 * impuestos (IVA, percepciones, imp. internos, ect).
                                 */
                                impSujetoaRet = impSujetoaRet
                                        .add(neto.compareTo(impago) >= 0 ? impago : neto);
                                sumaImpago = sumaImpago.add(impago);
                                // Si el importe sujeto tomado de las facturas supera al total de la OP
                                // se toma como importe sujeto a retención el total de la OP-
                            }
                            if (totalOP.compareTo(impSujetoaRet) <= 0)
                                impSujetoaRet = totalOP;
                            else
                            {
                                /*
                                 * Se suma al importe sujeto a retención la diferencia
                                 * exedente de la orden de pago (sin tomar en cuenta
                                 *  los impuestos de las facturas.
                                 */
                                if (totalOP.compareTo(sumaImpago) > 0)
                                    impSujetoaRet = impSujetoaRet.add(totalOP.subtract(sumaImpago));
                            }
                        }

                        // Recuperar el importe pagado a ese proveedor dentro del mes corriente
                        BigDecimal impPagado = calculaImportePagado(bp);
                        // Si hay error al recuperar el importe pagado
                        if (impPagado.compareTo(Env.ZERO) < 0)
                            continue;

                        // Configuración del SdN
                        X_LAR_Concepto_Ret_Ganancias cg = null;
                        final int concepto_id = bp.get_ValueAsInt("LAR_Concepto_Ret_Ganancias_ID");
                        // Si no tiene concepto configurado o es "Sin Especificar"
                        if (concepto_id == 0 || concepto_id == sinEspecificar_ID)
                            continue;
                        else
                        {
                            try
                            {
                                // Recuperar toda la información asociada al concepto
                                String sqlcg = "SELECT * " + " FROM LAR_Concepto_Ret_Ganancias "
                                        + " WHERE LAR_Concepto_Ret_Ganancias_ID = ?";
                                PreparedStatement pstmtcg = DB.prepareStatement(sqlcg, get_TrxName());

                                pstmtcg.setInt(1, concepto_id);

                                ResultSet rscg = pstmtcg.executeQuery();
                                if (rscg.next())
                                {
                                    cg = new X_LAR_Concepto_Ret_Ganancias(Env.getCtx(), rscg,
                                            get_TrxName());
                                } else
                                {
                                    log.warning("No existe configuraci\u00f3n para el concepto LAR_Concepto_Ret_Ganancias_ID = "
                                            + concepto_id);
                                    rscg.close();
                                    pstmtcg.close();
                                    continue;
                                }
                                rscg.close();
                                pstmtcg.close();
                            } catch (SQLException e)
                            {
                                log.log(Level.SEVERE, "", e);
                                return false;
                            }
                        } // Recuperar toda la información asociada al concepto

                        BigDecimal impPiso = Env.ZERO;
                        // Es cálculo por escala
                        if (cg.isCalculo_Por_Escala() && tipoGanancias.equals("I"))
                        {
                            X_LAR_Escala_Ret_Ganancias eg = null;
                            final List<X_LAR_Escala_Ret_Ganancias> escala = new ArrayList<X_LAR_Escala_Ret_Ganancias>();
                            // Recuperar la información de la escala
                            try
                            {
                                // Recuperar la información de la escala
                                String sqleg = "SELECT * " + " FROM LAR_Escala_Ret_Ganancias ";
                                PreparedStatement pstmteg = DB.prepareStatement(sqleg, get_TrxName());
    
                                ResultSet rseg = pstmteg.executeQuery();
                                while (rseg.next())
                                {
                                    eg = new X_LAR_Escala_Ret_Ganancias(Env.getCtx(), rseg,
                                            get_TrxName());
                                    if (!escala.add(eg))
                                    {
                                        log.severe("Error al agregar configuración de escala a la lista");
                                        continue;
                                    }
                                }
                                rseg.close();
                                pstmteg.close();
                            } catch (SQLException e)
                            {
                                log.log(Level.SEVERE, "", e);
                                return false;
                            } // Recuperar la información de la escala
                              // Recorrer la escala para encontrar el rango del pago
                            for (final X_LAR_Escala_Ret_Ganancias esc : escala)
                            {
                                if (impSujetoaRet.compareTo(esc.getImporte_Desde()) >= 0
                                        && impSujetoaRet.compareTo(esc.getImporte_Hasta()) <= 0)
                                {
                                    // obtener importe fijo, importe no sujeto y alicuota
                                    aliquot = esc.getAlicuota();
                                    // Se corrige la alícuota e impuesto en la config
                                    // para que el certificado de retención quede correcto
                                    wc.setAliquot(aliquot);
                                    wc.setC_Tax_ID(0);
                                    impFijo = esc.getImporte_Fijo();
                                    impPiso = esc.getImporte_No_Sujeto();
                                    impNoSujeto = tipoGanancias.equals("I") ? cg
                                            .getImporte_No_Sujeto_Inscripto() : cg
                                            .getImporte_No_Sujeto_No_Insc();
                                    break;
                                }
                            }
                        }// Es cálculo por escala
                        else
                        // Es cáclulo directo
                        {
                            // Obtener importe importe no sujeto y alicuota según si el SdN es
                            // Inscripto o No en el Impuesto a las Ganancias
                            aliquot = tipoGanancias.equals("I") ? cg.getAlicuota_Inscripto() : cg
                                    .getAlicuota_No_Inscripto();
                            // Se corrige la alícuota e impuesto en la config
                            // para que el certificado de retención quede correcto
                            wc.setAliquot(aliquot);
                            wc.setC_Tax_ID(0);
                            impNoSujeto = tipoGanancias.equals("I") ? cg
                                    .getImporte_No_Sujeto_Inscripto() : cg
                                    .getImporte_No_Sujeto_No_Insc();
                        }
                        // Se realiza el calculo del importe sujeto a retención en base
                        // al acumulado en el mes corriente y el importe no sujeto
                        BigDecimal acumulado = impSujetoaRet.add(impPagado);
                        // Si se no alcanza el Monto No Sujeto a Retención en el mes corriente, no se genera retención
                        if ((acumulado).compareTo(impNoSujeto) < 0)
                            continue; // Continúa con la siguiente configuración
                        else
                        {
                            /*
                             * Si se supera el importe No Sujeto a Retención con el importe de
                             * la OP actual se deja como importe Sujeto a Retención la
                             * diferencia, caso contrario se calcula la retención con el
                             * importe Sujeto a retención completo.
                             */
                            if (((acumulado.subtract(impNoSujeto)).compareTo(impSujetoaRet)) < 0)
                                impSujetoaRet = acumulado.subtract(impNoSujeto);
                        }
                        // Si es por escala al importe sujeto se le debe restar el "piso" (Sobre Excedente)
                        if (cg.isCalculo_Por_Escala())
                            impSujetoaRet = impSujetoaRet.subtract(impPiso);

                        impRetencion = impSujetoaRet.multiply(aliquot).divide(Env.ONEHUNDRED)
                                .setScale(2, BigDecimal.ROUND_HALF_EVEN);
                        impRetencion = impRetencion.add(impFijo);
                        // Exención de Ganancias
                        if (bp.get_ValueAsBoolean("LAR_Exento_Ret_Ganancias"))
                        {
                            Date fechaVenc = (Date) bp.get_Value("LAR_Vencimiento_Cert_Ganancias");
                            if (!fechaVenc.before(getDateTrx()))
                            {
                                impExencion = (BigDecimal) bp
                                        .get_Value("LAR_Importe_Exencion_Ganancias");
                                porcExencion = (BigDecimal) bp.get_Value("LAR_Exencion_Ganancias");
                            }
                            else
                            {
                                // Advertir al ususario que el certificado de Exención esta vencido
                                JDialog dialog = new JDialog();
                                dialog.setIconImage(Adempiere.getImage16());
                                ADialog.warn(1, dialog,
                                        "Certificado de Exenci\u00f3n de Ganancias Vencido");
                            }
                        }
                        // Exenciones % e importe fijo
                        BigDecimal impExentoDesc = impRetencion.multiply(porcExencion)
                                .divide(Env.ONEHUNDRED).setScale(2, BigDecimal.ROUND_HALF_EVEN);
                        impRetencion = impRetencion.subtract(impExentoDesc).subtract(impExencion);
                    }// Es retención de Ganancias

                    // Es retención de IVA
                    // MOrgInfo orgI = new MOrgInfo(new MOrg(Env.getCtx(),
                    // Env.getAD_Org_ID(Env.getCtx()), this.get_TrxName()));
                    // La organización está configurada como Responsable Inscripto
                    else if (wc.isUseOrgTaxPayerType())// no recupera correctamente el
                                                       // loc_taxpayertype_id desde orgInfo &&
                                                       // orgI.get_ValueAsInt("LCO_TaxPayerType_ID")
                                                       // == responsableInscripto)
                    {
                        // Recupera la categoría de IVA del SdN
                        final int bpTaxPaxerTypeID = bp.get_ValueAsInt("LCO_TaxPayerType_ID");
                        // Si el SdN no es Responsable Inscripto o no existen facturas en la OP
                        // no se genera retención de IVA.
                        if (bpTaxPaxerTypeID != responsableInscripto && facturas.length <= 0)
                            continue;
                        else
                        { // Se calcula el importe sujeto a retención
                          // Se recorren las facturas de la OP
                            for (final MPaymentAllocate mp : facturas)
                            {
                                MInvoice factura = mp.getInvoice();
                                MDocType doc = new MDocType(Env.getCtx(),
                                        factura.getC_DocType_ID(), this.get_TrxName());
                                MInvoiceTax[] impFactura = factura.getTaxes(false);
                                // Se recorren los impuestos de la factura
                                for (final MInvoiceTax impuesto : impFactura)
                                {
                                    MTax tax = new MTax(Env.getCtx(), impuesto.getC_Tax_ID(),
                                            this.get_TrxName());
                                    // Se recupera la letra del tipo de documento
                                    // si es letra M se retiene el 100% y supera el mínimo
                                    String letra = recuperaLetra(doc
                                            .get_ValueAsInt("LAR_DocumentLetter_ID"));
                                    // Si el cálculo esta configurado como Documento se asume
                                    // que es retención por tipo de doc M
                                    if (wc.getBaseType().equals("D"))
                                    {
                                        if (letra.equals("M")
                                                && (factura.getGrandTotal().compareTo(
                                                        wc.getPaymentThresholdMin()) > 0))
                                        {
                                            aliquot = wc.getAliquot();
                                            if (tax.getName().contains("IVA"))
                                                impSujetoaRet = impSujetoaRet.add(impuesto
                                                        .getTaxAmt());
                                        } else
                                            continue;
                                    } else if (tax.getName().contains("IVA"))
                                    {
                                        impSujetoaRet = impSujetoaRet.add(impuesto.getTaxAmt());
                                        // Si es alicuota reducida
                                        if (tax.getRate().compareTo(alicuotaIVAGral) < 0)
                                            aliquot = alicuotaRetReducida;
                                        // Si no es reducida, se utiliza la
                                        // alicuota de la configuración
                                        else
                                            aliquot = wc.getAliquot();
                                    }
                                    // Se calcula y acumula la retención
                                    impRetencion = impRetencion.add(impSujetoaRet.multiply(aliquot)
                                            .divide(Env.ONEHUNDRED)
                                            .setScale(2, BigDecimal.ROUND_HALF_EVEN));
                                } // Se recorren los impuestos de la factura
                            } // Se recorren las facturas de la OP
                        }
                        // Exención de IVA
                        if (bp.get_ValueAsBoolean("LAR_Exento_Retenciones_IVA"))
                        {
                            Date fechaVenc = (Date) bp.get_Value("LAR_Vencimiento_Cert_IVA");
                            if (!fechaVenc.before(getDateTrx()))
                            {
                                impExencion = (BigDecimal) bp.get_Value("LAR_Importe_Exencion_IVA");
                                porcExencion = (BigDecimal) bp.get_Value("LAR_Exencion_IVA");
                            } else
                            {
                                // Advertir al ususario que el certificado de Exención esta
                                // vencido
                                JDialog dialog = new JDialog();
                                dialog.setIconImage(Adempiere.getImage16());
                                ADialog.warn(1, dialog,
                                        "Certificado de Exenci\u00f3n de IVA Vencido");
                            }
                        }
                        // Exenciones % e importe fijo
                        BigDecimal impExentoDesc = impRetencion.multiply(porcExencion)
                                .divide(Env.ONEHUNDRED).setScale(2, BigDecimal.ROUND_HALF_EVEN);
                        impRetencion = impRetencion.subtract(impExentoDesc).subtract(impExencion);
                        // Se chequea si el importe de la retención supera
                        // el importe a pagar
                        if (totalOP.compareTo(impRetencion) < 0)
                            impRetencion = totalOP;
                    } // Es retención de IVA

                    // Es retención de IIBB
                    else if (wc.isUseBPISIC())
                    {
                        impRetencion = calculaRetencionIIBB(facturas, bp, aliquot, impMinNoSujeto);
                        if (impRetencion.compareTo(Env.ZERO) < 0)
                        {
                            JDialog dialog = new JDialog();
                            dialog.setIconImage(Adempiere.getImage16());
                            ADialog.warn(1, dialog,
                                    "Error al crear la retenci\u00f3n: " + m_processMsg);
                            return false;
                        }
                        // Exención de IIBB
                        if (wc.isUseBPISIC() && bp.get_ValueAsBoolean("LAR_Exento_Ret_IIBB") && (impRetencion.compareTo(Env.ZERO) > 0))
                        {
                            Date fechaVenc = (Date) bp.get_Value("LAR_Vencimiento_Cert_IIBB");
                            Date fechaInicio = (Date) bp.get_Value("LAR_Inicio_Cert_IIBB");
                            if (!fechaInicio.after(getDateTrx()) && !fechaVenc.before(getDateTrx()))
                            {
                                impExencion = (BigDecimal) bp.get_Value("LAR_Importe_Exencion_IIBB");
                                porcExencion = (BigDecimal) bp.get_Value("LAR_Exencion_IIBB");
                            }
                            else
                            {
                                // Advertir al ususario que el certificado de Exención esta vencido
                                JDialog dialog = new JDialog();
                                dialog.setIconImage(Adempiere.getImage16());
                                ADialog.warn(1, dialog, bp.getName() +
                                        ": Certificado de Exenci\u00f3n de IIBB Vencido");
                            }
                            // Exenciones % e importe fijo
                            BigDecimal impExentoDesc = impRetencion.multiply(porcExencion)
                                    .divide(Env.ONEHUNDRED).setScale(2, BigDecimal.ROUND_HALF_EVEN);
                            impRetencion = impRetencion.subtract(impExentoDesc).subtract(impExencion);
                        }
                        // Si existen facturas registrar la retención en las mismas
                        if (facturaID_Cert != null)
                            for (int i = 0; i < facturaID_Cert.size(); i++)
                        {
                            MInvoice factura = new MInvoice(getCtx(), facturaID_Cert.get(i).getKey(), get_TrxName());
                            // Se deja registrado en la factura la retención
                            BigDecimal retAcumulada = (BigDecimal) factura.get_Value("ImporteRetencionIIBB");
                            retAcumulada = retAcumulada.add(facturaID_Cert.get(i).getValue());
                            factura.set_CustomColumn("ImporteRetencionIIBB", retAcumulada);
                            if (!factura.save(get_TrxName()))
                            {
                                m_processMsg = "Error al registrar la retenci\u00f3n en la factura";
                                log.severe(m_processMsg);
                                return false;
                            }
                        }
                    }// Es retención de IBB
                } // IsCalcFromPayment

                // Considerar las Exenciones
                final X_LCO_WithholdingType wt = new X_LCO_WithholdingType(Env.getCtx(),
                        wc.getWithholdingType_ID(), get_TrxName());

                // Exención de SUSS
                if (wt.getName().contains("SUSS")
                        && bp.get_ValueAsBoolean("LAR_Exento_Retenciones_SUSS"))
                {
                    Date fechaVenc = (Date) bp.get_Value("LAR_Vencimiento_Cert_SUSS");
                    Date fechaInicio = (Date) bp.get_Value("LAR_Inicio_Cert_SUSS");
                    if (!fechaInicio.after(getDateTrx()) && !fechaVenc.before(getDateTrx()))
                    {
                        impExencion = (BigDecimal) bp.get_Value("LAR_Importe_Exencion_SUSS");
                        porcExencion = (BigDecimal) bp.get_Value("LAR_Exencion_SUSS");
                    } else
                    {
                        // Advertir al ususario que el certificado de Exención esta vencido
                        JDialog dialog = new JDialog();
                        dialog.setIconImage(Adempiere.getImage16());
                        ADialog.warn(1, dialog, "Certificado de Exenci\u00f3n de SUSS Vencido");
                    }
                    // Exenciones % e importe fijo
                    BigDecimal impExentoDesc = impRetencion.multiply(porcExencion)
                            .divide(Env.ONEHUNDRED).setScale(2, BigDecimal.ROUND_HALF_EVEN);
                    impRetencion = impRetencion.subtract(impExentoDesc).subtract(impExencion);
                } // Exención de SUSS

                // Si el importe de la retención no supera el mínimo o es cero
                if (impRetencion.compareTo(impRetMin) < 0 || impRetencion.compareTo(Env.ZERO) <= 0)
                    continue;

                // Validar que si existen facturas, quede importe disponible a pagar
                if (facturas.length > 0)
                {
                    BigDecimal sumaRemanente = Env.ZERO;
                    for (final MPaymentAllocate mp : facturas)
                        sumaRemanente = sumaRemanente.add(mp.getAmount());
                    if (sumaRemanente.compareTo(impRetencion) < 0)
                    {
                        JDialog dialog = new JDialog();
                        dialog.setIconImage(Adempiere.getImage16());
                        ADialog.warn(
                                1,
                                dialog,
                                "No existe suficiente importe pendiente de pago (Revisar las facturas cargadas en la Orden de Pago).");
                        return false;
                    }
                }
                // @fchiappano verifico que existan pagos en los que se pueda
                // descontar el importe de la retención.
                MPayment pago = null;
                boolean compensar = false;
                for (MPayment payment : getPayments(get_TrxName()))
                {
                    if (!payment.getTenderType().equals("Z")
                            && !payment.get_ValueAsBoolean("EsRetencionIIBB")
                            && payment.getPayAmt().compareTo(impRetencion) >= 0)
                    {
                        pago = payment;
                        compensar = true;
                        // Sigue recorriendo para que en caso de encontrar un pago en efectivo
                        // lo utilice prefrentemente por encima de los demás TT que pueden
                        // compensar.
                        if (payment.getTenderType().equals("X"))
                            break;
                    }
                }

                // Se crean los pagos retención y sus respectivos certificados
                // Existe un pago que permite compensar el importe de la retención
                if (compensar && genera)
                {
                    // Se crea el Pago Retención compensando el importe
                    final MPayment pagoRetencion = creaPagoRetencion(impRetencion, cargoRetencion,
                            c_DocType_ID, pago, compensar);
                    if (pagoRetencion == null)
                    {
                        JDialog dialog = new JDialog();
                        dialog.setIconImage(Adempiere.getImage16());
                        ADialog.warn(1, dialog, "Error al generar el Pago Retenci\u00f3n");
                        return false;
                    }
                    log.config("Pago Retenci\u00f3n: " + pagoRetencion.getC_Payment_ID());
                    // Se crea el Certificado de Retención
                    final MLARPaymentWithholding certificado = creaCertificadodeRetencion(
                            impRetencion, impSujetoaRet, wc, pagoRetencion.getC_Payment_ID(),
                            facturaID_Cert, pagoRetencion.getDocumentNo(),
                            pagoRetencion.getC_DocType_ID());
                    if (certificado == null)
                    {
                        JDialog dialog = new JDialog();
                        dialog.setIconImage(Adempiere.getImage16());
                        ADialog.warn(1, dialog, "Error al generar el Certificado de Retenci\u00f3n");
                        return false;
                    }
                    log.config("Certificado Retenci\u00f3n: "
                            + certificado.getLAR_PaymentWithholding_ID());
                } else if (genera)
                {
                    // Se crea el Pago Retención sin compensar el importe
                    final MPayment pagoRetencion = creaPagoRetencion(impRetencion, cargoRetencion,
                            c_DocType_ID, pago, false);
                    if (pagoRetencion == null)
                    {
                        JDialog dialog = new JDialog();
                        dialog.setIconImage(Adempiere.getImage16());
                        ADialog.warn(1, dialog, "Error al generar el Pago Retenci\u00f3n");
                        return false;
                    }
                    log.config("Pago Retenci\u00f3n: " + pagoRetencion.getC_Payment_ID());
                    // Se crea el Certificado de Retención
                    final MLARPaymentWithholding certificado = creaCertificadodeRetencion(
                            impRetencion, impSujetoaRet, wc, pagoRetencion.getC_Payment_ID(),
                            facturaID_Cert, pagoRetencion.getDocumentNo(),
                            pagoRetencion.getC_DocType_ID());
                    if (certificado == null)
                    {
                        JDialog dialog = new JDialog();
                        dialog.setIconImage(Adempiere.getImage16());
                        ADialog.warn(1, dialog, "Error al generar el Certificado de Retenci\u00f3n");
                        return false;
                    }
                    log.config("Certificado Retenci\u00f3n: "
                            + certificado.getLAR_PaymentWithholding_ID());
                } else
                {
                    this.setWithholdingAmt(impRetencion);
                    this.saveEx();
                }
            } // Se recorren las configuraciones recuperadas
        else
        {
            JDialog dialog = new JDialog();
            dialog.setIconImage(Adempiere.getImage16());
            ADialog.warn(1, dialog, "Error al recuperar configuración desde el SdN");
            return false;
        }
        // TODO: Refrescar el tab, ya que si existían pagos retención, estos fueron eliminados y se crearon nuevos
        // pero en la pestaña se visualizan los eliminados y es necesario refrescar manualmente para ver los nuevos.
        return true;
    } // recalcPaymentWithholding

    private BigDecimal calculaRetencionIIBB(MPaymentAllocate[] facturas, MBPartner bp,
            BigDecimal aliquot, BigDecimal impMinNoSujeto)
    {
        // Se recuperan los valores parametrizados
        // LCO_ISIC_ID CM Otra Convenio Multilateral c/jurisdicción Río Negro
        final int LAR_BP_LCO_ISIC_CM_Jurisd_RN = MSysConfig.getIntValue("LAR_BP_LCO_ISIC_CM_Jurisd_RN", 0, Env.getAD_Client_ID(getCtx()));
        // Coeficiente Unificado mínimo para Río Negro
        final BigDecimal LAR_Coef_Unif_Minimo_CM_Ret_IIBB_RN = new BigDecimal(MSysConfig.getValue("LAR_Coef_Unif_Minimo_CM_Ret_IIBB_RN", Env.getAD_Client_ID(getCtx())));
        // Se iniciaiza la factura para el certificado
        facturaID_Cert = new ArrayList<SimpleImmutableEntry<Integer, BigDecimal>>();
        // Recupera el tipo de IIBB del Proveedor
        final int bpLCO_ISIC_ID = bp.get_ValueAsInt("LCO_ISIC_ID");

        // Excepciones
        // Si el SdN Proveedor no tiene dirección en R.N.
        MBPartnerLocation[] bpl = bp.getLocations(false);
        boolean retener = false;
        for (final MBPartnerLocation loc : bpl)
        {
            if (loc.getLocation(false).getC_Region_ID() == 0)
            {
                m_processMsg = "Seleccionar la provincia en la direcci\u00f3n del SdN";
                log.severe(m_processMsg);
                return Env.ONE.negate();
            }
            if (loc.getLocation(false).getC_Region_ID() == regionRioNegroID)
                retener = true;
        }
        if (!retener)
        {
            log.warning("No corresponde retener, SdN sin dirección en Río Negro: " + bp.getName());
            return Env.ZERO;
        }
        // Si el SdN es convenio con jurisdicción en RN coef < 0.03
        final BigDecimal bpCoefCM = (BigDecimal) bp.get_Value("CoeficienteUnificadoCM");
        if (bpLCO_ISIC_ID == LAR_BP_LCO_ISIC_CM_Jurisd_RN)
            if (bpCoefCM.compareTo(Env.ZERO) <= 0)
            {
                m_processMsg = "Ingresar el Coeficiente Unificado en la configuraci\u00f3n del SdN";
                log.severe(m_processMsg);
                return Env.ONE.negate();
            }
            else
                if (bpCoefCM.compareTo(LAR_Coef_Unif_Minimo_CM_Ret_IIBB_RN) < 0)
                {
                    log.warning("No corresponde retener, Coeficiente Unificado: " + bpCoefCM + " < " + LAR_Coef_Unif_Minimo_CM_Ret_IIBB_RN);
                    return Env.ZERO;
                }

        impSujetoaRet = Env.ZERO;
        BigDecimal impSujetoTotal = Env.ZERO;
        BigDecimal impRetencion = Env.ZERO;

        // Si no existen facturas en la OP
        // Se retiene por el total del pago
        if (facturas.length <= 0)
        {
            impSujetoaRet = getPayHeaderTotalAmt();
            // Verificar si el monto sujeto a retención supera el mínimo
            if (impSujetoaRet.compareTo(impMinNoSujeto) > 0)
            {
            impRetencion = impSujetoaRet.multiply(aliquot)
                    .divide(Env.ONEHUNDRED)
                    .setScale(2, BigDecimal.ROUND_HALF_EVEN);
            }
        }
        else // Retención sobre las facturas
        {
            for (final MPaymentAllocate mp : facturas)
            {
                boolean noRetener = false;
                MInvoice factura = mp.getInvoice();

                // Exencion si la factura contiene Percepción de IIBB
                final MInvoiceLine lineas[] = factura.getLines();
                for (final MInvoiceLine ln : lineas)
                {
                    if (ln.getC_Charge_ID() == MSysConfig.getIntValue("LAR_C_ChargeID_Perc_IIBB_SUFRIDAS", 0, Env.getAD_Client_ID(getCtx())))
                    {
                        noRetener = true;
                        break;
                    }
                }
                if (noRetener)
                    continue;

                /*
                 * Se calcula el importe sujeto a retención. Si es factura A o M se utiliza el
                 * neto, caso contrario el importe Total.
                 */
                MDocType docType = new MDocType(getCtx(), factura.getC_DocType_ID(), get_TrxName());
                String letra = recuperaLetra(docType.get_ValueAsInt("LAR_DocumentLetter_ID"));
                if (letra.equals("A") || letra.equals("M"))
                    impSujetoaRet = factura.getTotalLines();
                else
                    impSujetoaRet = factura.getGrandTotal();

                // Verificar si el monto sujeto a retención supera el mínimo
                if (impSujetoaRet.compareTo(impMinNoSujeto) > 0)
                {
                    BigDecimal retYaAplicada = (BigDecimal) factura.get_Value("ImporteRetencionIIBB");
                    if (retYaAplicada == null)
                        retYaAplicada = Env.ZERO;
                    // Se calculala retención
                    BigDecimal impRetCalculada = impSujetoaRet.multiply(aliquot).divide(Env.ONEHUNDRED)
                            .setScale(2, BigDecimal.ROUND_HALF_EVEN);

                    // Se verifica si la retención en este factura ya fue aplicada al 100%
                    if (retYaAplicada.compareTo(impRetCalculada) >= 0)
                    {
                        // La factura tiene aplicado el total de la retención
                        {
                            impRetencion = Env.ZERO;
                            continue;
                        }
                    }
                    impSujetoTotal = impSujetoTotal.add(impSujetoaRet);
                    BigDecimal retAplicada = impRetCalculada.subtract(retYaAplicada);
                    impRetencion = impRetencion.add(retAplicada);
                    /*
                     * Se asigna el número de factura para registrar en el cetificado
                     * Tambien se utiliza para registrar el importe de la retención en la
                     * factura. --> Solo se setea la factura si se está completando la cabecera,
                     * , si sólo se está calculando no se debe registrar la retención en la factura.
                     */
                    if (registrarRetIIBB)
                    {
                        // Como pueden ser varias facturas se crea un KeNamePair
                        // con el ID de la factura y el importe retenido
                        facturaID_Cert.add(new SimpleImmutableEntry<Integer, BigDecimal>(factura
                                .getC_Invoice_ID(), retAplicada));
                    }
                }
                else
                    impRetencion = Env.ZERO;
            } // Se recorren las facturas de la OP
        } // Retención sobre las facturas
        // Se asigna el importe sujeto a retención acumulado
        impSujetoaRet = impSujetoTotal;
        return impRetencion;
    } //calculaRetencionIIBB

    /**
     * Constructor tradicional para una cabecera de cobros/pagos
     *
     * @param ctx
     *        contexto
     * @param LAR_PaymentHeader_ID
     *        ID de la cabecera a crear o 0 si es nueva
     * @param trxName
     *        nombre de la transacción
     */
	public MLARPaymentHeader (Properties ctx, int LAR_PaymentHeader_ID, String trxName)
	{
		super (ctx, LAR_PaymentHeader_ID, trxName);
	}	//	MLARPaymentHeader

    /**
     * Constructor de carga para las cabecera de cobros/pagos
     *
     * @param ctx
     *        contexto
     * @param rs
     *        result conjunto de resultado (jdbc)
     * @param trxName
     *        nombre de la transaction
     */
	public MLARPaymentHeader (Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}	//	MLARPaymentHeader

	@Override
	protected boolean beforeSave(boolean newRecord)
	{
		if(!newRecord)
		{
			MPayment[] pays = getPayments(get_TrxName());

            for (int i = 0; i < pays.length; i++)
			{
                // Se setea el tipo y número de documento
                // únicamente cuando no es un pago retención.
                if (!pays[i].get_ValueAsBoolean("EsRetencionIIBB"))
                {
                    pays[i].setC_DocType_ID(getC_DocType_ID());
                    pays[i].setDocumentNo(getDocumentNo());
                }
				pays[i].setDateTrx(getDateTrx());
				pays[i].setDateAcct(getDateTrx());
				pays[i].setC_BPartner_ID(getC_BPartner_ID());
				pays[i].setIsReceipt(isReceipt());
				pays[i].setIsActive(isActive());
				if(!pays[i].save(get_TrxName()))
				{
					try
					{
						DB.rollback(false, get_TrxName());
					}
					catch (SQLException e)
					{
					    log.log(Level.SEVERE, e.getLocalizedMessage(), e);
					}
					return false;
				}
			}
		}
		return true;
	} // beforeSave

	/**
	 * @param success
	 */
	@Override
	protected boolean afterDelete(boolean success)
	{
		if(success)
		{
            // Se eliminan los pagos asociados a la cabecera
            final MPayment[] pays = getPayments(get_TrxName());
            for (int i = 0; i < pays.length; i++)
            {
                if (!pays[i].delete(false, get_TrxName()))
                {
                    String msg = "No se pudo eliminar alguno de los pagos cargados en el documento que"
                            + "se está eliminando. Se cancelará la operación";
                    log.severe(msg);
                    ADialog.error(0, null, msg);
                    return false;
                }
            }
            // Se eliminan los registros de facturas asociados a la cabecera
            final MPaymentAllocate[] facturas = getInvoices(get_TrxName());
            for (int i = 0; i < facturas.length; i++)
            {
                if (!facturas[i].delete(false, get_TrxName()))
                {
                    String msg = "No se pudo eliminar alguno de las facturas cargadas en el documento que"
                            + "se está eliminando. Se cancelará la operación";
                    log.severe(msg);
                    ADialog.error(0, null, msg);
                    return false;
                }
            }
        }
        return success;
	} // afterDelete

	/**
	 * Devuelve un array con todos los payments vinculados a la cabecera
	 * @param trxName
	 * @return MPayment[] array con los pagos vinculados al documento
	 * @throws SQLException
	 */
	public MPayment[] getPayments(String trxName)
	{
	    //TODO - Analize genereate a cache for this payments
		List<MPayment> pays = new ArrayList<MPayment>();
		// @mzuniga -  Se Agrega la condición de ordenamiento, recupera primero las retenciones (sufridas y efectuadas).
        String sql = "SELECT * FROM C_Payment WHERE LAR_PaymentHeader_ID = ? ORDER BY EsRetencionSufrida DESC, EsRetencionIIBB DESC, C_Payment_ID ASC";

		PreparedStatement pstmt;
		pstmt = DB.prepareStatement(sql, trxName);
		ResultSet rs=null;

		try
		{
		    pstmt.setInt(1, getLAR_PaymentHeader_ID());
			rs = pstmt.executeQuery();
			while(rs.next())
				pays.add(new MPayment(getCtx(),rs,trxName));

			return pays.toArray(new MPayment[pays.size()]);
		}
		catch (SQLException e)
		{
			log.log(Level.SEVERE, sql, e);
			return new MPayment[0];
		}
		finally
		{
			DB.close(rs, pstmt);
			rs = null; pstmt = null;
		}
	} // getPayments

	/**
	 * 	Process document
	 *	@param processAction document action
	 *	@return true if performed
	 */
	public boolean processIt (String processAction)
	{
        m_processMsg = null;
        DocumentEngine engine = new DocumentEngine (this, getDocStatus());
        return engine.processIt (processAction, getDocAction());
	}	//	processIt


    @Override
    public boolean unlockIt()
    {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean invalidateIt()
    {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public String prepareIt()
    {
        // Se está copletando el documento
        // Se deben registrar en las facturas el importe retenido de IIBB
        registrarRetIIBB = true;

        log.info(toString());
        // Dispara la validación del documento
        m_processMsg = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_BEFORE_PREPARE);
        if (m_processMsg != null)
            return DocAction.STATUS_Invalid;

        // Validar que la cabecera tiene al menos un cobro/pago
        MPayment[] pays = getPayments(get_TrxName());
        if (pays.length == 0)
        {
            ADialog.error(0, null, "La cabecera no tiene cobros/pagos");
            return DocAction.STATUS_Invalid;
        }
        // Recibos: Validar que la suma de los Pagos Retención sea >=
        // que la suma del importe abierto (impago) de las facturas
        // @begin
        if (this.isReceipt())
        {
            BigDecimal sumPagosRet = Env.ZERO;
            for (int p = 0; p < pays.length; p++)
                if (pays[p].get_ValueAsBoolean("EsRetencionSufrida"))
                    sumPagosRet = sumPagosRet.add(pays[p].getWriteOffAmt());
            // Si existen Cobros Retención
            if (!(sumPagosRet.compareTo(Env.ZERO) == 0))
            {
                MPaymentAllocate[] invoices = getInvoices(get_TrxName());
                BigDecimal sumaFacturas = Env.ZERO;
                for (int i = 0; i < invoices.length; i++)
                {
                    // @fchiappano Si se trata de una factura en moneda
                    // extranjera, realizar conversión de moneda.
                    MCurrency moneda = (MCurrency) invoices[i].getC_Invoice().getC_Currency();
                    if (moneda.getC_Currency_ID() != LAR_Utils.getMonedaPredeterminada(p_ctx, getAD_Client_ID(),
                            get_TrxName()))
                    {
                        BigDecimal tasaCambio = (BigDecimal) get_Value("TasaDeCambio");
                        sumaFacturas = sumaFacturas.add(invoices[i].getAmount().multiply(tasaCambio).setScale(moneda.getStdPrecision(), RoundingMode.HALF_UP));
                    }
                    else
                        sumaFacturas = sumaFacturas.add(invoices[i].getAmount());
                }

                if (sumaFacturas.compareTo(sumPagosRet) == -1)
                {
                    ADialog.error(0, null,
                            "El importe de las Retenciones es mayor que el de las Facturas");
                    return DocAction.STATUS_Invalid;
                }
            }
        }
        // @end

        // Dispara la validación del documento
        m_processMsg = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_AFTER_PREPARE);
        if (m_processMsg != null)
            return DocAction.STATUS_Invalid;

        m_justPrepared = true;
        if (!DOCACTION_Complete.equals(getDocAction()))
            setDocAction(DOCACTION_Complete);
        return DocAction.STATUS_InProgress;
    }

    @Override
    public boolean approveIt()
    {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean rejectIt()
    {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public String completeIt()
    {
        log.info(toString());

        //  Re-Check
        if (!m_justPrepared)
        {
            String status = prepareIt();
            if (!DocAction.STATUS_InProgress.equals(status))
                return status;
        }

        // Dispara la validación del documento
        m_processMsg = ModelValidationEngine.get().fireDocValidate(this,
                ModelValidator.TIMING_BEFORE_COMPLETE);
        if (m_processMsg != null)
            return DocAction.STATUS_Invalid;

        // @fchiappano variable para acumular los descuentos en los cobros/pagos.
        BigDecimal descuento = Env.ZERO;
        BigDecimal montoAsignadoNC = Env.ZERO;

        MPayment[] pays = getPayments(get_TrxName());
        int p = 0;
        for (; p < pays.length; p++)
        {
            pays[p].setDateAcct(getDateTrx());
            pays[p].setDateTrx(getCreated());
            pays[p].setTrxType(MPayment.TRXTYPE_CreditPayment);
            pays[p].processIt(ACTION_Complete);
            pays[p].save(get_TrxName());
            if (!DOCSTATUS_Completed.equals(pays[p].getDocStatus()))
            {
                m_processMsg = "@C_Payment_ID@: " + pays[p].getProcessMsg();
                return DocAction.STATUS_Invalid;
            }

            // @fchiappano Acumular el descuento, para posteriormente generar la NC correspondiente.
            descuento = descuento.add(pays[p].getDiscountAmt());
        }
        // Asigna los cobros/pagos a las facturas
        MPaymentAllocate[] invoices = getInvoices(get_TrxName());
        if (invoices.length != 0)
        {
            // @fchiappano Generar Nota de Crédito, por los descuentos por pago en termino.
            if (descuento.compareTo(Env.ZERO) > 0 && isReceipt() && !generarNC.equals("D"))
            {
                String mensaje = generarNotaCredito(descuento, invoices[0].getInvoice());
                if (!mensaje.equals("") && !mensaje.equals(null))
                {
                    m_processMsg = mensaje;
                    return DocAction.STATUS_Invalid;
                }
            } // @fchiappano Fin de generación de NC.

            p = 0;
            // Asignaciones
            for (int i = 0; (i < invoices.length && p < pays.length);)
            {
                // @fchiappano crear cabecera de asignación, con la moneda de la factura.
                MPaymentAllocate pa = invoices[i];
                MInvoice invoice = new MInvoice(Env.getCtx(), pa.getC_Invoice_ID(), get_TrxName());

                MAllocationHdr alloc = new MAllocationHdr(getCtx(), false, getDateTrx(),
                        invoice.getC_Currency_ID(), "Asignación Pagos a Facturas - Cabecera: "
                                + getDocumentNo(), get_TrxName());
                alloc.setAD_Org_ID(getAD_Org_ID());
                if (!alloc.save())
                {
                    log.severe("La Cabecera de Asignacion no pudo crearse");
                    return DocAction.STATUS_Invalid;
                }

                BigDecimal impPago = pays[p].getPayAmt().add(pays[p].getWriteOffAmt());

                // @fchiappano Si la moneda de la factura, es distinta de la
                // moneda predeterminada, realizo la conversión.
                boolean impMinimo = false;
                if (invoice.getC_Currency_ID() != getC_Currency_ID())
                {
                    BigDecimal tasaCambio = (BigDecimal) get_Value("TasaDeCambio");

                    if (tasaCambio != null)
                    {
                        impPago = impPago.divide(tasaCambio, 4, RoundingMode.FLOOR);

                        BigDecimal min = Env.ONE.divide(new BigDecimal(10), 1, RoundingMode.FLOOR);
                        min = min.pow(invoice.getC_Currency().getStdPrecision());

                        if (impPago.compareTo(min) < 0)
                            impMinimo = true;
                    }
                }

                // @fchiappano Obtener el importe asignado pero sin conversion de moneda.
                impPago = impPago.subtract(pays[p].getLAR_AllocatedAmt().abs());
                final BigDecimal importeFactura = invoice.getOpenAmt().subtract(pa.getDiscountAmt());
                int comp = impPago.compareTo(importeFactura);
                MAllocationLine aLine = null;
                BigDecimal alineOUAmt = Env.ZERO;
                BigDecimal alineAmt;
                // Evita Sobrepagos
                // @fchiappano si la factura es en dolare, y importe del pago es
                // menor al minimo, utilizar el importe del pago para realizar
                // la asignacion.
                if (comp <= 0 || impMinimo)
                    alineAmt = impPago;
                else
                    alineAmt = importeFactura;
                alineOUAmt = importeFactura.subtract(impPago);
                if (isReceipt())
                    aLine = new MAllocationLine(alloc, alineAmt, Env.ZERO,
                            pa.getWriteOffAmt(), alineOUAmt);
                else
                    aLine = new MAllocationLine(alloc, alineAmt.negate(), Env.ZERO
                            , pa.getWriteOffAmt().negate(), alineOUAmt);
                aLine.setDocInfo(pa.getC_BPartner_ID(), 0, pa.getC_Invoice_ID());
                aLine.setPaymentInfo(pays[p].getC_Payment_ID(), 0);

                // @fchiappano setear la tasa de cambio de la cabecera del recibo, en la linea de asignación.
                aLine.set_ValueOfColumn("TasaDeCambio", get_Value("TasaDeCambio"));

                if (!aLine.save(get_TrxName()))
                    log.warning("Asignación: No se pudo guradar la línea");
                else
                {
                    pa.setC_AllocationLine_ID(aLine.getC_AllocationLine_ID());
                    pa.saveEx();
                }
                if (comp >= 0)
                {
                    // @fchiappano Antes de pasar a la siguiente factura,
                    // chequear si existe un descuento por pago en termino y
                    // generar la asignación de la NC correspondiente.
                    if (pa.getDiscountAmt().compareTo(Env.ZERO) > 0 && notaCredito != null && generarNC.equals("A"))
                    {
                        String mensaje = generarAsignacionNC(pa.getDiscountAmt(), montoAsignadoNC, notaCredito, pa.getInvoice());
                        if (!mensaje.equals("") && !mensaje.equals(null))
                        {
                            log.severe(mensaje);
                            m_processMsg = mensaje;
                            return DocAction.STATUS_Invalid;
                        }

                        // @fchiappano acumular monto asignado.
                        montoAsignadoNC = montoAsignadoNC.add(pa.getDiscountAmt());
                    }

                    i = i + 1;
                    if (comp == 0)
                        p = p + 1;
                } else
                    p = p + 1;
                // Cabecera de Asignación: Comienzo de WF
                alloc.processIt(DocAction.ACTION_Complete);
                alloc.save(get_TrxName());
                m_processMsg = "@C_AllocationHdr_ID@: " + alloc.getDocumentNo();
                log.fine(m_processMsg);
            }
        }

        // @fchiappano Recorrer y procesar asignaciones de NC.
        for (MAllocationHdr asignacion : asignacionesNC)
        {
            if (!asignacion.processIt(DocAction.ACTION_Complete))
                return "Error al procesar Asginación de Nota de Crédito: " + asignacion.getProcessMsg();

            if (!asignacion.save(get_TrxName()))
                return "Error al actualizar Asignación de Nota de Crédito.";

            // @fchiappano activar cabecera de asignacion.
            DB.executeUpdate("UPDATE C_AllocationHdr SET IsActive = 'Y' WHERE C_AllocationHdr_ID = ?", asignacion.getC_AllocationHdr_ID(), get_TrxName());
        }

        // @fchiappano vaciar lista.
        asignacionesNC.removeAll(asignacionesNC);

        // setC_BankAccount_ID(C_BankAccount_ID);
        // Dispara la validación del documento
        m_processMsg = ModelValidationEngine.get().fireDocValidate(this,
                ModelValidator.TIMING_AFTER_COMPLETE);
        if (m_processMsg != null)
            return DocAction.STATUS_Invalid;
        // @mzuniga - Marca los cobros/pagos como asignados si corresponde
        for (p = 0; p < pays.length; p++)
        {
            pays[p].testAllocation();
            pays[p].saveEx();
        }
        setDocStatus(ACTION_Complete);
        setDocAction(DOCACTION_Close);
        setProcessed(true);

        // Marca los Certificados de Retención como Procesados
        if (!isReceipt())
        {
            final MLARPaymentWithholding[] certificados = MLARPaymentWithholding.get(this);
            if (certificados.length > 0)
                for (final MLARPaymentWithholding c : certificados)
                    c.setProcessed(true);
        }
        return DocAction.STATUS_Completed;
    } // completeIt

    @Override
    public boolean voidIt()
    {
        log.info(toString());

        // Dispara la validación del documento
        m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_BEFORE_VOID);
        if (m_processMsg != null)
            return false;

        // Se descuenta el importe retenido de la factura
        MLARPaymentWithholdingLine[] certLineas = obtenerLineasCertificados(get_TrxName());
        for (int i=0; i < certLineas.length; i++)
        {
            MInvoice factura = new MInvoice(getCtx(), certLineas[i].getC_Invoice_ID(), get_TrxName());
            BigDecimal retAplicada = (BigDecimal) factura.get_Value("ImporteRetencionIIBB");
            factura.set_CustomColumn("ImporteRetencionIIBB", retAplicada.subtract(certLineas[i].getTaxAmt()));
            if (!factura.save(get_TrxName()))
            {
                m_processMsg = "Error al descontar la retenci\u00f3n en la factura";
                log.severe(m_processMsg);
                return false;
            }
        }
        // Cheque si ya fue procesado
        if (DOCSTATUS_Closed.equals(getDocStatus()) || DOCSTATUS_Voided.equals(getDocStatus()))
        {
            m_processMsg = "Documento cerrado: " + getDocStatus();
            setDocAction(DOCACTION_None);
            return false;
        }

        // Procesa la anulación
        // NOTA: No se tiene el concepto de "reversión" de las cabeceras de cobros/pagos.
        MPayment[] pays = getPayments(get_TrxName());

        for(int i = 0; i < pays.length; i++)
        {
            pays[i].processIt(ACTION_Void);
            pays[i].save(get_TrxName());
            if (!DOCSTATUS_Voided.equals(pays[i].getDocStatus()))
            {
                m_processMsg = "@C_Payment_ID@: " + pays[i].getProcessMsg();
                return false;
            }
        }

        // Dispara la validación del documento
        m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_AFTER_VOID);
        if (m_processMsg != null)
            return false;

        setProcessed(true);
        setDocStatus(ACTION_Void);
        setDocAction(DOCACTION_None);
        return true;
    }

    @Override
    public boolean closeIt()
    {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean reverseCorrectIt()
    {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean reverseAccrualIt()
    {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean reActivateIt()
    {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public String getSummary()
    {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public String getDocumentInfo()
    {
        return "Cabecera " + getDocumentNo();
    }

    @Override
    public File createPDF()
    {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Operación no soportada");
    }

    @Override
    public String getProcessMsg()
    {
        return m_processMsg;
    }

    @Override
    public int getDoc_User_ID()
    {
        return getCreatedBy();
    }

    @Override
    public int getC_Currency_ID()
    {
        // TODO - Si es necesario, agregar la columna C_Currency_ID a la
        //        tabla LAR_PaymentHeader y generar el modelo nuevamente
        return Env.getContextAsInt(getCtx(), "$C_Currency_ID"); // ARS
    }

    @Override
    public BigDecimal getApprovalAmt()
    {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Operación no soportada");
    }

    @Override
    public int customizeValidActions(String docStatus, Object processing, String orderType, String isSOTrx, int AD_Table_ID,
            String[] docAction, String[] options, int index)
    {
        // Este método permite agregar las acciones necesarias para
        // operar con el documento "cabecera"
        if (AD_Table_ID == Table_ID)
        {
            //  Complete
            if (docStatus.equals(DocumentEngine.STATUS_Completed))
                options[index++] = DocumentEngine.ACTION_Void;
        }
        return index;
    }

	@Override
	public String toString()
	{
        StringBuffer sb = new StringBuffer ("MLARPaymentHeader[");
        sb.append(get_ID()).append("-").append(getDocumentNo())
            .append(",Receipt=").append(isReceipt())
            .append(",DocStatus=").append(getDocStatus())
            .append ("]");
        return sb.toString ();
	}

    public MPaymentAllocate[] getInvoices(String trxName)
    {
        // TODO - Analize genereate a cache for this invoices
        List<MPaymentAllocate> invoices = new ArrayList<MPaymentAllocate>();

        String sql = "SELECT * FROM C_PaymentAllocate WHERE LAR_PaymentHeader_ID = ? ORDER BY C_PaymentAllocate_ID";

        PreparedStatement pstmt;
        pstmt = DB.prepareStatement(sql, trxName);
        ResultSet rs = null;

        try
        {
            pstmt.setInt(1, getLAR_PaymentHeader_ID());
            rs = pstmt.executeQuery();
            while (rs.next())
                invoices.add(new MPaymentAllocate(getCtx(), rs, trxName));

            return invoices.toArray(new MPaymentAllocate[invoices.size()]);
        } catch (SQLException e)
        {
            log.log(Level.SEVERE, sql, e);
            return new MPaymentAllocate[0];
        } finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
    } // getInvoices

    /**
     * Devuelve un array con todas las líneas de certtificados vinculados a la cabecera
     * @param trxName
     * @return MLARPaymentWithholdingLine[] array con líneas de certificado
     * @throws SQLException
     */
    public MLARPaymentWithholdingLine[] obtenerLineasCertificados(String trxName)
    {
        List<MLARPaymentWithholdingLine> certLineas = new ArrayList<MLARPaymentWithholdingLine>();

        String sql = "SELECT * FROM LAR_PaymentWithholdingLine"
                  + " WHERE LAR_PaymentWithholding_ID IN"
                  + " (SELECT LAR_PaymentWithholding_ID FROM LAR_PaymentWithholding WHERE LAR_PaymentHeader_ID = ?)";

        PreparedStatement pstmt;
        pstmt = DB.prepareStatement(sql, trxName);
        ResultSet rs = null;

        try
        {
            pstmt.setInt(1, getLAR_PaymentHeader_ID());
            rs = pstmt.executeQuery();
            while (rs.next())
                certLineas.add(new MLARPaymentWithholdingLine(getCtx(), rs, trxName));

            return certLineas.toArray(new MLARPaymentWithholdingLine[certLineas.size()]);
        } catch (SQLException e)
        {
            log.log(Level.SEVERE, sql, e);
            return new MLARPaymentWithholdingLine[0];
        } finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
    } // obtenerLineasCertificados

    /*
     * Borra los registros de retención (Certificados) asociados a una cabecera.
     */
    public String BorrarCertificadosdeRetenciondelHeader()
    {
        // Chequear que es una operación de Compras
        if (this.isReceipt())
            return null;

        int mLARaymentHeader_ID = getLAR_PaymentHeader_ID();
        log.info("Borrar las líneas de los certificados de retenci\u00f3n de la Orden de Pago: " + mLARaymentHeader_ID);
        String sql = "DELETE FROM LAR_PaymentWithholdingLine WHERE LAR_PaymentWithholding_ID IN (SELECT LAR_PaymentWithholding_ID FROM LAR_PaymentWithholding WHERE LAR_PaymentHeader_ID=?)";
        PreparedStatement pstmt = null;
        try
        {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setInt(1, mLARaymentHeader_ID);
            pstmt.executeUpdate();
        } catch (Exception e)
        {
            log.log(Level.SEVERE, sql, e);
            return e.getMessage();
        } finally
        {
            DB.close(pstmt);
            pstmt = null;
        }
        log.info("Borrar los certificados de retenci\u00f3n de la Orden de Pago: " + mLARaymentHeader_ID);
        sql = "DELETE FROM LAR_PaymentWithholding WHERE LAR_PaymentHeader_ID=?";
        pstmt = null;
        try
        {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setInt(1, mLARaymentHeader_ID);
            pstmt.executeUpdate();
        } catch (Exception e)
        {
            log.log(Level.SEVERE, sql, e);
            return e.getMessage();
        } finally
        {
            DB.close(pstmt);
            pstmt = null;
        }
        return null;
    } // BorrarCertificadosdeRetenciondelHeader

    /*
     * Borra los Pagos Retención asociados a una cabecera.
     */
    public String BorrarPagosRetenciondelHeader()
    {
        // Chequear que es una operación de Compras
        if (this.isReceipt())
            return null;

        int mLARaymentHeader_ID = getLAR_PaymentHeader_ID();
        log.info("Borrar los pagos retenci/u00f3n de la cabecera: " + mLARaymentHeader_ID);
        String sql = "DELETE FROM C_Payment WHERE LAR_PaymentHeader_ID=? AND EsRetencionIIBB='Y'";
        PreparedStatement pstmt = null;
        try
        {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setInt(1, mLARaymentHeader_ID);
            pstmt.executeUpdate();
        } catch (Exception e)
        {
            log.log(Level.SEVERE, sql, e);
            return e.getMessage();
        } finally
        {
            DB.close(pstmt);
            pstmt = null;
        }
        return null;
    } // BorrarPagosRetenciondelHeader

    /**
     * Crea el pago "retención" necesario para procesar la cabecera de pago
     * 
     * @param impRetencion
     *        Importe de la retención.
     * @param c_Charge_ID
     *        Cargo del tipo de retención para utilizar en el pago.
     * @param c_DocType_ID
     *        Tipo de documento (retención) para utilizar en el pago.
     * @param pago
     *        Pago sobre el cual se descontará el importe de la retención.
     * @param compensa
     *        Determina si se debe compensar el importe de la retención.
     * @return pago retencion.
     */
    public MPayment creaPagoRetencion(BigDecimal impRetencion, int c_Charge_ID, int c_DocType,
            MPayment pago, Boolean compensa)
    {
        // Se compensa el importe de la retención en el pago recibido
        if (compensa)
        {
            if (pago == null)
            {
                JDialog dialog = new JDialog();
                dialog.setIconImage(Adempiere.getImage16());
                ADialog.warn(1, dialog,
                        "No existe un pago que permita compensar el importe de la retenci\u00f3n");
                return null;

            }
            // Se actualiza el total del pago compensado directamente vía SQL
            // para evitar que se dispare el recálculo de retenciones
            setPayAmtDirectly(pago, pago.getPayAmt().subtract(impRetencion));
        }
        final MPayment pagoRetencion = new MPayment(getCtx(), 0, get_TrxName());
        pagoRetencion.setC_DocType_ID(c_DocType);

        // Se concatena el tipo de retención al Nro. de cobro
        if (c_Charge_ID > 0)
        {
            MCharge cargo = new MCharge(getCtx(), c_Charge_ID, get_TrxName());
            int indice = cargo.getName().indexOf("Retención");
            String tipoRet = "";
            if (indice >= 0)
                tipoRet = cargo.getName().substring(indice + 10);
            pagoRetencion.setDocumentNo(getDocumentNo() + "-Ret. " + tipoRet);
        }
        else
            pagoRetencion.setDocumentNo(getDocumentNo());

        pagoRetencion.setC_Currency_ID(getC_Currency_ID());
        pagoRetencion.setC_BankAccount_ID(getC_BankAccount_ID());
        pagoRetencion.setC_BPartner_ID(getC_BPartner_ID());
        pagoRetencion.setAD_Org_ID(getAD_Org_ID());
        pagoRetencion.setIsReceipt(false);
        pagoRetencion.setIsAllocated(false);
        pagoRetencion.setIsReconciled(true);
        // Este campo determina que es una retención generada
        pagoRetencion.set_ValueOfColumn("EsRetencionIIBB", true);
        pagoRetencion.set_ValueOfColumn("LAR_PaymentHeader_ID", getLAR_PaymentHeader_ID());
        pagoRetencion.setTenderType(MPayment.TENDERTYPE_Cash);
        pagoRetencion.setPayAmt(impRetencion);
        pagoRetencion.setC_Charge_ID(c_Charge_ID);
        if (!pagoRetencion.save(get_TrxName()))
            return null;

        return pagoRetencion;
    } // creaPagoRetencion

    /**
     * Crea el certificado de retención asociado a la retención aplicable
     * 
     * @param impRetencion
     *        Importe de la retención.
     * @param Configuración
     *        de retención aplicable.
     * @return Certificado de Retención.
     */
    public MLARPaymentWithholding creaCertificadodeRetencion(final BigDecimal impRetencion, final BigDecimal baseRet,
            final WithholdingConfig wc, final int c_Payment_ID, final List<SimpleImmutableEntry<Integer, BigDecimal>> facturas, String docNo, int c_DocType)
    {
        final MLARPaymentWithholding pwh = new MLARPaymentWithholding(getCtx(), 0, get_TrxName());

        Timestamp date = getDateTrx();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int year = calendar.get(Calendar.YEAR);
        MOrg org = new MOrg(getCtx(), getAD_Org_ID(), get_TrxName());
        String nroCert = org.getDescription() + "-" + year + "-" + docNo;
        pwh.set_CustomColumn("Documentno", nroCert);
        pwh.setLAR_PaymentHeader_ID(getLAR_PaymentHeader_ID());
        pwh.setC_Tax_ID(wc.getC_Tax_ID());
        pwh.setDateAcct(getDateTrx());
        pwh.setDateTrx(getDateTrx());
        pwh.setLCO_WithholdingRule_ID(wc.getWithholdingRule_ID());
        pwh.setLCO_WithholdingType_ID(wc.getWithholdingType_ID());
        pwh.setPercent(wc.getAliquot());
        pwh.setProcessed(false);
        pwh.setTaxAmt(impRetencion);
        pwh.setTaxBaseAmt(baseRet);

        // Se asocia el Pago Retención con el Certificado
        pwh.set_ValueOfColumn("C_Payment_ID", c_Payment_ID);

        // Cuando se guarda la retención, se actualiza la cabecera
        // de pago mediante MLARPaymentWithholding.afterSave()
        if (!pwh.save(get_TrxName()))
            return null;

        // Registrar las facturas en el certificado
        if (facturas != null && facturas.size() > 0)
            for (int i = 0; i < facturaID_Cert.size(); i++)
            {
                final MLARPaymentWithholdingLine pwhLine = new MLARPaymentWithholdingLine(getCtx(), 0, get_TrxName());
                pwhLine.set_ValueOfColumn("C_Invoice_ID", facturas.get(i).getKey());
                pwhLine.setLAR_PaymentWithholding_ID(pwh.getLAR_PaymentWithholding_ID());
                pwhLine.setPercent(wc.getAliquot());
                pwhLine.setProcessed(false);
                pwhLine.setTaxAmt(facturas.get(i).getValue());
                /*
                 * Se calcula el importe sujeto a retención. Si es factura A o M se utiliza el
                 * neto, caso contrario el importe Total.
                 */
                BigDecimal baseRetFc = Env.ZERO;
                MInvoice factura = new MInvoice(getCtx(), facturas.get(i).getKey(), get_TrxName());
                MDocType docType = new MDocType(getCtx(), factura.getC_DocType_ID(), get_TrxName());
                String letra = recuperaLetra(docType.get_ValueAsInt("LAR_DocumentLetter_ID"));
                if (letra.equals("A") || letra.equals("M"))
                    baseRetFc = factura.getTotalLines();
                else
                    baseRetFc = factura.getGrandTotal();
                pwhLine.setTaxBaseAmt(baseRetFc);

                // Grabar la línea
                if (!pwhLine.save(get_TrxName()))
                    return null;
            }

        return pwh;
    } // creaCertificadodeRetencion

    /**
     * Calcula el importe de pagos acumulados
     * para el proveedor en el mes corriente
     * 
     * @param bp
     *        Proveedor.
     * @return Importe pagado acumulado
     *         -1 si hay error
     */
    public BigDecimal calculaImportePagado(MBPartner bp )
{
    BigDecimal impPagado = Env.ZERO;
    try
    {
        String sqlMNS = "SELECT COALESCE(SUM(COALESCE(PayHeaderTotalAmt, 0)), 0) AS pagado "
                     + "FROM LAR_PaymentHeader "
                     + "WHERE C_BPartner_ID = ? "
                     + "AND DocStatus IN ('CO', 'CL') "
                     + "AND date_part('month', DateTrx) = date_part('month', ?::timestamp)"
                     + "AND date_part('year', DateTrx) = date_part('year', ?::timestamp)";
        PreparedStatement pstmtMNS = DB.prepareStatement(sqlMNS, get_TrxName());

        pstmtMNS.setInt(1, getC_BPartner_ID());
        pstmtMNS.setTimestamp(2, getDateTrx());
        pstmtMNS.setTimestamp(3, getDateTrx());

        ResultSet rsMNS = pstmtMNS.executeQuery();
        if (rsMNS.next())
        {
            impPagado = rsMNS.getBigDecimal("pagado");
        } else
        {
            log.warning("No es posible recuperar los pagos realizados en el mes corriente para el proveedor: "
                    + bp.getName());
            rsMNS.close();
            pstmtMNS.close();
            return new BigDecimal (-1);
        }
        rsMNS.close();
        pstmtMNS.close();
    } catch (SQLException e)
    {
        log.log(Level.SEVERE, "", e);
        return new BigDecimal (-1);
    }
    // Se le quita el % IVA correspondiente al importe pagado acumulado
    return impPagado.divide(coef_IVA, 2, RoundingMode.HALF_EVEN);
} // CalculaImporteAcumulado

    /**
     * Recupera la letra desde LAR_DocumentLetter utilizando el ID
     * 
     * @param lar_DocumentLetter_ID
     *        ID de la letra.
     * @return Letra
     */
    public String recuperaLetra(int lar_DocumentLetter_ID)
    {
        String letra = "";
        try
        {
            String sql = "SELECT COALESCE(Letter, '') AS letra " + "FROM LAR_DocumentLetter "
                    + "WHERE LAR_DocumentLetter_ID = ? ";

            PreparedStatement pstmt = DB.prepareStatement(sql, get_TrxName());

            pstmt.setInt(1, lar_DocumentLetter_ID);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next())
            {
                letra = rs.getString("letra");
            } else
            {
                log.warning("No es posible recuperar la letra desde el tipo de documento.");
                rs.close();
                pstmt.close();
                return "";
            }
            rs.close();
            pstmt.close();
        } catch (SQLException e)
        {
            log.log(Level.SEVERE, "", e);
            return "";
        }
        return letra;
    } // recuperaLetra

    /**
     * Generar nota de crédito, por pago en termino.
     *
     * @author fchiappano
     * @param descuento
     * @param facturaOrigen
     * @return notaCredito
     */
    private String generarNotaCredito(final BigDecimal descuento, final MInvoice facturaOrigen)
    {
        if (facturaOrigen == null)
            return "No fue posible, recuperar una Factura Origen.";

        // @fchiappano Recuperar cargo a utilizar.
        int cargo_ID = MSysConfig.getIntValue("LAR_CargoNCAutomatica_Recibo", 0, getAD_Client_ID());
        if (cargo_ID <= 0)
            return "No fue posible recuperar el cargo a utilizar en Nota de Crédito.";

        // @fchiappano Recuperar el impuesto del cargo.
        int impuesto_ID = Tax.getCharge(p_ctx, cargo_ID, getDateTrx(), getDateTrx(), getAD_Org_ID(),
                Env.getContextAsInt(getCtx(), "#M_Warehouse_ID"), facturaOrigen.getC_BPartner_Location_ID(),
                facturaOrigen.getC_BPartner_Location_ID(), true);
        if (impuesto_ID <= 0)
            return "No fue posible recuperar el impuesto a utilizar en Nota de Crédito.";

        // @fchiappano Recuperar el tipo de documento a utilizar.
        final FindInvoiceDocType findDocType = new FindInvoiceDocType((MBPartner) getC_BPartner(),
                facturaOrigen.get_ValueAsInt("C_Pos_ID"), facturaOrigen.getAD_Org_ID(),
                MDocType.DOCBASETYPE_ARCreditMemo);

        // @fchiappano Crear cabecera de nota de crédito.
        notaCredito = new MInvoice(p_ctx, 0, get_TrxName());
        notaCredito.setAD_Org_ID(getAD_Org_ID());
        notaCredito.setDescription(get_ValueAsString("Description"));
        notaCredito.setC_BPartner_ID(getC_BPartner_ID());
        notaCredito.setGrandTotal(descuento);
        notaCredito.setIsSOTrx(true);
        notaCredito.setC_DocTypeTarget_ID(findDocType.getDocType().getC_DocType_ID());
        notaCredito.set_ValueOfColumn("C_Pos_ID", facturaOrigen.get_ValueAsInt("C_Pos_ID"));

        // @fchiappano datos a recuperar desde la factura origen.
        notaCredito.setSalesRep_ID(facturaOrigen.getSalesRep_ID());
        notaCredito.setC_BPartner_Location_ID(facturaOrigen.getC_BPartner_Location_ID());
        notaCredito.setAD_User_ID(facturaOrigen.getAD_User_ID());
        notaCredito.setC_Currency_ID(facturaOrigen.getC_Currency_ID());
        notaCredito.setIsTaxIncluded(facturaOrigen.isTaxIncluded());
        notaCredito.setM_PriceList_ID(facturaOrigen.getM_PriceList_ID());
        notaCredito.setC_Project_ID(facturaOrigen.getC_Project_ID());
        notaCredito.setC_Activity_ID(facturaOrigen.getC_Activity_ID());
        notaCredito.setC_Campaign_ID(facturaOrigen.getC_Campaign_ID());
        notaCredito.setUser1_ID(facturaOrigen.getUser1_ID());
        notaCredito.setUser2_ID(facturaOrigen.getUser2_ID());
        notaCredito.setPaymentRule(facturaOrigen.getPaymentRule());

        if (!notaCredito.save(get_TrxName()))
            return "No fue posible crear la Nota de Crédito por pago en termino.";

        // @fchiappano Crear línea de Nota de Credito.
        MInvoiceLine linea = new MInvoiceLine(notaCredito);
        linea.setC_Charge_ID(cargo_ID);
        linea.setC_Tax_ID(impuesto_ID);
        linea.setQty(Env.ONE);
        BigDecimal impuesto = new MTax(p_ctx, impuesto_ID, get_TrxName()).getRate();
        impuesto = impuesto.divide(Env.ONEHUNDRED, 3, RoundingMode.HALF_UP).add(Env.ONE);
        linea.setPrice(descuento.divide(impuesto, 2, RoundingMode.HALF_UP));

        if (!linea.save(get_TrxName()))
            return "No fue posible crear la línea de Nota de Crédito por pago en termino.";

        // @fchiappano Completar la nota de credito.
        if (generarNC.equals("P") || generarNC.equals("A") && !notaCredito.processIt(DOCACTION_Complete))
            return "Error al procesar Nota de Crédito: " + notaCredito.getProcessMsg();

        // @fchippano Actualizar Nota de Credito.
        if (!notaCredito.save(get_TrxName()))
            return "No fue posible actualizar Nota de Crédito por pago en termino.";

        return "";
    } // generarNotaCredito

    /**
     * Generar Asignación para nota de crédito.
     *
     * @author fchiappano
     * @param amt
     * @param montoAsignado
     * @param notaCredito
     * @param factura
     * @return mensaje.
     */
    private String generarAsignacionNC(final BigDecimal amt, final BigDecimal montoAsignado, final MInvoice notaCredito, final MInvoice factura)
    {
        // @fchiappano si el monto asignado ya igualo al total de la NC, cortar el proceso.
        if (montoAsignado.compareTo(notaCredito.getGrandTotal()) >= 0)
            return "";

        // @fchiappano generar cabecera de asignación.
        MAllocationHdr alloc = new MAllocationHdr(getCtx(), false, getDateTrx(), factura.getC_Currency_ID(),
                "Asignación Nota de Crédito a Facturas - Cabecera: " + getDocumentNo(), get_TrxName());
        alloc.setAD_Org_ID(getAD_Org_ID());
        // @fchiappano dejar la asignación inactiva, de manera que no se tome en cuenta en el testAllocation() de la MInvoice.
        alloc.setIsActive(false);
        if (!alloc.save())
            return "La Cabecera de Asignación de Nota de Crédito no pudo crearse";

        // @fchiappano línea de asignación de nota de crédito
        final MAllocationLine lineNC = new MAllocationLine(alloc);
        lineNC.setAmount(amt.negate());
        lineNC.setDocInfo(getC_BPartner_ID(), 0, notaCredito.getC_Invoice_ID());
        lineNC.set_ValueOfColumn("NotaCredito_ID", notaCredito.getC_Invoice_ID());
        lineNC.saveEx();

        // @fchiappano línea de asignación de la factura.
        final MAllocationLine lineF = new MAllocationLine(alloc);
        lineF.setAmount(amt);
        lineF.setDocInfo(getC_BPartner_ID(), 0, factura.getC_Invoice_ID());
        lineF.saveEx();

        // @fchiappano agregar asignación a la lista de asignaciones de NC.
        asignacionesNC.add(alloc);

        return "";
    } // generarAsignacionNC

}	//	MLARPaymentHeader