(provide 'setup-orgmode)
;; My OrgMode Setup

(setq org-agenda-files '("~/Dropbox/OrgMode"))

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

;; I would like a TODO entry to automatically change to DONE when all
;; children are done.
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; OrgMode project list -- publish to webs
(setq org-publish-project-alist
           '(("org"
              :base-directory "~/Dropbox/OrgMode/"
              :publishing-directory "/ssh:meyersh@fs:public_html/orgmode/"
              :section-numbers nil
              :auto-sitemap t
              :sitemap-filename "sitemap.org" ; sitemap.org is default
              :sitemap-title "Sitemap"
              :publishing-function org-html-publish-to-html
              :with-toc nil)))
