
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





;; (require 'lsp-mode)
;; (require 'lsp-vue)

;; (add-hook 'vue-mode-hook #'lsp-vue-mmm-enable)
;; (add-hook 'major-mode-hook #'lsp-vue-enable)

;; (use-package company-quickhelp :ensure)
;; (use-package company-lsp
;;   :ensure
;;   :config
;;   ;; 开启yasnippet支持
;;   (setq company-lsp-enable-snippet t))

;; (use-package company
;;   :ensure
;;   :config
;;   (setq company-minimum-prefix-length 1)
;;   (setq company-dabbrev-downcase nil)
;;   (setq company-idle-delay 0.5)
;;   (setq company-idle-delay 0.5)
;;   (add-hook 'company-mode-hook 'company-quickhelp-mode)
;;   (add-to-list 'company-backends 'company-lsp))


;; (use-package web-mode
;;   :ensure
;;   :init
;;   (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
;;   :config
;;   (add-hook 'web-mode-hook 'company-mode)
;;   (add-hook 'web-mode-hook 'lsp-vue-enable))


(provide 'init-vue)
