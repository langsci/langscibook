# LaTeX package recommendations to use with `langscibook`

## Examples
package | recommmended? | reason
-------|--------|---------
langsci-gb4e |  yes | fully compatible and documented
linguex | no | incompatible with `langscibook` without the modifcations in `langsci-linguex`
expex | yes | compatible with `langscibook`, but `langsci-gb4e` has to be deactivated in the complete book

## Tree structures
package | recommmended? | reason
-------|--------|---------
forest | yes | versatile package with a useful, easy to read syntax
tikz-qtree | yes | can be used, but is less preferrable compared to `forest`
xyling | no | complicated syntax, high computing times leading to significant increase in document compilation
pst-jtree | no | 
tree-dvips | no | compatibility issues with core `langscibook` components

## Other linguistic packages
package | recommmended? | reason
-------|--------|---------
tipa | no | please use Unicode instead. You can take a look at our [`langsci-textipa`](https://github.com/langsci/langscibook/blob/master/langsci-textipa.sty) sub-package for TeX macro bindings to Unicode chars. Please also load `ot-tableau` without tipa: `\usepackage[notipa]{ot-tableau}`.

## Proofs (sequential calculus)
package | recommmended? | reason
-------|--------|---------
ebproof | yes | aligns well with example environments
bussproofs | no | does not align well in examples, insufficient means for customisation

## General
package | recommmended? | reason
-------|--------|---------
mathtools | ~ | watch out for the re-definitions in `\overbrace` etc.
tocloft | no | Can clash with the Table of ... settings from `scrbook`. Use methods shipped with `scrbook` instead.
wrapfigure | no | Figures wrapped around the main text are incompatible with our house style and should never be used.
