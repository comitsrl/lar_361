/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package ar.com.comit.print.javapos;

import java.io.IOException;
import java.io.StringReader;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.swing.text.MaskFormatter;

public class Util
{
    public static final int LEFT = -1;
    public static final int CENTER = 0;
    public static final int RIGTH = 1;

    public static String toStringNumber(BigDecimal n)
    {
        if (n != null)
            return new String("" + n.longValue());
        return "0";
    }

    public static String toStringNumber(Integer n)
    {
        if (n != null)
            return new String("" + n.intValue());
        return "0";
    }

    public static boolean esNull(Object value)
    {
        return value == null;
    }

    public static boolean isBlankOrNull(Object value)
    {
        return (value == null) || (value.toString().trim().equals(""));
    }

    public static String format(String n)
    {
        return n;
    }

    public static String formatNumer(String str)
    {
        BigDecimal n = new BigDecimal(str);
        return n.longValue() + "";
    }

    public static boolean isNumber(String str)
    {
        try
        {
            Long.valueOf(str);
            return true;
        }
        catch (Exception e)
        {
        }
        return false;
    }

    public static java.sql.Date toDate(String fecha, String formato)
    {
        if (formato == null)
        {
            formato = "dd-MM-yyyy";
        }
        SimpleDateFormat form = new SimpleDateFormat(formato);
        java.sql.Date fechatmp = null;
        try
        {
            fechatmp = new java.sql.Date(form.parse(fecha).getTime());
        }
        catch (ParseException e)
        {
            return null;
        }

        return fechatmp;
    }

    public static String getFechaFormateoStandar(java.sql.Date fecha)
    {
        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
        return formato.format(fecha);
    }

    public static String getFechaFormateoStandar(java.util.Date fecha, boolean conHora)
    {
        if ((fecha != null) && (!fecha.equals("null")))
        {
            String formatoHora = "";
            if (conHora)
            {
                formatoHora = " hh:mm";
            }
            SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy" + formatoHora);
            return formato.format(fecha);
        }
        return null;
    }

    public static String fechaToString(java.sql.Date fecha, String format)
    {
        if (fecha == null)
        {
            return "";
        }
        SimpleDateFormat formato = new SimpleDateFormat(format);
        return formato.format(fecha);
    }

    public static String fechaToString(java.util.Date fecha, String format)
    {
        SimpleDateFormat formato = new SimpleDateFormat(format);
        return formato.format(fecha);
    }

    public static MaskFormatter getMask(String mask)
    {
        MaskFormatter mf = null;
        try
        {
            mf = new MaskFormatter(mask);
        }
        catch (ParseException e)
        {
            e.printStackTrace();
        }
        return mf;
    }

    public static String makeProper(String theString)
    {
        StringReader in = new StringReader(theString.toLowerCase());
        boolean precededBySpace = true;
        StringBuffer properCase = new StringBuffer();
        while (true)
        {
            try
            {
                int i = in.read();
                if (i == -1)
                    break;
                char c = (char) i;
                if ((c == ' ') || (c == '"') || (c == '(') || (c == '.') || (c == '/') || (c == '\\') || (c == ','))
                {
                    properCase.append(c);
                    precededBySpace = true;
                }
                else
                {
                    if (precededBySpace)
                        properCase.append(Character.toUpperCase(c));
                    else
                    {
                        properCase.append(c);
                    }
                    precededBySpace = false;
                }
            }
            catch (IOException ex)
            {
                ex.printStackTrace();
                return theString;
            }
        }
        return properCase.toString();
    }

    public static void delay(long sec)
    {
        try
        {
            Thread.sleep(sec * 1000L);
        }
        catch (InterruptedException e)
        {
        }
    }

    public static String stringRepeat(String str, int veces)
    {
        String ret = null;
        if (str != null)
        {
            ret = "";
            for (int i = 1; i <= veces; i++)
            {
                ret = ret + str;
            }
        }

        return ret;
    }

    public static String justifyString(String string, int largo, int justify)
    {
        String ret = "";

        if (string == null)
        {
            return espacios(largo);
        }
        string = string.trim();
        if (largo <= string.length())
        {
            ret = string.substring(0, largo);
        }
        else if (justify == -1)
        {
            ret = string + espacios(largo - string.length());
        }
        else if (justify == 1)
        {
            ret = espacios(largo - string.length()) + string;
        }
        else
        {
            int mid = new BigDecimal("" + (largo - string.length()) / 2).intValue();
            ret = espacios(mid) + string + espacios(largo - string.length() - mid);
        }

        return ret;
    }

    private static String espacios(int largo)
    {
        return stringRepeat(" ", largo);
    }

    public static String formatDecimal(final BigDecimal number, int dec, int largo)
    {
        String ret = "0";

        if (number == null)
        {
            return espacios(largo);
        }

        //final BigDecimal newNumber = number.setScale(dec, 4);

        NumberFormat nf = NumberFormat.getCurrencyInstance();
        nf.setMinimumFractionDigits(dec);
        nf.setMaximumFractionDigits(dec);
        ret = nf.format(number);

        if (largo != 0)
        {
            ret = espacios(largo - ret.length()) + ret;
        }
        return ret;
    }

    /**
     * Agrega un contorno apropiado al texto para convertirlo en imprimible
     *
     * @param int lineChars Ancho total de la impresión.
     *
     * @param String text1 Necesario para determinar el intervalo del texto.
     *
     * @param String text2 Necesario también para determinar el intervalo del texto.
     *
     * @return String datos a imprimir.
     */
    protected static String makePrintString(int lineChars, String text1, String text2)
    {
        int spaces = 0;
        String tab = "";
        try
        {
            spaces = lineChars - (text1.length() + text2.length());
            for (int j = 0; j < spaces; j++)
            {
                tab += " ";
            }
        }
        catch (Exception ex) {}

        return text1 + tab + text2;
    } // makePrintString

    /**
     * Convierte un importe en un string con formato de moneda<p>
	 * Ejemplo: "123.4" -> "$123,40"
     *
     * @param importe importe a convertir
     * @return String con el importe imprimible
     */
    public static String formatoParaImporte(final BigDecimal importe)
    {
        String newFormNo = "";
        try
        {
            NumberFormat nf = NumberFormat.getCurrencyInstance();
            nf.setMaximumFractionDigits(2);
            nf.setMinimumFractionDigits(2);
            newFormNo = nf.format(importe);
        }
        catch (Exception ex)
        {
        }
        return newFormNo;
    } // formatoImporte
}