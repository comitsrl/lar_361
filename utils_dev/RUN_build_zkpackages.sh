#	This script rebuilds Adempiere patches
#

SAVED_DIR=`pwd`			#save current dir
cd `dirname $0`			#change dir to place where script resides - does not work with sym links
UTILS_DEV=`pwd`			#this is adempiere patches source
cd $SAVED_DIR			#back to the saved directory

TMPWEBINFLIB=/tmp/webinflib$$

.  $UTILS_DEV/myDevEnv.sh	#call environment


if [ ! $ADEMPIERE_ENV==Y ] ; then
    echo "Can't set development environemnt - check myDevEnv.sh"
    exit 1
fi

echo Compiling ...
SRCDIRS="
$PATCHES_SOURCE/zkwebui/WEB-INF/src
"
CPSRCDIRS="
$PATCHES_SOURCE/base/src
$PATCHES_SOURCE/client/src
$PATCHES_SOURCE/extend/src
$PATCHES_SOURCE/install/src
$PATCHES_SOURCE/interfaces/src
$PATCHES_SOURCE/JasperReports/src
$PATCHES_SOURCE/JasperReportsWebApp/src
$PATCHES_SOURCE/looks/src
$PATCHES_SOURCE/migration/src
$PATCHES_SOURCE/posterita/src/main
$PATCHES_SOURCE/serverApps/src/main/servlet
$PATCHES_SOURCE/serverRoot/src/main/ejb
$PATCHES_SOURCE/serverRoot/src/main/server
$PATCHES_SOURCE/serverRoot/src/main/servlet
$PATCHES_SOURCE/sqlj/src
$PATCHES_SOURCE/tools/src
$PATCHES_SOURCE/webCM/src/main/servlet
$PATCHES_SOURCE/zkwebui/WEB-INF/src
"

# Clean up the build directory
rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR/WEB-INF/classes

# set classpath
for CPSRCDIR in $CPSRCDIRS
do
    if [ -d $CPSRCDIR ]
    then
	export CLASSPATH=$CLASSPATH:$CPSRCDIR
    fi
done
# uncompress and set cp for zkwebui libraries
rm -rf $TMPWEBINFLIB
mkdir -p $TMPWEBINFLIB
cd $TMPWEBINFLIB
jar xf $ADEMPIERE_BASE_DIR/lib/webui.war WEB-INF/classes WEB-INF/lib
export CLASSPATH=$CLASSPATH:$TMPWEBINFLIB/WEB-INF/classes
for JARFILE in $TMPWEBINFLIB/WEB-INF/lib/*.jar
do
    export CLASSPATH=$CLASSPATH:$JARFILE
done

export CLASSPATH=$CLASSPATH:$ADEMPIERE_BASE_DIR/lib:$ADEMPIERE_BASE_DIR/lib/adempiereApps.jar:$ADEMPIERE_BASE_DIR/lib/Adempiere.jar:$ADEMPIERE_BASE_DIR/lib/adempiereRoot.jar:$ADEMPIERE_BASE_DIR/lib/CCTools.jar:$ADEMPIERE_BASE_DIR/lib/CInstall.jar:$ADEMPIERE_BASE_DIR/lib/CompiereJasperReqs.jar:$ADEMPIERE_BASE_DIR/lib/CSTools.jar:$ADEMPIERE_BASE_DIR/lib/customization.jar:$ADEMPIERE_BASE_DIR/lib/j2ee.jar:$ADEMPIERE_BASE_DIR/lib/jboss.jar:$ADEMPIERE_BASE_DIR/lib/oracle.jar:$ADEMPIERE_BASE_DIR/lib/patches.jar:$ADEMPIERE_BASE_DIR/lib/posterita.jar:$ADEMPIERE_BASE_DIR/lib/postgresql.jar:$ADEMPIERE_BASE_DIR/lib/sqlj.jar

for SRCDIR in $SRCDIRS
do
    if [ -d $SRCDIR ]
    then
	PREVDIR=`pwd`
        cd $SRCDIR
        echo "Compiling $SRCDIR"
	# compile java files
	JAVAFILES=`find . -name "*.java"`
	if [ "x$JAVAFILES" != "x" ]
	then
            javac -g -d $BUILD_DIR/WEB-INF/classes $JAVAFILES
	    if [ $? -ne 0 ]
	    then
	        echo "Error compiling $SRCDIR - see console for errors"
		exit 1
	    fi
	fi
	cd $PREVDIR
    fi
done

# Copy images directory
if [ -d $PATCHES_SOURCE/zkwebui/images ]
then
    mkdir -p $BUILD_DIR/images
    cp -p -r $PATCHES_SOURCE/zkwebui/images/* $BUILD_DIR/images
fi

TODAY=`date +%Y%m%d`
mkdir -p $ADEMPIERE_INSTALL/$TODAY
cd $ADEMPIERE_INSTALL/$TODAY

rm -rf $BUILD_DIR/WEB-INF/classes/org/compiere

jar cf $ADEMPIERE_INSTALL/zkpackages_LCO${ADEMPIERE_VERSION_FILE}_$TODAY.jar -C $BUILD_DIR .

ls -l $ADEMPIERE_INSTALL/zkpackages_LCO${ADEMPIERE_VERSION_FILE}_$TODAY.jar

cp $ADEMPIERE_INSTALL/zkpackages_LCO${ADEMPIERE_VERSION_FILE}_$TODAY.jar $ADEMPIERE_ROOT/zkpackages/LCO/lib/zkpackages_LCO.jar

rm -rf $TMPWEBINFLIB

echo Done ...

exit 0
