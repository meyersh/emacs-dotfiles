;;; init.el --- Shaun's Emacs Initialization File (SEIF)

;;; Commentary:
;; Shaun's Init file.  It's great, it's the best, you're gonna love
;; it.

;;; Code:
;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Hello, Emacs.
(setq user-full-name "Shaun Meyer")

;; Prefer splitting side by side.
(setq split-height-threshold 60)

;; Google Apps stuff
(setq g-user-email "meyersh@morningside.edu")

;; Re-enable the erase-buffer command. Mua
(put 'erase-buffer 'disabled nil)

;; Add melpa for haskell-mode, etc.
(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (puppet-mode helm exec-path-from-shell flycheck magit use-package haskell-mode))))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Add use-package
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(require 'use-package)

;; Install missing packages by default.
(setq use-package-always-ensure t)

;(use-package dracula-theme)
(use-package doom-themes
    :init (progn
        ;; Global settings (defaults)
        (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
          doom-themes-enable-italic t) ; if nil, italics is universally disabled

        ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each
        ;; theme may have their own settings.
        ;;(load-theme 'doom-city-lights t)
        (load-theme 'modus-operandi t)
        )
    :config (progn
          ;; Enable flashing mode-line on errors
          (doom-themes-visual-bell-config)

          ;; Enable custom neotree theme
          (doom-themes-neotree-config)))  ; all-the-icons fonts must be installed!

(use-package which-key
    :config
  (which-key-mode))

(use-package doom-modeline
    :config
  (doom-modeline-mode 1))

;; nuke whitespaces when writing to a file
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Install flycheck for pylint usage (pip3 install pylint for that)
(use-package flycheck)
; os x fix for paths.
(use-package exec-path-from-shell)
(exec-path-from-shell-initialize)
(global-flycheck-mode)

(use-package haskell-mode)

(use-package magit)
;(setq magit-git-executable "/usr/bin/git") ; This might be different
;for remote hosts?

;; Puppet stuff
(use-package puppet-mode)
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet code." t)
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;; YAML stuff
(use-package yaml-mode)

;; Tramp settings
(require 'tramp)
(setq tramp-default-method "ssh")
;; There is no advantage to running zsh inside emacs anyway.
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
;; Use the path assigned to the remote user by the remote host.  TRAMP
;; does not normally retain this remote path after logging.  However,
;; ‘tramp-own-remote-path’ preserves the path value, which can be used
;; to update ‘tramp-remote-path’.
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

;; Dim parens in lisp-like languages.
(use-package paren-face)
;(require 'paren-face)
;(set-face-foreground 'parenface "gray75")

;; Highlight matching parens
(show-paren-mode t)
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)
(setq show-paren-delay 0)
(setq show-paren-style 'mixed)

;; Maintain pairs.
(use-package smartparens
    :config
  (require 'smartparens-config)
  (smartparens-global-strict-mode))


;; System-Specific settings
(defun darwin-hook ()
  "Apple-specific Emacs configuration stuffs."
  (setq browse-url-generic-function 'browse-url-default-macosx-browser)

  ; Add TexLive! to path
  (setq exec-path (append exec-path '("/usr/texbin/")))

  (setq inferior-lisp-program "/usr/local/bin/sbcl")

  ; gpg isn't on emacs' path
  (setq epg-gpg-program "/usr/local/bin/gpg")

  (global-set-key (kbd "C-c a") 'org-agenda)

  ; Allow us to use Option-Click and Cmd-Click to get to some of the
  ; flyspell goodness.
  (setq mac-emulate-three-button-mouse t)

  (setq fortune-file "/usr/local/Cellar/fortune/9708/share/games/fortunes/")

  ;; Give me my SWEET FONT. (Was :height 240)
  (set-face-attribute 'default nil
              :family "IBM Plex Mono" :height 120 :weight 'Light)

 ;(set-exec-path-from-shell-PATH)
  )

(defun gnu-linux-hook ()
  "GNU/Linux-specific Emacs configuration stuffs."
  (setq browse-url-generic-program "/usr/bin/google-chrome"
    browse-url-browser-function 'browse-url-generic)


  ;; Give me my SWEET FONT.
  (set-face-attribute 'default nil
              :family "IBM Plex Mono" :height 120 :weight 'Regular)

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

(require 'cl) ; for case statement.
(case system-type
  ('darwin (darwin-hook))
  ('gnu/linux (gnu-linux-hook))
  ('berkeley-unix (berkley-unix-hook))
  ('usg-unix-v (solaris-unix-hook))
  (otherwise nil))

;; Ace move mode
;;(add-to-list 'load-path "~/.emacs.d/ace-jump-mode/")
(use-package  ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Electric pair
;(electric-pair-mode)

;; Yas Snippets
(use-package yasnippet)
(make-directory "~/.emacs.d/yassnippets" t)
(setq yas/root-directory '("~/.emacs.d/yassnippets/"))
(setq yas/prompt-functions '(yas/ido-prompt
                 yas/completing-prompt))
; Load all directories
(mapc 'yas/load-directory yas/root-directory)

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

;; Load my programs
(add-to-list 'load-path "~/.emacs.d/local")
(require 'phone-book-mode)
(require 'phonetic-alphabet-mode)

(add-to-list 'load-path "~/.emacs.d/local/nagios-mode")
(autoload 'nagios-mode "nagios-mode" nil t)

;; Slime Stuff
(setq lisp-indent-function 'common-lisp-indent-function
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
;(add-to-list 'load-path "~/.emacs.d/slime/")  ; your SLIME directory
(use-package slime)
(slime-setup '(slime-fancy)) ; almost everything

;;;; Lisp indentation
(set (make-local-variable lisp-indent-function)
     'common-lisp-indent-function)

;; Completion stuff
(use-package company
    :config
  (add-hook 'after-init-hook 'global-company-mode))

;; Git stuff
(global-set-key (kbd "C-x g") 'magit-status)

;; Haskell stuff
(setq haskell-font-lock-symbols t)

;; Markdown stuff.
(use-package markdown-mode)

;; LaTeX stuff
;; auxtex for texmathp.el, which is required for cdlatex, which I'd
;; like to use for org mode...
(use-package auctex
    :defer t
    :ensure t)

(use-package cdlatex
    :init
  (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
  (add-hook 'latex-mode-hook 'turn-on-cdlatex)   ; with Emacs latex mode
  )

;; Org mode stuff
(setq org-agenda-files '("/Volumes/GoogleDrive/Team Drives/OPS/orgmode"
             "~/orgmode"))

(add-hook 'org-mode-hook (lambda ()
           (turn-on-org-cdlatex)
           (org-indent-mode)
           (visual-line-mode t)
           ;; Automatically tag DONE states :ARCHIVE: to keep them folded.
           (org-map-entries
        '(org-toggle-tag "ARCHIVE" 'on )
        "/+DONE" 'file 'archive 'comment)))

(use-package org-cliplink)


(require 'ox-publish)
(setq org-publish-project-alist
      '(("Shauns-Stuff"
     :base-directory "~/Google Drive/OrgMode/"
     :publishing-directory "~/public_html"
     :publishing-function org-html-publish-to-html
     :section-numbers nil
     :with-toc t
     :makeindex t
     :html-head "<link rel=\"stylesheet\"
             href=\"../other/mystyle.css\"
             type=\"text/css\"/>")
    ("OPS-Google-Drive"
     :base-directory "/Volumes/GoogleDrive/Team Drives/OPS/"
     :publishing-directory "/Volumes/GoogleDrive/Team Drives/OPS/public_html"
     :publishing-function org-html-publish-to-html
     :section-numbers nil
     :with-toc t
     :makeindex t)))

;; Python stuff
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defun my-python-mode-hook ()
  (define-key python-mode-map "." 'semantic-complete-self-insert)
  (linum-mode t))

;; Ruby stuff
;; Taken from the comment section in inf-ruby.el
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files")
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

;; Smooth scrolling stuff
(use-package smooth-scroll
  :config
  (smooth-scroll-mode 1)
  (setq smooth-scroll/vscroll-step-size 2))

;; Web-mode stuffs
(use-package web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl\\'" . web-mode))

;; Helm mode
(use-package helm) ; was require helm-config.
(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-M-x-fuzzy-match                  t ; optional fuzzy matching for helm-M-x
)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(helm-mode 1)

;; Helm-files (use mdfind on mac)
(require 'helm-files)
(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay 0.1)
(setq helm-c-locate-command "~/.emacs.d/bin/helm-mdfind.sh %.0s %s")
;(loop for ext in '("\\.swf$" "\\.elc$" "\\.pyc$")
;      do (add-to-list 'helm-c-boring-file-regexp-list ext))
(setq helm-c-boring-regexp-list '("\\.swf$" "\\.elc$" "\\.pyc$"))
(define-key global-map (kbd "M-t") 'helm-for-files)

;; Recent files
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 500)
(run-at-time nil (* 5 60) 'recentf-save-list)
(global-set-key (kbd "C-x C-r") 'helm-recentf)

;; Projectile (feeling cute, might delete later)
;"/ssh:puppet:/etc/puppetlabs/code/environments/"
(use-package helm-projectile)
(use-package projectile
    :bind ("s-p" . 'projectile-command-map)
    :init (setq projectile-project-search-path '("~/git/" "~/code/" ))
    :config (projectile-mode +1))

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(let ((autosave-directory "~/.emacs-autosaves/")
      (backups-directory "~/.emacs-backups/"))

  ;; create the autosave dir if necessary, since emacs won't.
  (make-directory autosave-directory t)
  (make-directory backups-directory t)

  (setq backup-directory-alist
    `((".*" . ,backups-directory)))

  (setq auto-save-file-name-transforms
    `((".*", autosave-directory))))

;; Rediculous stuff.
(use-package nyan-mode
    :config (nyan-mode 1))

;; Unicode stuff.
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(provide 'init)
;;; init.el ends here
