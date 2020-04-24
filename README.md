# langscibook

LaTeX class and additions for typesetting books to be published with Language Science Press

This repository contains the most recent development build. See the [latex-skeletons](https://github.com/langsci/latex-skeletons) repository for ready to use templates.

## submodules

In order to ease the installation procedure, submodules are hardwired, i.e., the files of the following langsci repositories have been already copied to the respective directories:

 * [biblatex-sp-unified](https://github.com/langsci/biblatex-sp-unified) ==>  langsci/bst/biblatex-sp-unified
 * [langsci-fonts](https://github.com/langsci/langsci-fonts) ==> langsci/fonts

We aim to keep repositories and directories identical.

## installation

In your terminal, you can clone the repository with the following command:

`git clone --recursive https://github.com/langsci/latex.git`

## class options of langscibook.cls

option | values (defaults in bold face) | meaning
-------|--------|---------
arseneau | | use Donald Arseneau's procedure for automatic widow and orphan control. *This feature is experimental.*
babelshorthands | | use shorthands defined for German
biblatex | | use BibLaTeX (default)
biblatexbackend | **biber** \| bibtex  | the backend of BibLaTeX
booklanguage | **english** \| french \| german \| portuguese | language the book is written in
collection | | for making the book an edited volume
collectionchapter | | add chapter prefix to each contribution
collectiontoclong | | more detailed table of content in edited volumes
copyright | **CC-BY** \| CC-BY-ND \| CC-BY-SA | choice of copyright
decapbib | true / **false** | If you want to have a `booklanguage` other than English, but still have English language settings in your bibliography, e.g. if you have a lot of English sources and/or want to decapitalise the bibliography. (This assumes `biblatex=true`).
draftmode | | switch to draft mode (adds: draft stamp, indication of overlong lines, date)
minimal | | A speed-optimised mode - it disables generation of the cover and does not load font files. 
multiauthors | | change editor suffix to `(eds.)`
nobabel | | do not load the babel package (load it manually instead and include custom languages)
nonflat | | switch paths when using the langsci folder
nonewtxmath | | suppress newtxmath (default)
newtxmath | | activate newtxmath
number | \<number\> | number of the book within the series
oldstylenumbers | | Global option for old style ("lowercase", "medieval") numerals within the scope of serif \textsc and \scshape
openreview | | switch to open review mode
output | **book** \| inprep \| paper \| guidelines \| cover \| coverbodsc\| coverbodhc \| covercreatespace | different output formats
series | sidl \| __eotms__ \| ... | the series code (see series.def for a list of abbreviations)
showindex | | show index commands on margin
smallfont | | use 10pt as fontsize
spinewidth | | the width of the spine, used for cover creation
undecapitalize | | do not change the casing of titles in the list of references

## defined environments, commands, etc.
name | type | descrition | usage
-------|--------|---------|---------
paperappendix | env | Use appendices in papers in collected volumes | `\begin{paperappendix} \section{Title of Appendix} ... \end{paperappendix}`
issueandeditor | cmd | print issue title in bibliography | `\PassOptionsToPackage{issueandeditor=true}{biblatex}`
patch mkbibindexname | cmd | disable capitalisation of last names in the index | `\patchcmd{\mkbibindexname}{\ifdefvoid{#3}{}{\MakeCapital{#3} }}{\ifdefvoid{#3}{}{#3 }}{}{\AtEndDocument{\typeout{mkbibindexname could not be patched.}}}`
nycot | cmd | sort bibliography by cite order  | `\ExecuteBibliographyOptions{sorting=nycot}`
