#!/bin/bash
#please do not open this file ini BIDI aware text editor, the rendered order maybe confusing.
#!/bin/bash
# available options:
# all the default values are 0
# --wrongfathah, using fathah instead of alif dagger, e.g لَّ instead of لّٰ  
# --twofathah, using  both fathah and alif dagger instead of alif dagger only 
# --noayah, does not give + sign for ayah number in package alqalam of latex
# --nosukun, no sukun above character و and ي  
# --alifsilent, using calligraphic alif for silent لأ
# --longra, using رَٰطَ instead of رَاطَ
# --longwau, using و after the character, instead of  inverted dhamma,ٗ
# --longhamzahalif, using ءَا instead of اٰ for writing long alif
# --mimtajweed, use mim tajweed of tanzil repository, otherwise it will be removed
# --alifhamza, using أ instead of simple ا, however for kasrah generally the hamzah is kept except when the previous letter is connectable with alif
#  "s/\([بتثجحخسشصضطظعغفقكلمنهي].\)إِ/\1اِ/g"; to make the hamzah hidden if alif is after connectable letter
# --dotsukun, using ۟ that will be rendered as strange sukun over particular letter such as alif and wau
# --accepterror, given value 0, various tricky error correction is carried out. List of correction: 
#  "s/ـَٔا/ــٔاَ/g"; to make the fatha shown
#  "s/إِيَّٰىَ/إِيَّايَ/g"; there's bug on latex, the ي only shown once, and the indonesian style prefer an explicit alif instead of alif dagger harakah to represent long fathah
#  "s/لَوٰ/لٰو/g"; "s/لَىٰٓ/لٰٓى/g"; "s/لَىٰ/لٰى/g"; "s/حَيَوٰ/حَيٰو/g"; indonesian style

#command line args code is taken from http://www.franzone.com/2007/11/19/arbitrary-command-line-arguments-in-bash/

tmp1="./tmp1"
tmp2="./tmp2"
#default value of options
wrongfathah=0
twofathah=0
noayah=0
nosukun=0
alifsilent=0
longra=0
longwau=0
longhamzahalif=0
utfquranmark=0
mimtajweed=0
alifhamza=0
dotsukun=0
accepterror=0

if [ -z "$1" ]; then
  echo -e "\nUsage: `basename $0` arg 1 [arg 2] [etc.]..."
  exit 1
fi

#echo "Found $# Command-Line Arguments"

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
  if [ "${arg}" == "--longra" ]; then
      longra=1
  fi
  if [ "${arg}" == "--longwau" ]; then
      longwau=1
  fi
  if [ "${arg}" == "--hamzahalif" ]; then
      hamzahalif=1
  fi
  let "idx += 1"
done

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
	-e "s/ي\([ابتثجحخدذرزسشصضطظعغفقكلمنهويء]\)/يْ\1/g" \
	-e "s/ن\([ابتثجحخدذرزسشصضطظعغفقكلمنهويء]\)/نْ\1/g" \
	-e "s/ن /نْ /g" > ${tmp2}
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

#alif dagger on Allah words
if [ "${wrongfathah}" == "0" ]; then
    cat ${tmp1}|sed \
	-e "s/ٱللَّه/ٱللّٰه/g" \
	-e "s/اللَّه/اللّٰه/g" \
	-e "s/لِلَّه/لِلّٰه/g" \
	-e "s/لِلَّه/لِلّٰه/g" > ${tmp2} 
    cp ${tmp2} ${tmp1} 	    
fi
if [ "${longra}" == "0" ]; then
    cat ${tmp1}|sed \
	-e "s/رَٰطَ/رَاطَ/g" > ${tmp2}
    cp ${tmp2} ${tmp1} 	    
fi

# ٗ
if [ "${longwau}" == "0" ]; then
    cat ${tmp1}|sed \
	-e "s/هُۥ/هٗ/g" > ${tmp2}
    cp ${tmp2} ${tmp1} 	    
fi
if [ "${longhamzahalif}" == "0" ]; then
#	-e "s/ءَا/اٰ/g" > ${tmp2}
    cat ${tmp1}|sed \
	-e "s/ءَا۬/أٰأٰأٰ/g" \
	-e "s/ءَا/اٰ/g" \
	-e "s/أٰأٰأٰ/ءَاَ/g" > ${tmp2}
    cp ${tmp2} ${tmp1} 	    
fi

if [ "${utfquranmark}" == "0" ]; then
    cat ${tmp1}|sed \
	-e "s/ ۛ/ۛ/g" \
	-e "s/ ۗ/ۗ/g" \
	-e "s/ ۚ/ۚ/g" \
	-e "s/ ۙ/ۙ/g" \
	-e "s/ ۖ/ۖ/g" > ${tmp2}
    cp ${tmp2} ${tmp1} 	    
fi

if [ "${mimtajweed}" == "0" ]; then
    cat ${tmp1}|sed \
	-e "s/ۭى و/ى وّ/g" \
	-e "s/ۢ//g" \
	-e "s/ۭ ب/ۢ ب/g" \
	-e "s/ۭ و/ وّ/g" \
	-e "s/ۭ//g" > ${tmp2}

#    -e "s/ۭ و/ وّ/g" > ${tmp2}
    cp ${tmp2} ${tmp1} 	    
fi
#test cat tanzil_quran.txt|grep ۭ|grep -v "ۭى و"|grep -v "ۭ ب"|grep -v "ۭ و"


if [ "${dotsukun}" == "0" ]; then
    cat ${tmp1}|sed \
	-e "s/۟//g" > ${tmp2}
    cp ${tmp2} ${tmp1} 	    
fi

#miscellanous error correction
if [ "${accepterror}" == "0" ]; then
    cat ${tmp1}|sed \
	-e "s/إِيَّٰىَ/إِيَّايَ/g" \
	-e "s/لَوٰ/لٰو/g" \
	-e "s/لَىٰٓ/لٰٓى/g" \
	-e "s/لَىٰ/لٰى/g" \
	-e "s/حَيَوٰ/حَيٰو/g" \
	-e "s/ـَٔا/ــٔاَ/g" > ${tmp2}
#	-e "s/۟//g" > ${tmp2}
    cp ${tmp2} ${tmp1} 	    
fi

#put this after misc error because it will manipulate the alif and hamzah
if [ "${alifhamza}" == "0" ]; then
    cat ${tmp1}|sed \
	-e "s/\([بتثجحخسشصضطظعغفقكلمنهي].\)إِ/\1اِ/g" \
	-e "s/أ/ا/g" > ${tmp2}
    cp ${tmp2} ${tmp1} 	    
fi


#output
cat ${tmp1}
#cleanup
#rm ${tmp1} ${tmp2}

#ابتثجحخدذرزسشصضطظعغفقكلمنهويء
