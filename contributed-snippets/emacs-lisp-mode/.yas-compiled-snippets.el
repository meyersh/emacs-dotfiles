;;; Compiled snippets and support files for `emacs-lisp-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'emacs-lisp-mode
                     '(("ada" "(ad-activate '${1:Function})\n" "(ad-activate ...)" nil nil nil nil nil nil)
                       ("adda" "(ad-deactivate '${1:Function})\n" "(ad-deactivate ...)" nil nil nil nil nil nil)
                       ("addal" "(autoload '${1:function-name} \"${2:file-name}\" \"${3:document}\" ${0:interactive})" "(autoload '... \"...\" \"...\" ...)" nil nil nil nil nil nil)
                       ("addc" ";;; ### $1 ###\n;;; --- $2\n$0" ";;; ### ... ### ..." nil nil nil nil nil nil)
                       ("addcl" ";; `(format-time-string \"%Y/%m/%d\")`\n;;  * `user-full-name`:\n;;      * $0\n;;\n" "Add change logs" nil nil nil nil nil nil)
                       ("addcll" ";; ${1:Date}\n;;  * ${2:Name}:\n;;      * $0\n;;\n" "Add change logs with details" nil nil nil nil nil nil)
                       ("addgk" "(global-set-key (kbd \"${1:some-key}\") ${0:some-command})" "(global-set-key (kbd \"...\") ...)" nil nil nil nil nil nil)
                       ("addguk" "(global-unset-key (kbd ${0:key-value}))" "(global-unset-key ...)" nil nil nil nil nil nil)
                       ("addhk" "(add-hook '${1:hook} ${0:function})\n" "(add-hook ... ...)" nil nil nil nil nil nil)
                       ("addic" "((= c ?${1:char}) (${0:command}))" "((= c ...) (...))" nil nil nil nil nil nil)
                       ("addif" "(if ${1:conditional}\n    ${2:then})" "(if ... ... ...)" nil nil nil nil nil nil)
                       ("addlk" "(define-key ${1:some-mode-map} (kbd \"${2:some-key}\") ${0:some-command})" "(define-key ... (kbd \"...\") ...)" nil nil nil nil nil nil)
                       ("addlt" ";;;;;;;;;;;;;;;;;;;; $1 ;;;;;;;;;;;;;;;;;;;;\n$0\n" ";;;;;;;;;;;;;;;;;;;; ... ;;;;;;;;;;;;;;;;;;;;" nil nil nil nil nil nil)
                       ("addpr" "(provide '${0:library-name})" "(provide '...)" nil nil nil nil nil nil)
                       ("addrq" "(require '${0:library-name})" "(require '...)" nil nil nil nil nil nil)
                       ("addse" "(setq ${1:variable-name} ${0:variable-value})" "(setq ... ...)" nil nil nil nil nil nil)
                       ("addsk" "(lazy-set-key ${0:rest})\n" "(lazy-set-key ...)" nil nil nil nil nil nil)
                       ("addt" ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;; $1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n$0\n" ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ... ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;" nil nil nil nil nil nil)
                       ("addtl" "(add-to-list ${1:list-var} ${0:element})" "(add-to-list ... ...)" nil nil nil nil nil nil)
                       ("addul" "(unless ${1:conditional}\n  ${0:body})" "(unless ... ...)" nil nil nil nil nil nil)
                       ("addusk" "(lazy-unset-key '(\"${1:key-list}\")$0)\n" "(lazy-unset-key ... ...)" nil nil nil nil nil nil)
                       ("defas" "(defalias ${1:symbol} ${0:define})" "(defalias ... ...)" nil nil nil nil nil nil)
                       ("defav" "(defadvice ${1:function-name} (${2:args})\n  \"${3:advice-document}\"\n  (${0:advice-body})\n)" "(defadvice ... ... ...)" nil nil nil nil nil nil)
                       ("defcm" "(defcustom ${1:symbol} ${2:value}\n  \"${3:doc}\"\n  ${0:body})" "(defcustom ... ... ... ...)" nil nil nil nil nil nil)
                       ("defcn" "(defconst ${1:symbol} ${2:initvalue}\n  \"${0:document}\")" "(defconst ... ... \"...\")" nil nil nil nil nil nil)
                       ("deffc" "(defface ${1:face}\n  ${2:spec}\n  \"${3:doc}\"\n  ${0:args})\n" "(defface ... ... ... ...)" nil nil nil nil nil nil)
                       ("deffu" "(defun ${1:Function Name} ($2)\n  \"${3:Function document}\"\n  $0)" "(defun ... (...) \"...\" ...)" nil nil nil nil nil nil)
                       ("deffua" "(defun anything-${1:name} ()\n \"${2:document}\"\n (interactive)\n (anything 'anything-$0))\n" "(defun anything-* () ... (interactive) (anything 'anything-*))" nil nil nil nil nil nil)
                       ("deffui" "(defun ${1:function-name} ($2)\n \"${3:Function documantion}.\"\n (interactive)\n $0)\n" "(defun function-name () ... (interactive) ...) " nil nil nil nil nil nil)
                       ("defgp" "(defgroup ${1:Group-Name} ${2:Group-value}\n  \"${3:Group-doc}\"\n  $0)" "(defgroup ... ... ... ...)" nil nil nil nil nil nil)
                       ("defmm" "(define-minor-mode ${1:mode-name}\n  \"${2:Document}\"\n  :init-value ${3:init-value}\n  :lighter \"${4:highlight-name}\"\n  :keymap ${5:keymap}\n  :group '${6:group})" "(define-minor-mode ... ... ... ... ... ...)" nil nil nil nil nil nil)
                       ("deft" "(defun test ()\n  \"Just for test\"        \n  (interactive)\n  $0\n)\n" "(defun test () \"Just for test\" (interactive) ...)" nil nil nil nil nil nil)
                       ("defvr" "(defvar ${1:variable-name} ${2:variable-varlue}\n  \"${0:document}\")" "(defvar ... ... \"...\")" nil nil nil nil nil nil)
                       ("defvras" "(defvar anything-c-source-${1:name}\n '((name . \"${2:describe}\")\n   $0))" "(defvar anything-c-source-* '((name . \"...\") ...))" nil nil nil nil nil nil)
                       ("dlaa" "(dolist (${1:elt-cons} '(${2:elt-cons-list}))\n  (add-to-alist '${0:alist} $1))\n \n" "(dolist (... (...)) (add-to-alist '... ...))" nil nil nil nil nil nil)
                       ("dlhk" "(dolist (hook (list\n               ${1:mode-list}\n               ))\n  (add-hook hook '${0:mode-hook}))" "(dolist (hook (list ... )) (add-hook hook '...))" nil nil nil nil nil nil)
                       ("dlhkd" "(dolist (hooked (list\n               ${1:mode-list}\n               ))\n  (add-hook '${0:mode-hook} hooked))\n" "(dolist (hooked (list ...)) (add-hook '... hooked))" nil nil nil nil nil nil)
                       ("evalal" "(eval-after-load ${1:file-name}\n  ${0:form})" "(eval-after-load ... ...)" nil nil nil nil nil nil)
                       ("header" ";;; ${1:filename}.el --- ${2:Simple description}\n\n;; Filename: $1.el\n;; Description: $2\n;; Author: `user-full-name` <`user-mail-address`>\n;; Maintainer: `user-full-name` <`user-mail-address`>\n;; Copyright (C) `(format-time-string \"%Y\")`, `user-full-name`, all rights reserved.\n;; Created: `(format-time-string \"%Y-%m-%d %T\")`\n;; Version: 0.1\n;; Last-Updated: `(format-time-string \"%Y-%m-%d %T\")`\n;;           By: `user-full-name`\n;; URL: http://www.emacswiki.org/emacs/download/$1.el\n;; Keywords: $3\n;; Compatibility: `(substring (emacs-version) 0 (string-match \" (\" (emacs-version))))`\n;;\n;; Features that might be required by this library:\n;;\n;; $4\n;;\n\n;;; This file is NOT part of GNU Emacs\n\n;;; License\n;;\n;; This program is free software; you can redistribute it and/or modify\n;; it under the terms of the GNU General Public License as published by\n;; the Free Software Foundation; either version 3, or (at your option)\n;; any later version.\n\n;; This program is distributed in the hope that it will be useful,\n;; but WITHOUT ANY WARRANTY; without even the implied warranty of\n;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n;; GNU General Public License for more details.\n\n;; You should have received a copy of the GNU General Public License\n;; along with this program; see the file COPYING.  If not, write to\n;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth\n;; Floor, Boston, MA 02110-1301, USA.\n\n;;; Commentary: \n;; \n;; $2\n;; $5\n\n;;; Installation:\n;;\n;; Put $1.el to your load-path.\n;; The load-path is usually ~/elisp/.\n;; It's set in your ~/.emacs like this:\n;; (add-to-list 'load-path (expand-file-name \"~/elisp\"))\n;;\n;; And the following to your ~/.emacs startup file.\n;;\n;; (require '$1)\n;;\n;; ${6:No need more.}\n\n;;; Customize:\n;;\n;; $7\n;;\n;; All of the above can customize by:\n;;      M-x customize-group RET $1 RET\n;;\n\n;;; Change log:\n;;	\n;; `(format-time-string \"%Y/%m/%d\")`\n;;      * First released.\n;; \n\n;;; Acknowledgements:\n;;\n;; $8\n;;\n\n;;; TODO\n;;\n;; $9\n;;\n\n;;; Require\n$10\n\n;;; Code:\n\n$0\n\n(provide '$1)\n\n;;; $1.el ends here\n" "A elisp file header" nil nil nil nil nil nil)
                       ("header+" ";;; ${1:filename}.el --- ${2:Simple description}\n\n;; Filename: $1.el\n;; Description: $2\n;; Author: ${3:`user-full-name`} <${4:`user-mail-address`}>\n;; Maintainer: ${5:`user-full-name`} <${6:`user-mail-address`}>\n;; Copyright (C) ${7:`(format-time-string \"%Y\")`}, $3, all rights reserved.\n;; Created: ${8:`(format-time-string \"%Y-%m-%d %T\")`}\n;; Version: ${9:0.1}\n;; Last-Updated: ${10:`(format-time-string \"%Y-%m-%d %T\")`}\n;;           By: $5\n;; URL: $11\n;; Keywords: $12\n;; Compatibility: ${13:`(substring (emacs-version) 0 (string-match \" (\" (emacs-version))))`}\n;;\n;; Features that might be required by this library:\n;;\n;; $14\n;;\n\n;;; This file is NOT part of GNU Emacs\n\n;;; License\n;;\n;; This program is free software; you can redistribute it and/or modify\n;; it under the terms of the GNU General Public License as published by\n;; the Free Software Foundation; either version 3, or (at your option)\n;; any later version.\n\n;; This program is distributed in the hope that it will be useful,\n;; but WITHOUT ANY WARRANTY; without even the implied warranty of\n;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n;; GNU General Public License for more details.\n\n;; You should have received a copy of the GNU General Public License\n;; along with this program; see the file COPYING.  If not, write to\n;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth\n;; Floor, Boston, MA 02110-1301, USA.\n\n;;; Commentary: \n;; \n;; $2\n;; $15\n\n;;; Installation:\n;;\n;; Put $1.el to your load-path.\n;; The load-path is usually ~/elisp/.\n;; It's set in your ~/.emacs like this:\n;; (setq load-path (append (list (expand-file \"~/elisp\")) load-path))\n;;\n;; And the following to your ~/.emacs startup file.\n;;\n;; (require '$1)\n;;\n;; ${16:No need more.}\n\n;;; Change log:\n;;	\n;; ${17:`(format-time-string \"%Y/%m/%d\")`}\n;;      * First released.\n;; \n\n;;; Acknowledgements:\n;;\n;; $18\n;;\n\n;;; TODO\n;;\n;; $19\n;;\n\n;;; Require\n$20\n\n;;; Code:\n\n$0\n\n(provide '$1)\n\n;;; $1.el ends here\n" "A elisp file header" nil nil nil nil nil nil)
                       ("header-" ";;; ${1:filename}.el --- ${2:Simple description}\n\n;; Filename: $1.el\n;; Description: $2\n;; Author: `user-full-name` <`user-mail-address`>\n;; Maintainer: `user-full-name` <`user-mail-address`>\n;; Copyright (C) `(format-time-string \"%Y\")`, `user-full-name`, all rights reserved.\n;; Created: `(format-time-string \"%Y-%m-%d %T\")`\n;; Version: 0.1\n;; Last-Updated: `(format-time-string \"%Y-%m-%d %T\")`\n;;           By: `user-full-name`\n;; URL: $3\n;; Keywords: $4\n;; Compatibility: `(substring (emacs-version) 0 (string-match \" (\" (emacs-version))))`\n;;\n;; Features that might be required by this library:\n;;\n;; $5\n;;\n\n;;; This file is NOT part of GNU Emacs\n\n;;; License\n;;\n;; This program is free software; you can redistribute it and/or modify\n;; it under the terms of the GNU General Public License as published by\n;; the Free Software Foundation; either version 3, or (at your option)\n;; any later version.\n\n;; This program is distributed in the hope that it will be useful,\n;; but WITHOUT ANY WARRANTY; without even the implied warranty of\n;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n;; GNU General Public License for more details.\n\n;; You should have received a copy of the GNU General Public License\n;; along with this program; see the file COPYING.  If not, write to\n;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth\n;; Floor, Boston, MA 02110-1301, USA.\n\n;;; Commentary: \n;; \n;; $2\n;; $6\n\n;;; Installation:\n;;\n;; Put $1.el to your load-path.\n;; The load-path is usually ~/elisp/.\n;; It's set in your ~/.emacs like this:\n;; (add-to-list 'load-path (expand-file-name \"~/elisp\"))\n;;\n;; And the following to your ~/.emacs startup file.\n;;\n;; (require '$1)\n;;\n;; ${7:No need more.}\n\n;;; Change log:\n;;	\n;; `(format-time-string \"%Y/%m/%d\")`\n;;      * First released.\n;; \n\n;;; Acknowledgements:\n;;\n;; $8\n;;\n\n;;; TODO\n;;\n;; $9\n;;\n\n;;; Require\n$10\n\n;;; Code:\n\n$0\n\n(provide '$1)\n\n;;; $1.el ends here\n" "A elisp file header, no customize information." nil nil nil nil nil nil)
                       ("lai" "(lambda () (interactive) ($0))" "(lambda () (interactive) (...))" nil nil nil nil nil nil)
                       ("lt" "(let (${1:varlist})\n  ${0:body})" "(let ... ...)" nil nil nil nil nil nil)
                       ("rmhk" "(remove-hook '${1:Hook} '${2:Function})\n" "(remove-hook ... ...)" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Sat Aug 18 22:05:43 2012