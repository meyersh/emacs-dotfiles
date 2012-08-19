;;; Compiled snippets and support files for `lisp-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'lisp-mode
                     '(("addal" "(autoload '${1:function-name} \"${2:file-name}\" \"${3:document}\" ${0:interactive})" "(autoload '... \"...\" \"...\" ...)" nil nil nil nil nil nil)
                       ("addbk" "(basic-set-key-alist ${0:rest})" "(basic-set-key-alist ...)" nil nil nil nil nil nil)
                       ("addbku" "(basic-unset-key-list ${1:keymap} '(\"${0:key-list}\"))" "(basic-unset-key-list ... ...)" nil nil nil nil nil nil)
                       ("addc" ";;; ### $1 ###\n;;; --- $2\n$0" ";;; ### ... ### ..." nil nil nil nil nil nil)
                       ("addgk" "(global-set-key (kbd \"${1:some-key}\") ${0:some-command})" "(global-set-key (kbd \"...\") ...)" nil nil nil nil nil nil)
                       ("addguk" "(global-unset-key (kbd ${0:key-value}))" "(global-unset-key ...)" nil nil nil nil nil nil)
                       ("addhk" "(add-hook ${1:hook} ${0:function})" "(add-hook ... ...)" nil nil nil nil nil nil)
                       ("addic" "((= c ?${1:char}) (${0:command}))" "((= c ...) (...))" nil nil nil nil nil nil)
                       ("addif" "(if ${1:conditional}\n    ${2:then})" "(if ... ... ...)" nil nil nil nil nil nil)
                       ("addip" "(in-package :${0:library-name})\n" "(in-package :...)" nil nil nil nil nil nil)
                       ("addlk" "(define-key ${1:some-mode-map} (kbd \"${2:some-key}\") ${0:some-command})" "(define-key ... (kbd \"...\") ...)" nil nil nil nil nil nil)
                       ("addlt" ";;;;;;;;;;;;;;;;;;;; $1 ;;;;;;;;;;;;;;;;;;;;\n$0\n" ";;;;;;;;;;;;;;;;;;;; ... ;;;;;;;;;;;;;;;;;;;;" nil nil nil nil nil nil)
                       ("addpr" "(provide '${0:library-name})" "(provide '...)" nil nil nil nil nil nil)
                       ("addrq" "(require '${0:library-name})" "(require '...)" nil nil nil nil nil nil)
                       ("addse" "(setf ${1:variable-name} ${0:variable-value})" "(setq ... ...)" nil nil nil nil nil nil)
                       ("addt" ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;; $1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n$0\n" ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ... ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;" nil nil nil nil nil nil)
                       ("addtl" "(add-to-list ${1:list-var} ${0:element})" "(add-to-list ... ...)" nil nil nil nil nil nil)
                       ("addul" "(unless ${1:conditional}\n  ${0:body})" "(unless ... ...)" nil nil nil nil nil nil)
                       ("defas" "(defalias ${1:symbol} ${0:define})" "(defalias ... ...)" nil nil nil nil nil nil)
                       ("defav" "(defadvice ${1:function-name} (${2:args})\n  \"${3:advice-document}\"\n  (${0:advice-body})\n)" "(defadvice ... ... ...)" nil nil nil nil nil nil)
                       ("defcm" "(defcustom ${1:symbol} ${2:value}\n  \"${3:doc}\"\n  ${0:body})\n" "(defcustom ... ... ... ...)" nil nil nil nil nil nil)
                       ("deffc" "(defface ${1:face}\n  ${2:spec}\n  \"${3:doc}\"\n  ${0:args})\n" "(defface ... ... ... ...)" nil nil nil nil nil nil)
                       ("deffu" "(defun ${1:Function Name} ($2)\n  \"${3:Function document}\"\n  $0)" "(defun ... (...) \"...\" ...)" nil nil nil nil nil nil)
                       ("defpr" "(defparameter ${1:name} ${0:value})\n" "(defparameter ... ...)" nil nil nil nil nil nil)
                       ("defsc" "(define-stumpwm-command ${1:name} ()\n  $0)" "(define-stumpwm-command ... ...)" nil nil nil nil nil nil)
                       ("deft" "(defun test ()\n  \"Just for test\"        \n  (interactive)\n  $0\n)\n" "(defun test () \"Just for test\" (interactive) ...)" nil nil nil nil nil nil)
                       ("defvr" "(defvar ${1:variable-name} ${2:variable-varlue}\n  \"${0:document}\")" "(defvar ... ... \"...\")" nil nil nil nil nil nil)
                       ("dlhk" "(dolist (hook (list\n               ${1:mode-list}\n               ))\n  (add-hook hook '${0:mode-hook}))" "(dolist (hook (list ... )) (add-hook hook '...))" nil nil nil nil nil nil)
                       ("dlhkd" "(dolist (hooked (list\n               ${1:mode-list}\n               ))\n  (add-hook '${0:mode-hook} 'hooked))\n" "(dolist (hooked (list ...)) (add-hook '... 'hooked))" nil nil nil nil nil nil)
                       ("evalal" "(eval-after-load ${1:file-name}\n  ${0:form})" "(eval-after-load ... ...)" nil nil nil nil nil nil)
                       ("lt" "(let (${1:varlist})\n  ${0:body})" "(let ... ...)" nil nil nil nil nil nil)
                       ("rsc" "(run-shell-command $0)" "(run-shell-command ...)" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Sat Aug 18 22:05:43 2012
