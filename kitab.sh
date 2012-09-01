#/bin/bash
#include data
. ./daftarsurat.sh
kitabtmp="./kitab.tmp"
old_IFS=$IFS
IFS=$'\n'
lines=($(cat tanzil_quran.txt)) # its only 6268 element array :D, one ayah per line + acknowledgment
IFS=$old_IFS


if [ ${1} -gt 114 ]; then
    echo "wrong param:number of surah is only 114"
    exit 1
fi

surah=${1}
if [ ${3} -gt ${s[$surah]} ]; then
    echo "wrong param:number of ayah in surah ${surah} is only ${s[surah]}"
    exit 1
fi

for arg in "$@"
do
    if [ "${arg}" == "--plain" ];then
	plain=1
    fi
done


let surah1=${1}-1
ayahbegin=${2}
ayahend=${3}
COUNTER=1
sum=0
until [ ${COUNTER} -gt ${surah1} ]; do
    let sum=${sum}+${s[COUNTER]}
    let COUNTER+=1
done
#echo ${sum}
if [ ${ayahbegin} == 0 ]; then
#    echo "allsurah"
    ayahbegin=1
    ayahend=${s[surah]}
fi
let COUNTER=${ayahbegin}+${sum}-1
let COUNTEREND=${ayahend}+${sum}-1
#echo $COUNTER
echo ${lines[COUNTER]} > ${kitabtmp}
let COUNTER=${COUNTER}+1
until [ ${COUNTER} -gt ${COUNTEREND} ]; do
    echo ${lines[COUNTER]} >> ${kitabtmp}
    let COUNTER+=1
done
echo "" >> ${kitabtmp}

if [ "${plain}" == "1" ];then
    bash transformer.sh ${kitabtmp}
    exit 0
fi
cat toppage.tex
bash transformer.sh ${kitabtmp}
cat bottompage.tex