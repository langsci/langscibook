# latex

LaTeX class and additions for typesetting books to be published with Language Science Press

This repository contains the most recent development build. See the [latex-skeletons](https://github.com/langsci/latex-skeletons) repository for ready to use templates.

## installation

In your terminal, you can clone the repository and download the contained submodules with the following command: 

`git clone --recursive https://github.com/langsci/latex.git`

In case you already have cloned the repository, don't forget to also update the submodules together with `git pull`:

`git submodule update --init --recursive`


## class options of langscibook.cls

option | values (defaults in bold face) | meaning
-------|--------|---------
biblatex | | use BibLaTeX (default)
biblatexbackend | **bibtex** \| biber | the backend of BibLaTeX
collection | | for making the book an edited volume
collectionchapter | | add chapter prefix to each contribution
collectiontoclong | | more detailed table of content in edited volumes
copyright | **CC-BY** \| CC-BY-ND | choice of copyright
draftmode | | switch to draft mode (adds: draft stamp, indication of overlong lines, date)
modfonts | | use modified fonts
multiauthors | | change editor suffix to `(eds.)`
no babel | | do not load the babel package (load it manually instead and include custom languages)
nonflat | | switch paths when using the langsci folder 
nonewtxmath | | suppress newtxmath (and use standard, ugly math fonts)
number | \<number\> | number of the book within the series
openreview | | switch to open review mode
output | **book** \| inprep \| paper \| guidelines \| cover \| coverbodsc\| coverbodhc \| covercreatespace | different output formats
series | sidl \| __eotms__ \| ... | the series code (see series.def for a list of abbreviations)
showindex | | show index commands on margin
smallfont | | use 10pt as fontsize
spinewidth | | the width of the spine, used for cover creation
undecapitalize | | do not change the casing of titles in the list of references
