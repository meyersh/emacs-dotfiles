(eval-when-compile (require 'cl))
(eval-when-compile
  (let* ((this-file (or load-file-name
                        (when (boundp 'bytecomp-filename) bytecomp-filename)
                        buffer-file-name))
         (this-dir (file-name-directory this-file))
         (load-path (cons this-dir load-path)))
    (require 'ert2)))

(setq debug-on-error t)

(defvar emacstest-bin
  (file-name-directory (if load-file-name load-file-name buffer-file-name)))

(pushnew emacstest-bin load-path)



(defvar emacstest-files-root
  (let* ((this-dir emacstest-bin)
         (root (expand-file-name "inemacs/" this-dir)))
    (unless (file-accessible-directory-p root)
          (error (if (file-exists-p root)
                     "Can't read files in test directory %s"
                   "Can't find test directory %s")
                 root))
    root))

(let ((distr-in "c:/EmacsW32/nxhtml/tests/inemacs/"))
  (when (file-directory-p distr-in)
    (setq emacstest-files-root distr-in)))

(defun emacstest-run ()
  "Run Emacs tests."
  (interactive)
  (setq message-log-max t)
  (setq ert-test-files-root emacstest-files-root)
  (let ((selector "emacs-"))
    (if noninteractive
        (ert-run-tests-batch selector)
      (ert-kill-temp-test-buffers)
      (ert-run-tests-interactively selector)
      (other-window 1)
      (ert-list-temp-test-buffers))))

(ert-deftest emacs-bug1013 ()
  "Emacs bug 1013.
See URL
`http://emacsbugs.donarmstrong.com/cgi-bin/bugreport.cgi?bug=1013'."
  (ert-with-temp-buffer-include-file "bug1013.el"
    (eval-buffer)))

(provide 'emacstest-suites)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; emacstest-suites.el ends here
