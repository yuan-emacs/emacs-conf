;;;; 基础设置文件


;;; ui 相关设置

;; 关闭 默认的 toolbar
(tool-bar-mode -1)
(scroll-bar-mode t)

					;显示行号
(global-linum-mode t)
					;更改光标样式
(setq-default cursor-type 'bar)

					; org 模式设置注释后有颜色设置
(require 'org)
(setq org-src-fontify-natively t)

;;关闭启动画面
(setq inhibit-splash-screen 1)

;;设置高亮当前行
(global-hl-line-mode t)

;;设置字体
(set-default-font "Source Code Variable-16")   ; linux can set

;; Chinese Font 配制中文字体

;;设置默认开启全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; sppedbar setup
(require 'sr-speedbar);;这句话是必须的
(add-hook 'after-init-hook '(lambda () (sr-speedbar-toggle)));;开启程序即启用
(add-hook 'after-init-hook '(lambda () (tabbar-ruler-up)));; 让 emacs 有tabbar 方便选用tab

;;去掉滚动时产生响声
(setq ring-bell-function 'ignore)

;;开始自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;安装主题
(load-theme 'solarized-dark t)

;; 括号自动补全
(smartparens-global-mode t)

;;关闭缩进
;;(electric-indent-mode 1)
;;开启全局 Company补全
(global-company-mode 1)

;;(auto-complete-mode 1)
(global-auto-complete-mode t)

;;去掉emacs自动备份文件
(setq-default make-backup-files nil)

;; emacs 删除文字优化 mac中使用
(delete-selection-mode t)

;;使用hungry-delay
(require 'hungry-delete)
(global-hungry-delete-mode)


;;设置最近打开的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 30)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; 内容有修改时自动更新文件
(global-auto-revert-mode t)

;; 禁止自动保存和备份
(setq make-backup-files nil)
;; (setq auto-save-default t)
(require 'real-auto-save)
(setq real-auto-save-interval 2)	; 2s 钟后自动保存
;; 设置自动保存的文件类型
(add-hook 'org-mode-hook 'real-auto-save-mode)
(add-hook 'js2-mode-hook 'real-auto-save-mode)
(add-hook 'web-mode-hook 'real-auto-save-mode)
(add-hook 'emacs-lisp-mode-hook 'real-auto-save-mode)
(add-hook 'text-mode-hook 'real-auto-save-mode)
(add-hook 'lisp-mode-hook 'real-auto-save-mode)

(require 'popwin)
(popwin-mode t)

;; 设置缩略词,eg:输完 yuan 输入回车、空格即可显示设置文本
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; yuan -> zhangyuanyuan
					    ("yuan" "zhangyuanyuan")
					    ;; day
					    ("day" "today is ")
					    ))


;; 简化yes or no  修改成 y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; 代码缩进设置
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))

;; 代码缩进设置快捷键
(global-set-key (kbd "C-S-f") 'indent-region-or-buffer)

;; 删除和复制时总是询问是否要删除和拷贝
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;;清除回车时进入一个新目录创建一个新的缓冲区
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 启用 dired-x C-x C-j) to use
(require 'dired-x)
(setq dired-dwim-target 1)

;; '' 补全优化
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
(sp-local-pair 'lisp-mode "'" nil :actions nil)
;; 以上也可以这么干：(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;; 解决在代码块中让两边的括号都高亮起来
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))

;; 解决在lisp-mode 下括号不高亮
(show-paren-mode t)

;; 删除dos系统中的  \r\M
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))



;; 增强Copy功能
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

;; 设置copy当前行
(global-set-key (kbd "C-d") 'duplicate-line)

;;; 快捷键

;;给配制文件加快捷键
(global-set-key (kbd "<f4>") 'open-init-file)

;; find-fcuntion find-variable find-function-on-key
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;;解决emacs ctrl-space与输入法冲突
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "S-SPC") 'set-mark-command)

;; 根据文件名和文件内容查找对应的文件
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; 在mac打开该文件所在文件夹
(global-set-key (kbd "C-x C-d") 'reveal-in-osx-finder)

;; 设置默认字符集
(set-language-environment "UTF-8")

;; 把下拉提示选项上下键改成 C-n 和 C-p
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; 全局找文件
(require 'helm-ag)
(global-set-key (kbd "C-c C-h") 'helm-do-ag-project-root)

(provide 'base)
