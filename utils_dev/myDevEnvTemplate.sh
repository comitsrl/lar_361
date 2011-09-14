#	My Development Environment
#
#	This script sets variable for compiling Adempiere patches from source
#	
#  Check the following parameters:
#  -------------------------------

if [ $JAVA_HOME ]; then
  export PATH=$JAVA_HOME/bin:$PATH	
else
  echo JAVA_HOME is not set.
  echo You may not be able to build Adempiere
  echo Set JAVA_HOME to the directory of your local JDK.
fi


#Set Adempiere Source Directory - default one dir up from place where script resides

SAVED_DIR=`pwd`			#save current dir
cd `dirname $0`/..		#change dir to one up form place where script resides - doesn not work with sym links
export PATCHES_SOURCE=`pwd`	#this is adempiere patches source
cd $SAVED_DIR			#back to the saved directory

echo PATCHES_SOURCE is $PATCHES_SOURCE

# Directory where adempiere base is installed (or just uncompressed)
export ADEMPIERE_BASE_DIR=/tmp/Adempiere

# Build directory (temporary - it's deleted and recreated before building)
export BUILD_DIR=/tmp/build

#	Automatic Installation - Where patches.jar will be copied
export ADEMPIERE_ROOT=/tmp/Adempiere

#	Automatic Installation - Share for final Installers
export ADEMPIERE_INSTALL=/tmp/Installers
if [ ! -d $ADEMPIERE_INSTALL ] ; then
    mkdir -p $ADEMPIERE_INSTALL
fi  

#  ---------------------------------------------------------------
#  In most cases you don't need to change anything below this line
#  If you need to define something manually do it above this line,
#  it should work, since most variables are checked before set.
#  ---------------------------------------------------------------

#  Set Version
export ADEMPIERE_VERSION=Adempiere
export ADEMPIERE_VERSION_FILE=355a
export ADEMPIERE_VENDOR=Adempiere

export CURRENTDIR=`pwd`

export ENCODING=UTF-8

#	ClassPath
if  [ ! -f $JAVA_HOME/lib/tools.jar ] ; then
	echo "** Need full Java SDK **"
fi
export CLASSPATH=$CLASSPATH:$JAVA_HOME/lib/tools.jar

# Set ADEMPIERE_ENV for all other scripts.
export ADEMPIERE_ENV=Y
