# specify thh main file and all the files that you are including
SOURCE=  main.tex $(wildcard local*.tex) $(wildcard chapters/*.tex) \
LSP/langsci.cls

# specify your main target here:
pdf: main.bbl main.pdf  #by the time main.pdf, bib assures there is a newer aux file

all: pod cover

complete: index main.pdf

index:  main.snd
 
main.pdf: main.aux
	xelatex main 

main.aux: $(SOURCE)
	xelatex -no-pdf main 

#create only the book
main.bbl:  $(SOURCE) localbibliography.bib  
	xelatex -no-pdf main 
	bibtex -min-crossrefs=200 main 


main.snd: main.bbl
	sed -i s/.*\\emph.*// main.adx #remove titles which biblatex puts into the name index
	sed -i 's/hyperindexformat{\\\(infn {[0-9]*\)}/\1/' main.sdx # ordering of references to footnotes
	sed -i 's/hyperindexfmake bormat{\\\(infn {[0-9]*\)}/\1/' main.adx
	sed -i 's/hyperindexformat{\\\(infn {[0-9]*\)}/\1/' main.ldx
# 	python3 fixindex.py
# 	mv mainmod.adx main.adx
	makeindex -o main.and main.adx
	makeindex -o main.lnd main.ldx
	makeindex -o main.snd main.sdx 
	xelatex main 
 

#create a png of the cover
cover: FORCE
	convert main.pdf\[0\] -quality 100 -background white -alpha remove -bordercolor black -border 2  cover.png
	cp cover.png googlebooks_frontcover.png
	convert -geometry 50x50% cover.png covertwitter.png
	display cover.png
 
	
#prepare for print on demand services	
pod: bod createspace googlebooks
 
#prepare for submission to BOD
bod: bod/bodcontent.pdf 

bod/bodcontent.pdf: complete
	sed "s/output=short/output=coverbod/" main.tex >bodcover.tex 
	xelatex bodcover.tex  
	xelatex bodcover.tex  
	mv bodcover.pdf bod
	./filluppages 4 main.pdf bod/bodcontent.pdf 

# prepare for submission to createspace
createspace:  createspace/createspacecontent.pdf 

createspace/createspacecontent.pdf: complete
	sed "s/output=short/output=covercreatespace/" main.tex >createspacecover.tex 
	xelatex createspacecover.tex 
	xelatex createspacecover.tex 
	mv createspacecover.pdf createspace
	./filluppages 1 main.pdf createspace/createspacecontent.pdf 

googlebooks: googlebooks_interior.pdf

googlebooks_interior.pdf: complete
	cp main.pdf googlebooks_interior.pdf
	pdftk main.pdf cat 1 output googlebooks_frontcover.pdf 

openreview: openreview.pdf
	

openreview.pdf: main.pdf
	pdftk main.pdf multistamp orstamp.pdf output openreview.pdf 

proofreading: proofreading.pdf
	

proofreading.pdf: main.pdf
	pdftk main.pdf multistamp prstamp.pdf output proofreading.pdf 


#housekeeping	
clean:
	rm -f *.bak *~ *.backup *.tmp \
	*.adx *.and *.idx *.ind *.ldx *.lnd *.sdx *.snd *.rdx *.rnd *.wdx *.wnd \
	*.log *.blg *.ilg \
	*.aux *.toc *.cut *.out *.tpm *.bbl *-blx.bib *_tmp.bib \
	*.glg *.glo *.gls *.wrd *.wdv *.xdv \
	*.run.xml \
	chapters/*aux chapters/*~ chapters/*.bak chapters/*.backup

realclean: clean
	rm -f *.dvi *.ps *.pdf 

FORCE:
