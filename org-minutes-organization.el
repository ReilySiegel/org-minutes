;;; org-minutes-organization.el --- Part of org-minutes.el
;;; Commentary:

;;; Code:
(require 'cl-lib)
(require 'org)
(require 'seq)

(cl-defstruct org-minutes-organization
  ""
  name
  (key "m")
  (members nil)
  (reports nil)
  (agenda '("Unfinished Business"
            "New Business"
            "Action Items")))

(defvar org-minutes-organizations nil
  "List of `org-minutes-organization's to consider for use.")

(defun org-minutes--select-organization nil
  "Get the current organization."
  (let ((org-name (completing-read "Organizaiton"
                                   (seq-map
                                    (lambda (org)
                                      (org-minutes-organization-name org))
                                    org-minutes-organizations))))
    (if org-name
        (car (seq-filter (lambda (org)
                           (string-equal org-name
                                         (org-minutes-organization-name org)))
                         org-minutes-organizations))
      nil)))

(provide 'org-minutes-organization)
;;; org-minutes-organization.el ends here
