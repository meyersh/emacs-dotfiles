;;; Compiled snippets and support files for `yaoddmuse-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'yaoddmuse-mode
                     '(("[" "[${1:url} ${2:name}]$0\n" "[url name]" nil nil nil nil nil nil)
                       ("[[" "[[${1:name}]]$0\n" "[[name]]" nil nil nil nil nil nil)
                       ("add_" "_${1:name}_$0\n" "_underline-" nil nil nil nil nil nil)
                       ("addb" "*${1:*}${2:name}*$1$0\n" "*Bold*" nil nil nil nil nil nil)
                       ("addbb" "''${1:name}''$0\n" "''Bold''" nil nil nil nil nil nil)
                       ("addc" "/${1:name}/$0\n" "/italic/" nil nil nil nil nil nil)
                       ("addd" "[new]\n$0        \n[new]\n" "[new] dialog [new]" nil nil nil nil nil nil)
                       ("adde" "==What is `yaoddmuse-pagename` ?==\n`yaoddmuse-pagename` is a mode that ${1:Describe}.\n\n==Install==\nPut Lisp:${2:package-name}.el in your load-path, add\n{{{\n    (require '$2)\n}}}    \nin ~/.emacs\n\n==Usage==\n${3:Usage}\n\n==Customize==\nAll below option can customize by: M-x customize-group RET $2 RET\n\n${4:Customize}\n" "Add entire yaoddmuse template code." nil nil nil nil nil nil)
                       ("addee" "==What is `yaoddmuse-pagename` ?==\n`yaoddmuse-pagename` is a mode that ${1:Describe}.\n\n==Why the need for `yaoddmuse-pagename` ?==\n${2:Why}.\n\n==Install==\nPut Lisp:${3:package-name}.el in your load-path, add\n{{{\n    (require '$3)\n}}}    \nin ~/.emacs\n\n==Usage==\n${4:Usage}\n\n==Customize==\nAll below option can customize by: M-x customize-group RET $3 RET\n\n${5:Customize}\n" "Add entire yaoddmuse template code." nil nil nil nil nil nil)
                       ("addh" "=${1:=}${2:name}=$1$0\n" "==Heading Name==" nil nil nil nil nil nil)
                       ("addi" "[[image:${1:PageName}]]$0\n" "[[image:ImagePage]]" nil nil nil nil nil nil)
                       ("addii" "Here is a screenshot: $0" "Here is a screenshot: ImageName" nil nil nil nil nil nil)
                       ("addl" "Lisp:${1:FileName}.el$0\n" "Lisp:file.el" nil nil nil nil nil nil)
                       ("addm" "-- `yaoddmuse-username`\n" "-- yaoddmuse-username" nil nil nil nil nil nil)
                       ("addn" "[new:`yaoddmuse-username`:`(format-time-string \"%Y-%m-%d %H:%M\")` UTC]\n$0 -- `yaoddmuse-username`\n" "[new:UTC time] -- UserName" nil nil nil nil nil nil)
                       ("addp" "`yaoddmuse-pagename`\n" "Insert yaoddmuse page name" nil nil nil nil nil nil)
                       ("addpr" "<pre>\n$0\n</pre>" "<pre> ... </pre>" nil nil nil nil nil nil)
                       ("adds" "{{{\n        $0\n}}}" "{{{source code}}}" nil nil nil nil nil nil)
                       ("addt" "<${1:tag}>${1:name}</$1>$0\n" "<tag>content</tag>" nil nil nil nil nil nil)
                       ("addw" "`yaoddmuse-wikiname`\n" "Insert yaoddmuse wiki name" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Sat Aug 18 22:05:43 2012
