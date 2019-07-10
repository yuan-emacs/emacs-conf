
;; 配制 vue html css less js 用 lsp实现代码提示
(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((js-mode css-mode less-css-mode scss-mode web-mode) . lsp)
  :init
  (setq lsp-prefer-flymake nil)
  (require 'lsp-clients))

(use-package lsp-ui :ensure t :commands lsp-ui-mode)

(use-package web-mode :ensure t :mode ("\\.vue\\'"))

(use-package company
  :ensure t
  :init
  (global-company-mode)
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers nil))

(use-package company-box
  :ensure t
  :if window-system
  :hook (company-mode . company-box-mode))

;;; zencoding
(use-package emmet-mode
  :ensure t
  :commands emmet-mode
  :hook ((web-mode css-mode sgml-mode) . emmet-mode)
  :init (setq emmet-indent-after-insert nil)
  (setq emmet-indentation 2)
  :config (setq emmet-move-cursor-between-quotes t)
  ;;(setq emmet-expand-jsx-className? t)  ; 设置jsx 语法
  (setq emmet-self-closing-tag-style " /"))

(provide 'lsp-conf)
