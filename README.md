# langscibook

This repository contains the most recent development build of our LaTeX class. In normal circumstances, there is no need for book authors and editors to interact with this repository. If you'd like to start working on your monograph, edited volume, or paper in a collection, please have a look at our [latex-skeletons](https://github.com/langsci/latex-skeletons) repository, which contains ready-to-use templates.

## class options of langscibook.cls

option | values (defaults in bold face) | meaning
-------|--------|--------- 
babelshorthands | | use shorthands defined for German
biblatexbackend | **biber** \| bibtex  | the backend of BibLaTeX
booklanguage | **english** \| chinese \| french \| german \| portuguese \| spanish | language the book is written in
classicfloatnumbers | true / **false** | Restore float and equation numbering to `<chapter no>.<id>` in edited volumes. If set to `false` (default) the label will just be `<id>`. Only applied in edited volumes.
collection | | for making the book an edited volume
collectiontoclong | | more detailed table of content in edited volumes
copyright | **CC-BY** \| CC-BY-ND \| CC-BY-SA | choice of copyright
decapbib | true / **false** | If you want to have a `booklanguage` other than English, but still have English language settings in your bibliography, e.g. if you have a lot of English sources and/or want to decapitalise the bibliography. (This assumes `biblatex=true`).
draftmode | | switch to draft mode (adds: draft stamp, indication of overlong lines, date)
minimal | | A speed-optimised mode - it disables generation of the cover and does not load font files. 
multiauthors | (automatically determined) | manually change editor suffix to `(eds.)`. Usually no user action required as the value is obtained automatically.
nobabel | | do not load the babel package (load it manually instead and include custom languages)
nonewtxmath | | suppress newtxmath (default)
newtxmath | | activate newtxmath
number | \<number\> | number of the book within the series
oldstylenumbers | | Global option for old style ("lowercase", "medieval") numerals within the scope of serif \textsc and \scshape
openreview | | switch to open review mode
output | **book** \| inprep \| paper \| guidelines \| cover \| coverbodsc\| coverbodhc \| covercreatespace | different output formats
proofs | | show line numbers in the margin of the output PDF
series | sidl \| __eotms__ \| ... | the series code (see series.def for a list of abbreviations)
showindex | | show index commands on margin
smallfont | | use 10pt as fontsize
spinewidth | | the width of the spine, used for cover creation
undecapitalize | | do not change the casing of titles in the list of references
uniformtopskip | | disable Donald Arseneau's procedure for automatic widow and orphan control. This procedure results in different `\topskip`s on different pages. This is undesirable when you want each page to have exactly the same number of lines in the type area.

## defined environments, commands, etc.
name | type | descrition | usage
-------|--------|---------|---------
issueandeditor | cmd | print issue title in bibliography | `\PassOptionsToPackage{issueandeditor=true}{biblatex}`
patch mkbibindexname | cmd | disable capitalisation of last names in the index | `\patchcmd{\mkbibindexname}{\ifdefvoid{#3}{}{\MakeCapital{#3} }}{\ifdefvoid{#3}{}{#3 }}{}{\AtEndDocument{\typeout{mkbibindexname could not be patched.}}}`
nycot | cmd | sort bibliography by cite order  | `\ExecuteBibliographyOptions{sorting=nycot}`
