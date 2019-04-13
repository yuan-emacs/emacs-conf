
(require 'lsp-vue)
(require 'lsp-mode)

(require 'company-quickhelp)
(use-package company-lsp
	     ;; 开启yasnippet支持
	     (setq company-lsp-enable-snippet t))

(use-package company
	     (setq company-minimum-prefix-length 1)
	     (setq company-dabbrev-downcase nil)
	     (setq company-idle-delay 0.5)
	     (setq company-idle-delay 0.5)
	     (add-hook 'company-mode-hook 'company-quickhelp-mode)
	     (add-to-list 'company-backends 'company-lsp))


(use-package web-mode
	     (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
	     (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
	     (add-hook 'web-mode-hook 'company-mode)
	     (add-hook 'web-mode-hook 'lsp-vue-enable))

(provide 'init-vue)
