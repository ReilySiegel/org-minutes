;;; org-minutes-roam.el --- Part of org-minutes.el
;;; Commentary:
;;; Code:

(require 'org-minutes-agenda)
(require 'org-minutes-organization)
(require 'seq)

(defun org-minutes-roam--read-date (node)
  "Read an org date for NODE."
  (if-let ((date (org-roam-capture--get :org-minutes-date)))
      date
    (let ((date (org-read-date nil)))
      (org-roam-capture--put :org-minutes-date date)
      date)))

(defun org-minutes--org->template (org)
  "Convert ORG into a org-roam template."
  (let ((name (org-minutes-organization-name org)))
    `(,(org-minutes-organization-key org) ,name plain
      ,(concat "%?\n"
               (org-minutes-agenda org))
      :if-new
      (file+head
       ,(concat "minutes/" name " ${org-minutes-roam--read-date}.org")
       ,(concat "#+title: " name " - ${org-minutes-roam--read-date}\n"
                "#+date: "))
      :unnarrowed t
      :immediate-finish t)))

;;;###autoload
(defun org-minutes-roam-init ()
  (with-eval-after-load 'org-roam
    (setq org-roam-capture-templates
          (append org-roam-capture-templates
                  (seq-map #'org-minutes--org->template
                           org-minutes-organizations)))))

(provide 'org-minutes-roam)
;;; org-minutes-roam.el ends here
