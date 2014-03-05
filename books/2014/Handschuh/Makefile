# specify your main target here:
all: SIDL01.pdf

# specify teh main file and all the files that you are including
SOURCE=SIDL01.tex LSP/langsci.cls introSDL.tex methodSDL.tex nompredSDL.tex exlocSDL.tex expsSDL.tex othclSDL.tex exsynSDL.tex typolSDL.tex conclSDL.tex AcknowledgmentsSDL.tex


%.pdf: %.tex $(SOURCE)
	xelatex -no-pdf $* |grep -v math
	xelatex -no-pdf $* |grep -v math
	xelatex $* -no-pdf |egrep -v 'math|PDFDocEncod' |egrep 'Warning|label|aux'
	correct-toappear
	correct-index
	makeindex -o $*.ind $*.idx
	makeindex -o $*.lnd $*.ldx
	makeindex -o $*.wnd $*.wdx
	LSP/bin/reverse-index <$*.wdx >$*.rdx
	makeindex -o $*.rnd $*.rdx
	\rm $*.adx
	authorindex -i -p $*.aux > $*.adx
	sed -e 's/}{/|hyperpage}{/g' $*.adx > $*.adx.hyp
	makeindex -o $*.and $*.adx.hyp
	xelatex $* | egrep -v 'math|PDFDocEncod' |egrep 'Warning|label|aux'


# %.pdf: %.tex $(SOURCE)
# 	xelatex -no-pdf $* |grep -v math
# 	bibtex -min-crossrefs=200 $*
# 	xelatex -no-pdf $* |grep -v math
# 	bibtex -min-crossrefs=200 $*
# 	xelatex $* -no-pdf |egrep -v 'math|PDFDocEncod' |egrep 'Warning|label|aux'
# 	correct-toappear
# 	correct-index
# 	makeindex -o $*.ind $*.idx
# 	makeindex -o $*.lnd $*.ldx
# 	makeindex -o $*.wnd $*.wdx
# 	LSP/bin/reverse-index <$*.wdx >$*.rdx
# 	makeindex -o $*.rnd $*.rdx
# 	\rm $*.adx
# 	authorindex -i -p $*.aux > $*.adx
# 	sed -e 's/}{/|hyperpage}{/g' $*.adx > $*.adx.hyp
# 	makeindex -o $*.and $*.adx.hyp
# 	xelatex $* | egrep -v 'math|PDFDocEncod' |egrep 'Warning|label|aux'


# http://stackoverflow.com/questions/10934456/imagemagick-pdf-to-jpgs-sometimes-results-in-black-background
cover: SIDL01.pdf
	convert $*.pdf\[0\] -resize 486x -background white -alpha remove -bordercolor black -border 2  cover.png



clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux *.toc *.cut *.out *.tmp *.tpm *.adx *.adx.hyp *.idx *.ilg *.ind \
	*.and *.glg *.glo *.gls *.wdx *.wnd *.wrd *.wdv *.ldx *.lnd *.rdx *.rnd *.xdv 

realclean: clean
	rm -f *.dvi *.ps *.pdf



