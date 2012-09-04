Quran
=====

Arabic Text of Al-Quran

This project is intended to provide a repository
of Al-Quran with full harakah (diacritics),
particularly Indonesian printing style.

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
We do not alter the file at all, except deleting 2 empty lines.
We only process the file using script
using file transformer.sh.
file tanzil_quran.txt check sums:
$ sha1sum tanzil_quran.txt
a462f35e2a126f3035267d4948ec9dff90469547  tanzil_quran.txt
$ sha512sum tanzil_quran.txt
c65cc10ffffd403e2354d5b5aec5f7e6c249f4b7817c3f1fe9c9bb184a3a7495b44602721ef519c327b271f39a969c824ff459b254c3027dd02df343017c2c5a  tanzil_quran.txt
$ md5sum tanzil_quran.txt 
cac3c4afe987f81db5e7a8b354bc6850  tanzil_quran.txt

2. Alqalam modified files
The latex package alqalam has to be modified to accomodate this work.
Our suggestion is simply install alqalam and its depencies(e.g. arabtex),
then replace the original file with our mod in mod-alqalam directory.
I do admit that the mod is a hack, thus be careful if it creates any
draw back in other parts.

3. Usage
To use this collection of program you should start from kitab.sh.
e.g. bash kitab.sh <surah> <from ayah> <to ayah> that will throw
the output to standar output(screen) that later you can redirect it to a file
e.g bash kitab.sh 2 1 100 > albaqarah.tex
will create a latex document of albaqarah: 1-100.
then you must run latex to compile the file into pdf, i.e. by running pdflatex albaqarah.tex
or whatever workflow suit your system.
By default it will create Indonesian printing style AlQuran, if you want to
fine tune it, you can examine the file transformer.sh

