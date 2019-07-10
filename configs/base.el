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

;; 括号自动补全
(smartparens-global-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode) ;开始自动括号匹配

;; 解决在代码块中让两边的括号都高亮起来
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))

;; 解决在lisp-mode 下括号不高亮
(show-paren-mode t)

;; 在大括号内 Retrun 的时候，光标更智能放在对应的位置。
(electric-indent-mode t)
(electric-pair-mode t)

;; '' 补全优化
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode lisp-mode) "'" nil :actions nil)

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

(set-default-font "Courier New-16" t t)

(setq inhibit-splash-screen t)	;关闭启动动画

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
(global-set-key (kbd "<f2>") 'set-mark-command)
(global-set-key (kbd "<f12>") 'menu-bar-mode)
;; 启用 dired-x C-x C-j) to use
(require 'dired-x)
(setq dired-dwim-target 1)

;; 在成对括号之间跳转
(global-set-key (kbd "M-n") 'forward-sexp)
(global-set-key (kbd "M-p") 'backward-sexp)

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

;; 设置注释
(defun my-comment-or-uncomment-region (beg end &optional arg)
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end) nil)
                 (list (line-beginning-position)
                       (line-beginning-position 2))))
  (comment-or-uncomment-region beg end arg))

(global-set-key (kbd "C-c C-/") 'my-comment-or-uncomment-region)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "RET") 'newline-and-indent)


;; 代码缩进设置
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (whitespace-cleanup)
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (whitespace-cleanup)
        (indent-buffer)
        (message "Indent buffer.")))))

;; 代码缩进设置快捷键
(global-set-key (kbd "S-SPC f i") 'indent-region-or-buffer)
;; 格式化json
(global-set-key (kbd "S-SPC f j") 'json-pretty-print-buffer)

;;; ------------------- ui setting -------------------------------
;; 光标后面有光发出
(require 'beacon)
(beacon-mode t)

;; 提醒你显示哪些 keybindings
(require 'which-key)
(which-key-mode t)

;; whitespace-mode config
(require 'whitespace)
(setq whitespace-line-column 130) ;; limit line length
(setq whitespace-style '(face tabs empty trailing lines-tail))

;; saner regex syntax
(require 're-builder)
(setq reb-re-syntax 'string)

;; Compilation from Emacs
(defun base-colorize-compilation-buffer ()
  "Colorize a compilation mode buffer."
  (interactive)
  ;; we don't want to mess with child modes such as grep-mode, ack, ag, etc
  (when (eq major-mode 'compilation-mode)
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region (point-min) (point-max)))))

(require 'compile)
(setq compilation-ask-about-save nil  ; Just save before compiling
      compilation-always-kill t       ; Just kill old compile processes before
                                        ; starting the new one
      compilation-scroll-output 'first-error ; Automatically scroll to first
                                        ; error
      )

(require 'ansi-color)
(add-hook 'compilation-filter-hook #'base-colorize-compilation-buffer)

(provide 'base)
