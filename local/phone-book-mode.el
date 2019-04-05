;;; phone-book-mode --- A simple phonebook lookup.

;;; Commentary:

;;; Code:

"Shaun Meyer, Aug 2012"

(defun get-herdbook-entries ()
  "Get all the herdbook entries from aims and split them by new-line."
  (split-string (shell-command-to-string "ssh cmpusweb@aims direct/get_current.sh STAFF") "\n"))

(defun herdbook-entry-matches (search-regex entry)
  "Search a given herdbook ENTRY for a SEARCH-REGEX (case-insensitive)."
  (if (string-match search-regex entry)
      entry
      nil))

(defun herdbook-extension (entry)
  "Niavely split ENTRY (which is a CSV line) on commas."
  (nth 7 (split-string entry ",")))

(defun herdbook-find-entry (search-regex)
  "Download and grep for a matching SEARCH-REGEX in the herdbook."
  (interactive "sHerdbook Search:")
  (message (cl-find search-regex (get-herdbook-entries) :test 'herdbook-entry-matches)))

(global-set-key (kbd "C-c p") 'herdbook-find-entry)

(provide 'phone-book-mode)
;;; phone-book-mode.el ends here
