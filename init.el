;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs-autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs-backups/"))))
 '(c-default-style (quote ((java-mode . "java") (awk-mode . "awk") (other . "gnu"))))
 '(c-report-syntactic-errors t)
 '(column-number-mode t)
 '(confirm-kill-emacs nil)
 ;; '(face-font-family-alternatives (quote (("Monospace" "courier" "fixed") ("courier" "CMU Typewriter Text" "fixed") ("Sans Serif" "helv" "helvetica" "arial" "fixed") ("helv" "helvetica" "arial" "fixed"))))
 '(inhibit-startup-screen t)
 '(lpr-command "/usr/local/bin/lpr-cups")
 '(nxhtml-autoload-web nil t)
 '(org-agenda-files (quote ("~/Work.org")))
 '(org-fontify-done-headline nil)
 '(org-hide-leading-stars t)
 '(printer-name "rh1comp")
 '(server-host "fiery.morningside.edu")
 '(server-mode t)
 '(server-use-tcp t))
;;(custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
;; '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(add-to-list 'load-path "~/.emacs-extensions") ;; comment if autopair.el is in standard load path 
(add-to-list 'load-path "~/.emacs.d/el")
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/g-client")

;; Bring in some common lisp (right now used for the `case` function below.
(require 'cl)

;; PHP stuff
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; Puppet stuff
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet code." t)
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;; Autopair stuff.
;;(require 'autopair)
;;(autopair-global-mode) ;; enable autopair in all buffers 
;;

;; Tramp settings
(require 'tramp)
(setq tramp-default-method "ssh")

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; Set default browser to macosx-default-browser otherwise 
;; /usr/bin/firefox, depending on platform.
(case system-type
  ('darwin
   (setq browse-url-generic-function 'browse-url-default-macosx-browser))
  ('gnu/linux
   (setq browse-url-generic-program "/usr/bin/google-chrome"
		 browse-url-browser-function 'browse-url-generic))
  ('berkeley-unix
   (setq browse-url-generic-program "/usr/local/bin/chrome"
		 browse-url-browser-function 'browse-url-generic)))

;;;; SLIME Stuff
(case system-type
  ('darwin     
   (setq inferior-lisp-program "/usr/local/bin/sbcl")) ; MacOSX Lisp system
  ('gnu/linux
   (setq inferior-lisp-program "/usr/bin/sbcl"))       ; Linux Lisp system
  ('berkeley-unix
   (setq inferior-lisp-program "/usr/local/bin/sbcl"))) ; FreeBSD Lisp system

(setq lisp-indent-function 'common-lisp-indent-function
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
(add-to-list 'load-path "~/.emacs.d/slime/")  ; your SLIME directory
(require 'slime-autoloads)
(slime-setup '(slime-fancy)) ; almost everything

;;;; Lisp indentation
(set (make-local-variable lisp-indent-function) 
     'common-lisp-indent-function)

;;;; cpp indentation (RANDY-MODE)
;; This is based on the GNU style with the basic-offset
;; set to 3 per the style guide
;;(defconst randys-c-style
;;  '("gnu"
;;    (c-basic-offset . 3)
;;    (c-offsets-alist
;;     (statement-block-intro . 0))))

(defconst gnu-c-style-with-4-spaces
  '("gnu"
     (c-basic-offset . 4)))

(defun my-c-mode-hook ()
;;  (c-add-style "RANDY" randys-c-style t)
  (setq c-basic-offset 4)
  (define-key c-mode-base-map "." 'semantic-complete-self-insert)
  (define-key c-mode-base-map ">" 'semantic-complete-self-insert))

(add-hook 'c-mode-common-hook 'my-c-mode-hook)

;; fix meta on Solaris
(if (eq system-type 'usg-unix-v)
    (setq x-alt-keysym 'meta))

;; OrgMode keys
(global-set-key (kbd "C-c a") 'org-agenda)

;; TODO Dependencies (protect blocked todo's)
(setq org-enforce-todo-dependencies t)
(setq org-enforce-todo-checkbox-dependencies t)
(setq org-agenda-dim-blocked-tasks t)

;; Log TODO done times
(setq org-log-done 'time)

;; Keep scheduled items out of global TODO list
(setq org-agenda-todo-ignore-scheduled t)

(setq org-agenda-todo-list-sublevels nil)

(if (eq system-type 'darwin)
    (global-set-key (kbd "C-c a") 'org-agenda))

;; Python stuff
(setq-default indent-tabls-mode nil)
(setq-default tab-width 4)
(defun my-python-mode-hook ()
  (define-key python-mode-map "." 'semantic-complete-self-insert)
  (line-number-mode 1))

(add-hook 'python-mode-hook 'my-python-mode-hook)

;; Google Apps stuff
(setq g-user-email "meyersh@morningside.edu")
;;(load-library "g")

;; Ido mode (pretty cool)
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.


;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs-autosaves/" t)
(make-directory "~/.emacs-backups/" t)

;; Enable cedet
(load-file "~/.emacs.d/cedet/common/cedet.el")
;; Save semantic stuff in ~/.emacs.d/semanticdb
(setq semanticdb-default-save-directory "~/.emacs.d/semanticdb")

;; I don't really plan on using projects.
(global-ede-mode nil)
(require 'semantic-ia)
(semantic-load-enable-gaudy-code-helpers)
(semantic-add-system-include "/usr/local/lib/python2.7" 'python-mode)
;;(setq semantic-python-dependency-system-include-path
;;      '("/usr/lib/python2.6/"))

;; FreeBSD paths
(case system-type
  ('berkeley-unix
   (semantic-add-system-include "/usr/include/c++/4.2" 'c++-mode)
   (semantic-add-system-include "/usr/include/c++/4.2" 'c-mode))
  (t nil)) ; This is silly, but I may want to add other paths later.

;; Taken from the comment section in inf-ruby.el
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files")
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

;; Some pretty colors
;;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/color-theme/")
;;(require 'color-theme)
;;(eval-after-load "color-theme"
;;  '(progn
;;	(color-theme-initialize)
;;	(color-theme-subtle-hacker)))

;; Re-enable the erase-buffer command. Mua
(put 'erase-buffer 'disabled nil)

;; Git stuff
(case system-type
  ('gnu/linux
   (load "/usr/share/doc/git-1.7.7.6/contrib/emacs/git.el")
   (load "/usr/share/doc/git-1.7.7.6/contrib/emacs/git-blame.el")
   (load "/usr/share/emacs/23.3/lisp/vc-git.elc")
   (add-to-list 'vc-handled-backends 'GIT)))
