ADempiere Argentine Localization (LAR)
======================================

Objetive
---------
To extend and adequate ADempiere to Argentine Laws and Taxing schema.
To Incorporate Fiscal Printing, and support fiscal printer drivers listed by the AFIP.
To incorporate more features of the sales process to JavaPOS.

Introduction
------------
ADempiere Argentine Localization (LAR) implements a solution for Withholdings from
Income Gross and VAT, and the issuance of corresponding certificates.
Adapts Colombian Localization (LCO) to Argentine tax scheme.
Extends JavaPOS to incorporate Fiscal Printing functionality and add features of the
sales process (Product Attributes, Withholdings, Payment Rules, Stock Control, Binding
and Non Binding offers Invoicing).

Credits
-------
* Initial project development by [Ergio]
* ADempiere ERP version [3.61][ADempiere361].
* Colombian Localization (LCO), developed by [Carlos Ruiz] - [GlobalQSS].
* Fiscal Printing support, developed by [Libertya].
* Default accounting schema developed by [Alejandro Falcone] - [Openbiz].
* [JavaPOS]: [OpenXpertya], [Adaxa], [Redhuan D. Oon][Red1]

Installation
------------

##### 1. Download ADempiere 3.61 source code.

    $ hg clone https://bitbucket.org/CarlosRuiz_globalqss/adempiere361
    $ cd adempiere361

##### 2. Update source code to latest release patches
Do `$ hg log --date '2011-10-03'` to retrieve the needed changeset.

    $ hg update 6132:146946d0dbaa

##### 3. Build ADempiere

    $ cd utils_dev
    $ ./RUN_build.sh

##### 4. Create adempiere database and apply migration scripts
Use Adempiere_pg.dmp from release 360lts. When using Oracle, run scripts from oracle directories
`migration/360lts-360lts.010/oracle` and `migration/360lts.010-release/oracle`

    $ cd ../migration/360lts-360lts.010/postgresql
    $ for f in $(ls *.sql);do psql -U adempiere -d <adempiere database> -f $f;done
    $ cd ../../../migration/360lts.010-release/postgresql
    $ for f in $(ls *.sql);do psql -U adempiere -d <adempiere database> -f $f;done

##### 5. Install Adempiere.
There are detailed installation instructions on the project [wiki] (http://www.adempiere.com/Installing_ADempiere_Manually)

##### 6. Install LCO
* Import **ONLY** withholding package from [LCO].
* Run *Role Access Update* process, leave the role field blank (this update all roles of the Client).
* Run *Sequence Check* process.

##### 7. Download LAR source code.

    $ git clone https://github.com/ergio/argentine_localization.git
    $ cd argentine_localization

##### 8. Run LAR migration scripts

    $ cd migration/postgresql
    $ for f in $(ls *.sql);do psql -U adempiere -d <adempiere databse> -f $f;done

##### 9. Build LAR
Compile and export LAR as a customization.jar file.

##### 10. Integrate customization.jar file into ADempiere
Replace customization.jar file in `$ADEMPIERE_HOME/lib` by the newly created.

    $ cd $ADEMPIERE_HOME
    $ ./RUN_silentsetup.sh

##### 11. Run ADempiere
Login using user *SuperUser/System Administrator* and run *Role Access Update* process,
leave the role field blank (this update all roles of the Client).


##### 12. Install Translation package
* Apply `scripts/Change_language_to_es_AR.sql` to adempiere database.
* Import Spanish (Argentina) Translation package:
    * Login as *SuperUser/System Administrator*
    * Open *Translation Import/Export* window.
    * Select Spanish (Argentina) on language field. Leave *Client* and *Table* fields blank.
    * Click on *Import* button, select the folder containing es_AR translation xml files
      (`argentine_localization/es_AR`).
    * When the process it is done, close the window.
    * Run *Synchronize Terminology* process.

License
-------
Argentine Localization is licensed under [GNU GPLv2]


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
