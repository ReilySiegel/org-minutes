;;; org-minutes-agenda.el --- Part of org-minutes.el
;;; Commentary:

;;; Code:

(require 'org-minutes-organization)

(defun org-minutes-agenda--purpose (organization)
  "Purpose for ORGANIZATION."
  (concat "* Statement of Purpose\n"
          "Regular meeting of [[roam:"
          (org-minutes-organization-name organization)
          "]] called to order at TODO.\nPresident Igor De Moraes presiding, with Secretary Reily Siegel in attendance.\nThe minutes of the previous meeting were approved as distributed."
          "\n"))

(defun org-minutes-agenda--attendance (organization)
  "Attendance for ORGANIZATION."
  (concat "* Attendance [%]\n"
          (string-join (seq-map (lambda (member) (format "- [X] %s" member))
                                (org-minutes-organization-members organization))
                       "\n")
          "\n"))

(defun org-minutes-agenda--reports (organization)
  "Reports for ORGANIZATION."
  (concat "* Reports\n"
          (string-join (seq-map (lambda (report) (format "** %s" report))
                                (org-minutes-organization-reports organization))
                       "\n\n")
          "\n\n"))

;;;###autoload
(defun org-minutes-agenda (organization)
  "Get all agenda items for ORGANIZATION."
  (concat
   (org-minutes-agenda--purpose organization)
   (org-minutes-agenda--attendance organization)
   (org-minutes-agenda--reports organization)
   (string-join (seq-map (lambda (item)
                           (concat "* " item))
                         (org-minutes-organization-agenda organization))
                "\n")))

;;;###autoload
(defun org-minutes-agenda-insert ()
  "Insert all agenda items."
  (interactive)
  (let ((organization (org-minutes--select-organization)))
    (save-excursion
      (insert (org-minutes-agenda organization)))))



(provide 'org-minutes-agenda)
;;; org-minutes-agenda.el ends here
