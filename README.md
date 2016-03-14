# latex

LaTeX class and additions for typesetting books to be published with Language Science Press

This repository contains the most recent development build. See the [latex-skeletons](https://github.com/langsci/latex-skeletons) repository for ready to use templates.

## class options of langscibook.cls

option | values (defaults in bold face) | meaning
-------|--------|---------
biblatex | | use BibLaTeX (default)
biblatexbackend | **bibtex** \| biber | the backend of BibLaTeX
bibtex | | use BibTeX
blackandwhite | | remove all colors
collection | | for making the book an edited volume
collectionchapter | | add chapter prefix to each contribution
collectiontoclong | | more detailed table of content in edited volumes
copyright | **CC-BY** \| CC-BY-ND | choice of copyright
coverus | | prints isbnsoftcoverus instead of isbnsoftcover if output=covercreatespace
draftmode | | switch to draft mode (adds: draft stamp, indication of overlong lines, date)
isbndigital | \<isbn\> | the ISBN of the digital release
isbnsoftcover | \<isbn\> | the ISBN of the soft cover release
isbnsoftcoverus | \<isbn\> | the ISBN of the US version of soft cover release (used for distribution to US academic institutions)
isbnhardcover | \<isbn\> | the ISBN of the hard cover release
noindex | | remove index
newtxmath | | switch math fonts to newtxmath (**please add this**; it should be default)
number | \<number\> | number of the book within the series
openreview | | switch to open review mode
output | short \| **long** \| inprep \| paper \| guidelines \| cover \| coverbod \| coverdob \| covercreatespace | different output formats
series | sidl \| __eotms__ \| ... | the series code (see series.def for a list of abbreviations)
showindex | | show index commands on margin
smallfont | | use 10pt as fontsize
url | \<url\> | the URL of the book 
