(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(c-default-style (quote ((java-mode . "java") (awk-mode . "awk") (other . "gnu"))))
 '(c-report-syntactic-errors t)
 '(column-number-mode t)
 '(confirm-kill-emacs nil)
 '(face-font-family-alternatives (quote (("Monospace" "courier" "fixed") ("courier" "CMU Typewriter Text" "fixed") ("Sans Serif" "helv" "helvetica" "arial" "fixed") ("helv" "helvetica" "arial" "fixed"))))
 '(inhibit-startup-screen t)
 '(lpr-command "/usr/bin/lpr")
 '(nxhtml-autoload-web nil t)
 '(org-agenda-files (quote ("~/Work.org")))
 '(org-fontify-done-headline nil)
 '(org-hide-leading-stars t)
 '(printer-name "rh1comp")
 '(server-host "fiery.morningside.edu")
 '(server-mode t)
 '(server-use-tcp t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(add-to-list 'load-path "~/.emacs-extensions") ;; comment if autopair.el is in standard load path 
(add-to-list 'load-path "~/.emacs.d/el")
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/g-client")

;; PHP stuff
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;;(require 'autopair)
;;(autopair-global-mode) ;; enable autopair in all buffers 
;;
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
(if (eq system-type 'darwin)
    (setq browse-url-generic-function 'browse-url-default-macosx-browser)
  (setq browse-url-generic-program "/usr/bin/google-chrome"
	browse-url-browser-function 'browse-url-generic))

;;;; SLIME Stuff
(if (eq system-type 'darwin)
    (setq inferior-lisp-program "/usr/local/bin/sbcl") ; MacOSX Lisp system
    (setq inferior-lisp-program "/usr/bin/sbcl")) ; your Lisp system
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
(defconst randys-c-style
  '("gnu"
    (c-basic-offset . 3)
    (c-offsets-alist
     (statement-block-intro . 0))))

(add-hook 'c-mode-common-hook
  '(lambda ()
    (c-add-style "RANDY" randys-c-style t)))

; fix meta on Solaris
(if (eq system-type 'usg-unix-v)
    (setq x-alt-keysym 'meta))

; OrgMode keys
(global-set-key (kbd "C-c a") 'org-agenda)

; TODO Dependencies (protect blocked todo's)
(setq org-enforce-todo-dependencies t)
(setq org-enforce-todo-checkbox-dependencies t)
(setq org-agenda-dim-blocked-tasks t)

; Log TODO done times
(setq org-log-done 'time)

; Keep scheduled items out of global TODO list
(setq org-agenda-todo-ignore-scheduled t)

(setq org-agenda-todo-list-sublevels nil)

(if (eq system-type 'darwin)
    (global-set-key (kbd "C-c a") 'org-agenda))

;; Python stuff
(setq-default indent-tabls-mode nil)
(setq-default tab-width 4)

;; Google Apps stuff
(setq g-user-email "meyersh@morningside.edu")
;(load-library "g")

;; Ido mode (pretty cool)
(ido-mode t)