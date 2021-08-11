;;; org-minutes.el --- A simple minor mode to simplify minutes-taking
;;; Commentary:

;;; Code:

(require 'org-minutes-agenda)
(require 'org-minutes-organization)
(require 'seq)

;;;###autoload
(with-eval-after-load 'org
  (add-to-list
   'org-todo-keywords
   '(sequence "PENDING(n)" "POSTPONED(p)" "TABLED(b)" "|"
              "ADOPTED(a)" "FAILED(f)" "POSTPONED INDEFINITELY(i)")
   t))

(provide 'org-minutes)
;;; org-minutes.el ends here
