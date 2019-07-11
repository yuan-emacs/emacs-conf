(require 'iedit)

(defun iedit-dwim (arg)
  (interactive "p")
  (if arg
      (iedit-mode)
    (save-excursion
      (save-restriction
	(widen)
	;; this function determines the scope of 'iedit-start'
	(narrow-to-defun)
	(if iedit-mode
	    (iedit-mode)
	  ;; 'current-word' can of course be replaced by other fcuntion
	  (iedit-start (current-word)))))))

(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region (point-min) (point-max))))
(add-hook 'compilation-filter-hook #'colorize-compilation-buffer)

(provide 'edit-conf)

