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

## Proofs (sequential calculus)
package | recommmended? | reason
-------|--------|---------
ebproof | yes | aligns well with example environments
bussproofs | no | does not align well in examples, insufficient means for customisation

## General
package | recommmended? | reason
-------|--------|---------
mathtools | ~ | watch out for the re-definitions in `\overbrace` etc.
