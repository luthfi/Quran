#!/bin/bash
#please do not open this file ini BIDI aware text editor
#!/bin/bash
# available options:
# --wrongfathah, using fathah instead of alif dagger, e.g لَّ instead of لّٰ  
# --twofathah, using  both fathah and alif dagger instead of alif dagger only 
# --noayah, does not give + sign for ayah number in package alqalam of latex
# --nosukun, no sukun above character و and ي  
# --alifsilent, using calligraphic alif for silent لأ
#command line args code is taken from http://www.franzone.com/2007/11/19/arbitrary-command-line-arguments-in-bash/

tmp1="./tmp1"
tmp2="./tmp2"
wrongfathah=0
twofathah=0
noayah=0
nosukun=0
alifsilent=0
if [ -z "$1" ]; then
  echo -e "\nUsage: `basename $0` arg 1 [arg 2] [etc.]..."
  exit 1
fi

echo "Found $# Command-Line Arguments"

idx=1
for arg in "$@"
do
#  echo "Arg[$idx] = ${arg}"
  if [ "${arg}" == "--wrongfathah" ]; then
      wrongfathah=1
  fi
  if [ "${arg}" == "--twofathah" ]; then
      twofathah=1
  fi
  if [ "${arg}" == "--noayah" ]; then
      noayah=1
  fi
  if [ "${arg}" == "--nosukun" ]; then
      nosukun=1
  fi
  if [ "${arg}" == "--alifsilent" ]; then
      alifsilent=1
  fi
  let "idx += 1"
done

echo "your options are:"
echo "wrongfathah=${wrongfathah}"
echo "twofathah=${twofathah}"
echo "noayah=${noayah}"
echo "nosukun=${nosukun}"
echo "alifsilent=${alifsilent}"

cp ${1} ${tmp1} 

if [ "${twofathah}" == "0" ]; then
    cat ${tmp1}|sed \
	-e "s/اَٰ/اٰ/g" \
	-e "s/بَٰ/بٰ/g" \
	-e "s/تَٰ/تٰ/g" \
	-e "s/ثَٰ/ثٰ/g" \
	-e "s/جَٰ/جٰ/g" \
	-e "s/حَٰ/حٰ/g" \
	-e "s/خَٰ/خٰ/g" \
	-e "s/دَٰ/دٰ/g" \
	-e "s/ذَٰ/ذٰ/g" \
	-e "s/رَٰ/رٰ/g" \
	-e "s/زَٰ/زٰ/g" \
	-e "s/سَٰ/سٰ/g" \
	-e "s/شَٰ/شٰ/g" \
	-e "s/صَٰ/صٰ/g" \
	-e "s/ضَٰ/ضٰ/g" \
	-e "s/طَٰ/طٰ/g" \
	-e "s/ظَٰ/ظٰ/g" \
	-e "s/عَٰ/عٰ/g" \
	-e "s/غَٰ/غٰ/g" \
	-e "s/فَٰ/فٰ/g" \
	-e "s/قَٰ/قٰ/g" \
	-e "s/كَٰ/كٰ/g" \
	-e "s/لَٰ/لٰ/g" \
	-e "s/مَٰ/مٰ/g" \
	-e "s/نَٰ/نٰ/g" \
	-e "s/هَٰ/هٰ/g" \
	-e "s/وَٰ/وٰ/g" \
	-e "s/يَٰ/يٰ/g" \
	-e "s/ءَٰ/ءٰ/g" > ${tmp2}
    cp ${tmp2} ${tmp1} 
fi

if [ "${nosukun}" == "0" ]; then
    cat ${tmp1}|sed \
	-e "s/و\([ابتثجحخدذرزسشصضطظعغفقكلمنهويء]\)/وْ\1/g" \
	-e "s/ي\([ابتثجحخدذرزسشصضطظعغفقكلمنهويء]\)/يْ\1/g" > ${tmp2}
    cp ${tmp2} ${tmp1} 	    
fi

if [ "${alifsilent}" == "0" ]; then
    cat ${tmp1}|sed \
	-e "s/ٱ/ا/g" > ${tmp2} 
    cp ${tmp2} ${tmp1} 	    
fi

if [ "${noayah}" == "0" ]; then
    cat ${tmp1}|sed \
	-e ':a;N;$!ba;s/\n/ +\n/g' > ${tmp2} 
    cp ${tmp2} ${tmp1} 	    
fi

#output
cat ${tmp1}
#cleanup
rm ${tmp1} ${tmp2}

#ابتثجحخدذرزسشصضطظعغفقكلمنهويء
