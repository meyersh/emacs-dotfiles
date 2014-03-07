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
 '(cursor-type (quote bar) t)
 '(custom-safe-themes (quote ("f61972772958e166cda8aaf0eba700aad4faa0b4101cee319e894e7a747645c9" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "6938c51c0a89f078c61b979af23ae4c32204458f16a6a08c1a683ab478a7bc6b" "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" default)))
 '(haskell-mode-hook (quote (turn-on-haskell-indentation)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(lpr-command "/usr/bin/lpr")
 '(nxhtml-autoload-web nil t)
 '(org-agenda-files (quote ("~/Work.org")))
 '(org-fontify-done-headline nil)
 '(org-hide-leading-stars t)
 '(printer-name "rh1comp")
 '(server-host "localhost")
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
(add-to-list 'load-path "~/.emacs.d/local")

;; Some font
(set-default-font "Inconsolata-16")

;; (defun init--install-packages ()
;;   (packages-install
;;    '(magit paredit)))


;; Bring in some common lisp (right now used for the `case` function below.
(require 'cl)

;; ;; Add melpa (I think)
(when (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize))

;; PHP stuff
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; Puppet stuff
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet code." t)
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;; CFEngine stuff
;(autoload 'cfengine3-mode "cfengine3-mode" "Major mode for editing cfengine code." t)
(add-to-list 'auto-mode-alist '("\\.cf$" . cfengine3-mode))

;; Autopair stuff.
;;(require 'autopair)
;;(autopair-global-mode) ;; enable autopair in all buffers
;;

;; Tramp settings
(require 'tramp)
(setq tramp-default-method "ssh")

;; Dim parens in lisp-like languages.
(require 'parenface)
(set-face-foreground 'paren-face "gray75")

;; System-Specific settings
(defun darwin-hook ()
  "Apple-specific emacs configuration stuffs"
  (setq browse-url-generic-function 'browse-url-default-macosx-browser)

  (setq inferior-lisp-program "/usr/local/bin/sbcl")

  (global-set-key (kbd "C-c a") 'org-agenda))

(defun gnu-linux-hook ()
  "GNU/Linux-specific emacs configuration stuffs"
  (setq browse-url-generic-program "/usr/bin/google-chrome"
        browse-url-browser-function 'browse-url-generic)

  (setq inferior-lisp-program "/usr/bin/sbcl"))

(defun berkley-unix-hook ()
  "FreeBSD-specific emacs configuration stuffs"
  (setq browse-url-generic-program "/usr/local/bin/chrome"
        browse-url-browser-function 'browse-url-generic)

  (semantic-add-system-include "/usr/include/c++/4.2" 'c++-mode)
  (semantic-add-system-include "/usr/include/c++/4.2" 'c-mode)

  (load-library "git")
  (load-library "git-blame")
  (load-library "vc-git")
  (add-to-list 'vc-handled-backends 'GIT)

  (setq inferior-lisp-program "/usr/local/bin/sbcl"))

(defun solaris-unix-hook ()
  "Solaris-specific emacs configuration stuffs"
  ; Fix meta
  (setq x-alt-keysym 'meta))

(case system-type
  ('darwin (darwin-hook))
  ('gnu/linux (gnu-linux-hook))
  ('berkeley-unix (berkley-unix-hook))
  ('usg-unix-v (solaris-unix-hook))
  (otherwise nil))

;; Slime Stuff
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
    (statement-block-intro . 0)
    (substatement-open . +))))

;; Hello, Emacs.
(setq user-full-name "Shaun Meyer")

(defconst gnu-c-style-with-4-spaces
  '("gnu"
     (c-basic-offset . 4)))

(defun my-c-mode-hook ()
  (c-add-style "RANDY" randys-c-style t)
  (setq c-basic-offset 4)
  (define-key c-mode-base-map "." 'semantic-complete-self-insert)
  (define-key c-mode-base-map ">" 'semantic-complete-self-insert)
  (yas-minor-mode-on)
  (electric-pair-mode nil))

(add-hook 'c-mode-common-hook 'my-c-mode-hook)

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

(setq org-agenda-todo-list-sublevels t)

;; Python stuff
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defun my-python-mode-hook ()
  (define-key python-mode-map "." 'semantic-complete-self-insert)
  (linum-mode t))

(add-hook 'python-mode-hook 'my-python-mode-hook)

;; Google Apps stuff
(setq g-user-email "meyersh@morningside.edu")
;;(load-library "g")

;; Ido mode (pretty cool)
(ido-mode t)
(ido-vertical-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have

;; Recent files
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 100)
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs-autosaves/" t)
(make-directory "~/.emacs-backups/" t)

;; Enable cedet
;;(load-file "~/.emacs.d/cedet/common/cedet.el")
;; Save semantic stuff in ~/.emacs.d/semanticdb
(setq semanticdb-default-save-directory "~/.emacs.d/semanticdb")

;; I don't really plan on using projects.
(global-ede-mode 1)
(semantic-mode 1)
(global-semantic-idle-completions-mode t)
(global-semantic-decoration-mode t)
(global-semantic-highlight-func-mode t)
(global-semantic-show-unmatched-syntax-mode t)

;;(require 'semantic-ia)
;; (semantic-load-enable-gaudy-code-helpers)
;; (semantic-add-system-include "/usr/local/lib/python2.7" 'python-mode)
;;(setq semantic-python-dependency-system-include-path
;;      '("/usr/lib/python2.6/"))

;; Taken from the comment section in inf-ruby.el
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files")
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))


;; Re-enable the erase-buffer command. Mua
(put 'erase-buffer 'disabled nil)

;; Haskell stuff
;(load "~/.emacs.d/haskell-mode/haskell-site-file")
(setq haskell-font-lock-symbols t)

;; Ace move mode
;;(add-to-list 'load-path "~/.emacs.d/ace-jump-mode/")
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Electric pair
(electric-pair-mode)

;; Gmail?
;; (gnus config)
(setq gnus-select-method '(nnimap "gmail"
                  (nnimap-address "imap.gmail.com")
                  (nnimap-server-port 993)
                  (nnimap-stream ssl)))

;; Yas Snippets
(require 'yasnippet)
(setq yas/root-directory '("~/.emacs.d/yassnippets/"))
(setq yas/prompt-functions '(yas/ido-prompt
                             yas/completing-prompt))
; Load all directories
(mapc 'yas/load-directory yas/root-directory)

;; Load my programs
(require 'phone-book-mode)
(require 'phonetic-alphabet-mode)

;; Load Nagios-Mode stuff
(autoload
'nagios-mode "$HOME/.emacs.d/local/nagios-mode.el" "Major mode
for editing Nagios Config Files" t)
(add-to-list 'auto-mode-alist '("nagios/etc/.+\\.cfg$" . nagios-mode))

;; Whattheemacsd?!
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

;; Highlight matching parens
(show-paren-mode t)
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)
(setq show-paren-delay 0)
(setq show-paren-style 'mixed)

;; Web-mode stuffs
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl\\'" . web-mode))

;; hilight the current line.
(global-hl-line-mode)
;(global-highlight-parentheses-mode t)
(show-paren-mode t)

;; nuke whitespaces when writing to a file
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Exuberant ctags
(setq tags-revert-without-query t)
(require 'ctags)
(global-set-key (kbd "<f7>") 'ctags-create-or-update-tags-table)

;; Auto-complete
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

;; Git rules
(global-set-key (kbd "C-x g") 'magit-status)

;; Org mode stuff
(setq org-publish-project-alist
      '(("org"
         :base-directory "~/Dropbox/OrgMode/"
         :publishing-directory "~/public_html"
         :section-numbers nil
         :with-toc t
         :makeindex t
         :html-head "<link rel=\"stylesheet\"
                         href=\"../other/mystyle.css\"
                         type=\"text/css\"/>")))

;; Shauns Functions
(defun puff-string (search)
  "Do a forward search for `search` and put spaces around it."
    (interactive "sString to puff: ")
    (beginning-of-line)
    (search-forward search (line-end-position) nil 1)
    (replace-match (concat " " search " ") nil t))

(global-set-key (kbd "C-x SPC") 'puff-string)


;; Some pretty colors
(if window-system
    (load-theme 'solarized-light))
