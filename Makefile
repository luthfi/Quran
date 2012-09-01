all:
	echo -e "are you sure, we'll delete the log files?"
clean:
#	find . -name "*.pdf" -print -exec rm {} \;
	find . -name "*.aux" -print -exec rm {} \;
	find . -name "*~" -print -exec rm {} \;
	find . -name "*.idx" -print -exec rm {} \;
	find . -name "*.dvi" -print -exec rm {} \;
	find . -name "*.log" -print -exec rm {} \;
	find . -name "*.out" -print -exec rm {} \;
	find . -name "*.toc" -print -exec rm {} \;
	find . -name "*.lof" -print -exec rm {} \;
	find . -name "*.bbl" -print -exec rm {} \;
	find . -name "*.blg" -print -exec rm {} \;
	find . -name "*.nav" -print -exec rm {} \;
	find . -name "*.ps" -print -exec rm {} \;
	find . -name "*.snm" -print -exec rm {} \;

dvi: 
	latex Luthfi.tex
	latex Luthfi.tex
	bibtex Luthfi
	latex Luthfi.tex
	latex Luthfi.tex
	latex Luthfi.tex
	latex Luthfi.tex

pdf:	dvi
	dvipdf Luthfi.dvi

portable-dvi: 
	latex Luthfi_portable.tex
	latex Luthfi_portable.tex
	bibtex Luthfi_portable
	latex Luthfi_portable.tex
	latex Luthfi_portable.tex
	latex Luthfi_portable.tex
	latex Luthfi_portable.tex

portable-pdf:	dvi
	dvipdf Luthfi_portable.dvi

.phony: all clean pdf dvi portable-dvi portable-pdf
