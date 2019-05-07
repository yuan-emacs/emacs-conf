
(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((js-mode css-mode scss-mode web-mode) . lsp)
  :init
  (setq lsp-prefer-flymake nil)
  (require 'lsp-clients))

(use-package lsp-ui :ensure t :commands lsp-ui-mode)
(use-package company-lsp :ensure t :commands company-lsp)

(use-package web-mode
  :ensure t
  :mode ("\\.vue\\'"))

(use-package company
  :ensure t
  :init
  (global-company-mode)
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers nil))

(use-package company-box
  :ensure t
  :if window-system
  :hook (company-mode . company-box-mode))

(provide 'init-vue)
