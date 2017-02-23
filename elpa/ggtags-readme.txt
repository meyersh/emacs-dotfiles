A package to integrate GNU Global source code tagging system
(http://www.gnu.org/software/global) with Emacs.

Usage:

Type `M-x ggtags-mode' to enable the minor mode, or as usual enable
it in your desired major mode hooks. When the mode is on the symbol
at point is underlined if it is a valid (definition) tag.

`M-.' finds definition or references according to the context at
point, i.e. if point is at a definition tag find references and
vice versa. `C-u M-.' is verbose and will ask you the name - with
completion - and the type of tag to search.

If multiple matches are found, navigation mode is entered. In this
mode, `M-n' and `M-p' moves to next and previous match, `M-}' and
`M-{' to next and previous file respectively. `M-o' toggles between
full and abbreviated displays of file names in the auxiliary popup
window. When you locate the right match, press RET to finish which
hides the auxiliary window and exits navigation mode. You can
resume the search using `M-,'. To abort the search press `M-*'.

Normally after a few searches a dozen buffers are created visiting
files tracked by GNU Global. `C-c M-k' helps clean them up.
