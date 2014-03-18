
SOURCE=2014-marburg-include.tex

.SUFFIXES: .tex


%.ps.gz: %.ps
	cp $*.ps $*.tmp
	gzip $*.tmp
	mv $*.tmp.gz $*.ps.gz

#.tex.eps: 
%.pdf: %.tex $(SOURCE)
	pdflatex $*.tex
	bibtex $*
	correct-toappear
	pdflatex $* |grep -v math
	bibtex $*
	correct-toappear
	pdflatex $* |grep -v math|egrep 'Warning|label|aux'




slides: 2014-marburg-slides.pdf

handout: 2014-marburg-handout-2x2.pdf

2014-marburg-handout-2x2.pdf: 2014-marburg-handout.pdf
	beamer2handout $?

o-public: 2014-marburg-handout-2x2.pdf 
	scp -p 2014-marburg-handout-2x2.pdf home.hpsg.fu-berlin.de:/home/www/doc/.pdf


clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux  *.snm *.toc *.nav *.out


realclean: clean
	rm -f *.dvi *.ps *.pdf
