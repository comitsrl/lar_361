Localización Argentina de ADempiere (LAR)
=========================================

Objetivo
---------
Extender ADempiere y adecuarlo al esquema impositivo de Argentina, ajustándolo a la normativa
legal vigente. Incorporar la Impresión fiscal, soportando los Controladores Fiscales avalados
por la AFIP. Incorporar más funcionalidades del Proceso de Ventas a JavaPOS.


Introducción
------------
ADempiere Localización Argentina (LAR) implementa una solución a las Retenciones y Percepciones
de Ingresos Brutos e IVA,y la emisión de sus correspondientes Certificados.
Adapta la Localización Colombia (LCO) al esquema impositivo argentino.
Extiende JavaPos para incorporar la Impresión Fiscal y le incorpora más funcionalidades del proceso
de Ventas (Atributos del producto, Percepciones, Formas de Pago, Control de Stock, facturación de
Presupuestos/Pedidos).


Créditos
---------
* Desarrollo inicial del proyecto por parte de [Ergio]
* ADempiere ERP version [3.61][ADempiere361].
* Localización Colombia (LCO), desarrollada por [Carlos Ruiz] - [GlobalQSS].
* Soporte para impresiones Fiscales mediante Punto de Venta, desarrollado por [Libertya].
* Plan de Cuentas genérico para Argentina desarrollado por [Alejandro Falcone] - [Openbiz].
* [JavaPOS]: [OpenXpertya], [Adaxa], [Redhuan D. Oon][Red1]

Instalación
------------

##### 1. Descargar el código fuente de ADempiere 3.61

    $ hg clone https://bitbucket.org/CarlosRuiz_globalqss/adempiere361
    $ cd adempiere361

##### 2. Actualizar el codigo fuente al último release oficial de patches
Con `$ hg log --date '2011-10-03'` se recupera el changeset deseado.

    $ hg update 6132:146946d0dbaa

##### 3. Construir ADempiere 3.61

    $ cd utils_dev
    $ ./RUN_build.sh

##### 4. Crear base de datos de ADempiere y aplicar scripts de migración
Utilizar Adempiere_pg.dmp del release 360lts. En caso de utilizar Oracle, ejecutar
los scripts de los directorios `migration/360lts-360lts.010/oracle` y `migration/360lts.010-release/oracle`

    $ cd ../migration/360lts-360lts.010/postgresql
    $ for f in $(ls *.sql);do psql -U adempiere -d <base adempiere> -f $f;done
    $ cd ../../../migration/360lts.010-release/postgresql
    $ for f in $(ls *.sql);do psql -U adempiere -d <base adempiere> -f $f;done

##### 5. Instalar ADempiere
Seguir las instrucciones que se encuentran en la [wiki](http://www.adempiere.com/Installing_ADempiere_Manually)
del proyecto

##### 6. Instalar LCO
* Incorporar **SOLO** el Soporte Retenciones de la [LCO].
* Ejecutar el proceso *Actualización de Rol* sin seleccionar ningún Rol específico
  (esto actualiza todos los roles del sistema).
* Ejecutar el proceso *Comprobar Secuencia*.

##### 7. Descargar código de LAR

    $ git clone https://github.com/ergio/argentine_localization.git
    $ cd argentine_localization

##### 8. Ejecutar scripts de migracion de LAR
En caso de utilizar Oracle, ejecutar los scripts de dicho directorio.

    $ cd migration/postgresql
    $ for f in $(ls *.sql);do psql -U adempiere -d <base adempiere> -f $f;done

##### 9. Construir LAR
Compilar y exportar LAR como customization.jar

##### 10. Integrar el customization.jar y ADempiere
Reemplazar el archivo customization.jar ubicado en `$ADEMPIERE_HOME/lib` por el
creado anteriormente.

    $ cd $ADEMPIERE_HOME
    $ ./RUN_silentsetup.sh

##### 11. Iniciar ADempiere
Ingresar como *SuperUser/System Administrator* y ejecutar ejecutar el proceso *Actualización de Rol*
sin seleccionar ningún Rol específico (esto actualiza todos los roles del sistema).

##### 12. Incorporar paquete traducción
* Aplicar en la base de datos de ADempiere el script `scripts/Change_language_to_es_AR.sql`
* Importar el idioma al sistema:
* Ingresar al sistema con rol System Administrator
    * Abrir la ventana *Importar/Exportar Traducción*
    * Seleccionar en Language la opción Spanish (Argentina). Dejar los campos *Compañía* y *Tabla* en blanco
    * Oprimir el botón *Importar* y seleccionar el directorio donde se encuentran los archivos xml
      de la traducción es_AR (`argentine_localization/es_AR`)
    * Cuando este proceso finalice, cerrar la ventana
    * Ejecutar el proceso *Sincronizar Terminología*

Licencia
--------
ADempiere Localización Argentina está regulado por la licencia [GNU GPLv2]


[GNU GPLv2]: http://www.gnu.org/licenses/gpl-2.0.html
[ADempiere361]: http://www.adempiere.com/Branch_GlobalQSS_361
[GlobalQSS]: http://globalqss.com/portal/index.php?lang=es
[Libertya]: http://www.libertya.org
[Openbiz]: http://openbiz.com.ar
[Adaxa]: http://www.adaxa.com/
[Red1]: http://www.adempiere.com/User:Red1
[JavaPOS]: http://www.adempiere.com/Touchscreen_POS
[OpenXpertya]: http://www.openxpertya.org/
[Carlos Ruiz]: http://www.adempiere.com/User:CarlosRuiz
[LCO]: http://www.adempiere.com/LCO_Instrucciones_Instalacion#Soporte_Retenciones_Colombia
[Alejandro Falcone]: http://www.adempiere.com/User:Afalcone
[Ergio]: http://www.ergio.com.ar
