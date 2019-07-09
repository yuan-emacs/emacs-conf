;; 文件自动保存
(require 'real-auto-save)
(setq real-auto-save-interval 2)	; 2s 钟后自动保存
;; 设置自动保存的文件类型
(add-hook 'org-mode-hook 'real-auto-save-mode)
(add-hook 'js2-mode-hook 'real-auto-save-mode)
(add-hook 'web-mode-hook 'real-auto-save-mode)
(add-hook 'emacs-lisp-mode-hook 'real-auto-save-mode)
(add-hook 'text-mode-hook 'real-auto-save-mode)
(add-hook 'lisp-mode-hook 'real-auto-save-mode)

(provide 'auto-save-conf)
