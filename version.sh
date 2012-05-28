#!/bin/bash
#
# Post-Commit script to manage version suffix
#
BASEDIR=`dirname $0`
FILE=$BASEDIR/base/src/org/adempiere/version.properties
BRANCH=$(git branch |grep \*|awk '{print $2}')
TODAY=`date +%Y-%m-%d` 
if [ $BRANCH = "develop" ]; then
    LAR_VER=$(grep MAIN $FILE |awk '{print $4}')
    LAR_VER_NEW=$(echo $LAR_VER |awk -F "-" '{print $1}')
    REV=$(git rev-list HEAD -n 1|cut -c 1-7)
    sed -i -e "s/$LAR_VER/$LAR_VER_NEW-$REV/" $FILE

    # Update dates
    DATE_VER=$(grep DATE_VERSION $FILE)
    DATE_VER_NEW=$(echo $DATE_VER |awk -F "=" '{print $1}')=$TODAY
    sed -i -e "s/$DATE_VER/$DATE_VER_NEW/" $FILE

    IMPL_VER=$(grep IMPLEMENTATION_VERSION $FILE)
    IMPL_VER_NEW=$(echo $IMPL_VER|awk -F "=" '{print $1}')=$TODAY
    sed -i -e "s/$IMPL_VER/$IMPL_VER_NEW/" $FILE
fi
