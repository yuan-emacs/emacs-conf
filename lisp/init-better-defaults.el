;;去掉滚动时产生响声
(setq ring-bell-function 'ignore)

;;开始自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;安装主题
(load-theme 'monokai 1)

;; 括号自动补全
(smartparens-global-mode t)

;关闭缩进
;;(electric-indent-mode 1)
;开启全局 Company补全
(global-company-mode 1)

;;去掉emacs自动备份文件
(setq-default make-backup-files nil)

;; emacs 删除文字优化 mac中使用
(delete-selection-mode t)

;;使用hungry-delay
(require 'hungry-delete)
(global-hungry-delete-mode)

; Swiper & Counsel 优化 M-X 提示
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; js idea
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; exec *.js file
(require 'nodejs-repl)
;; 安装nvm 时这么用
(defun nvm-which ()
  (let* ((shell (concat (getenv "SHELL") " -l -c 'nvm which'"))
         (output (shell-command-to-string shell)))
    (cadr (split-string output "[\n]+" t))))
(setq nodejs-repl-command #'nvm-which)

;;设置最近打开的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 30)

;; 内容有修改时自动执行
(global-auto-revert-mode t)

;; 禁止自动保存和备份
(setq make-backup-files nil)
(setq auto-save-default nil)

(require 'popwin)
(popwin-mode t)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("syso" "System.out")
					    ))


(provide 'init-better-defaults)
