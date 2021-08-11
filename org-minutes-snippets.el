;;; org-minutes-snippets.el --- Part of org-minutes.el
;;; Commentary:
;; This module is heavily inspired by Yasnippet-Snippets
;;; Code:
(require 'yasnippet)

(defconst org-minutes-snippets-dir
  (expand-file-name
   "snippets"
   (file-name-directory
    ;; Copied from ‘f-this-file’ from f.el.
    (cond
     (load-in-progress load-file-name)
     ((and (boundp 'byte-compile-current-file) byte-compile-current-file)
      byte-compile-current-file)
     (:else (buffer-file-name))))))

;;;###autoload
(defun org-minutes-snippets-initialize ()
  "Load the `org-minutes-snippets' snippets directory."
  ;; NOTE: we add the symbol `org-minutes-snippets-dir' rather than its
  ;; value, so that yasnippet will automatically find the directory
  ;; after this package is updated (i.e., moves directory).
  (add-to-list 'yas-snippet-dirs 'org-minutes-snippets-dir t)
  (yas-load-directory org-minutes-snippets-dir t))

;;;###autoload
(eval-after-load 'yasnippet
  '(org-minutes-snippets-initialize))

(provide 'org-minutes-snippets)
;;; org-minutes-snippets.el ends here
