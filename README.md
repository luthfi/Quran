Quran
=====

Arabic Text of Al-Quran

This project is intended to provide a repository
of Al-Quran with full harakah (diacritics). 

We try to provide a robust resource that is easy
to customize to other format. Currently our target
is LaTex using the package "alqalam".

We use tanzil_quran.txt collection as the master
of current development. Then we create our version
which comply with LaTex package "alqalam". 

Currently we have no expert whatsoever, thus 
any collaboration is more than welcome.

If you find any redundant project out there,
please inform me, I'll more than happy to collaborate
and merge the project.

contact:
luthffffi@gmail.com

Table of contents
1. Tanzil Quran Repository
2. Alqalam modified files
3. Usage
1. Tanzil Quran Repository
We do not alter the file at all. We only process the file using script
using file transformer.sh.
file tanzil_quran.txt check sums:
$ sha1sum tanzil_quran.txt 
18d7b3873d84bb614c3b146a25b81423b50caac5  tanzil_quran.txt
$ sha512sum tanzil_quran.txt 
f2f9568447a7b8b223f9d54d89cc293ceffdb2c23c603c935df35607cb1dc30ff2d877ecbf26c13587dedcf68c001f916fc214aa45072aaa54ba7996ca4b7ae6  tanzil_quran.txt
$ md5sum tanzil_quran.txt 
9ad8b2b025c8b4d89b240cc7090a0854  tanzil_quran.txt

2. Alqalam modified files
The latex package alqalam has to be modified to accomodate this work.
Our suggestion is simply install alqalam and its depencies(e.g. arabtex),
then replace the original file with our mod in mod-alqalam directory.
I do admit that the mod is a hack, thus be careful if it creates any
draw back in other parts.
3. To use this collection of program you should start from kitab.sh.
e.g. bash kitab.sh <surah> <from ayah> <to ayah> that will trow
the output to standar output(screen) that later you can redirect it to a file
e.g bash kitab.sh 2 1 100 > albaqarah.tex
will create a latex document of albaqarah: 1-100.
then you must run latex to compile the file into pdf, i.e. by running pdflatex albaqarah.tex
or whatever workflow suit your system.
By default it will create Indonesian printing style AlQuran, if you want to
fine tune it, you can examine the file transformer.sh

