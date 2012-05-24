#! /bin/bash

PROYECTO1=$1
PROYECTO2=$2

echo "">/tmp/listaProyecto1.lst
echo "">/tmp/listaProyecto2.lst
echo "">/tmp/listaCompleta.lst

PRCNT1=0
PRCNT2=0
COMCNT=0

echo -ne "\n\n----------------------------------------------------------------\n\n"
echo "Buscando clases: $PROYECTO1"
for n in $(cd $PROYECTO1;find ./ -type f -name *.java|sed 's/\.\///');do
    for m in $(cat $PROYECTO1/$n| \
        grep -e "\ class\ [A-Z]"| \
        tr -d '{'| \
        sed 's/^ *//g'|sed 's/^\t*//g'| \
        awk '{C=substr($0,match($0,"[A-Z]"));printf "%s\n",C}'| \
        awk '{printf " %s \n",$1}');do
            echo "$n->$m">>/tmp/listaProyecto1.lst
            echo -ne "."
    done
done
echo -ne "\n"
PRCNT1="$(wc -l /tmp/listaProyecto1.lst|awk '{print $1}')"

echo "Buscando clases: $PROYECTO2"
for n in $(cd $PROYECTO2;find ./ -type f -name *.java|sed 's/\.\///');do
    for m in $(cat $PROYECTO2/$n| \
        grep -e "\ class\ [A-Z]"| \
        tr -d '{'| \
        sed 's/^ *//g'|sed 's/^\t*//g'| \
        awk '{C=substr($0,match($0,"[A-Z]"));printf "%s\n",C}'| \
        awk '{printf " %s \n",$1}');do
            echo "$n->$m">>/tmp/listaProyecto2.lst
            echo -ne "."
    done
done
echo -ne "\n"
PRCNT2="$(wc -l /tmp/listaProyecto2.lst|awk '{print $1}')"

echo -ne "\n\n-------------\n"
echo -ne "Comparando...\n"
echo -ne "-------------\n\n"

for n in $(cat /tmp/listaProyecto1.lst);do
    for m in $(cat /tmp/listaProyecto2.lst);do
        if [ "$m" == "$n" ];then
         echo "$n">>/tmp/listaCompleta.lst
         echo "$n"
         break
        fi
    done
done

COMCNT="$(wc -l /tmp/listaCompleta.lst|awk '{print $1}')"
echo -ne "\n----------\n\n"
echo "Clases $PROYECTO1 : $PRCNT1 | Clases $PROYECTO2 : $PRCNT2 | Comun: $COMCNT"
echo -ne "\n----------------------------------------------------------------\n\n"
