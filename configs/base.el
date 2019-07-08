;; 显示行号
(global-linum-mode t)
(tool-bar-mode -1)
(scroll-bar-mode nil)

(setq-default cursor-type 'bar)		;修改光标默认样式

;;关闭启动画面
(setq inhibit-splash-screen 1)

;;设置高亮当前行
(global-hl-line-mode t)

;;设置默认开启全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;去掉滚动时产生响声
(setq ring-bell-function 'ignore)

;;开始自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 括号自动补全
(smartparens-global-mode t)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode) ;开始自动括号匹配

;; 禁止自动保存和备份
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)

;; emacs 删除文字优化 mac中使用
(delete-selection-mode t)

(set-language-environment "UTF-8")

;; 简化yes or no  修改成 y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; 删除和复制时总是询问是否要删除和拷贝
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(set-default-font "Consolas-17")

(setq inhibit-splash-screen t)		;关闭启动动画

;;清除回车时进入一个新目录创建一个新的缓冲区
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(delete-selection-mode t)		; emacs 在mac下删除文字优化
(global-auto-revert-mode t)             ; 内容有修改时自动更新文件

;; find-fcuntion find-variable find-function-on-key
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


;; 把下拉提示选项上下键改成 C-n 和 C-p
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;;解决emacs ctrl-space与输入法冲突
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "<f12>") 'set-mark-command)

(provide 'base)
