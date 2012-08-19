;;; Compiled snippets and support files for `haskell-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'haskell-mode
                     '(("addc" "{- | ${0:comment} -}" "{- | ... -}" nil nil nil nil nil nil)
                       ("addd" "${1:name} :: $2\n$1 $0" "... :: ... -> ... " nil nil nil nil nil nil)
                       ("adde" "= ${0:content}" "= ..." nil nil nil nil nil nil)
                       ("addg" "| ${0:content}" "| ..." nil nil nil nil nil nil)
                       ("addi" "import ${0:content}" "import ..." nil nil nil nil nil nil)
                       ("addo" "| otherwise = ${0:content}\n" "| otherwise = ..." nil nil nil nil nil nil)
                       ("addq" "\\`${1:content}\\` ${0:get here}\n" "`...`" nil nil nil nil nil nil)
                       ("addw" "where ${0:content}" "where ..." nil nil nil nil nil nil)
                       ("header" "-----------------------------------------------------------------------------\n-- |\n-- Module      :  ${1:Module Name}\n-- Copyright   :  (c) ${2:Andy Stewart} 2008\n-- License     :  GPL\n-- \n-- Maintainer  :  ${3:lazycat.manatee@gmail.com}\n-- Stability   :  experimental\n-- Portability :  non-portable (not tested)\n--\n-- ${4:Simple Describe}\n--\n-- * Changlelog:\n--\n--      ${5:Today}\n--              First released.\n-- \n-- * TODO\n--      \n--      $6\n-- \n-----------------------------------------------------------------------------\n" "header" nil nil nil nil nil nil)
                       ("modwh" "module ${1:module-name} (${0:module-interface}) where" "module ... where" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Sat Aug 18 22:05:43 2012
