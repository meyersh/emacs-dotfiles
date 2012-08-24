(provide 'phone-book-mode)
"Shaun Meyer, Aug 2012"

(defun get-herdbook-entries () 
  "Get all the herdbook entries from aims and split them by new-line."
  (split-string (shell-command-to-string "ssh cmpusweb@aims direct/get_current.sh STAFF") "\n"))

(defun herdbook-entry-matches (search-regex entry)
  "Search a given herdbook entry for a term (case-insentive)."
  (if (string-match search-regex entry)
      entry
      nil))

(defun herdbook-extension (entry)
  (nth 7 (split-string entry ",")))

(defun herdbook-find-entry (search-regex)
  "Download and grep a matching regex in the herdbook."
  (interactive "sHerdbook Search:")
  (message (find search-regex (get-herdbook-entries) :test 'herdbook-entry-matches)))

(global-set-key (kbd "C-c p") 'herdbook-find-entry)
