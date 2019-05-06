;; 设置自动保存
(add-to-list 'load-path "~/.emacs.d/lisp/lib/")
(require 'auto-save)
(auto-save-enable)
(setq auto-save-silent t)
;;(setq auto-save-delete-trailing-whitespace t)

(provide 'init-auto-save)