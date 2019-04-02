;; 设置自动保存
(require 'auto-save)
(auto-save-enable)
(setq auto-save-silent t)
(setq auto-save-delete-trailing-whitespace t)

;;去掉滚动时产生响声
(setq ring-bell-function 'ignore)

;;开始自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;安装主题
(load-theme 'solarized-dark t)

;; 括号自动补全
(smartparens-global-mode t)

					;关闭缩进
;;(electric-indent-mode 1)
					;开启全局 Company补全
(global-company-mode 1)

;;(auto-complete-mode 1)
(global-auto-complete-mode t)

;; 用ac-slime 实现 lisp 代码提示
(require 'ac-slime)
 (add-hook 'slime-mode-hook 'set-up-slime-ac)
 (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
 (eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'slime-repl-mode))

;;去掉emacs自动备份文件
(setq-default make-backup-files nil)

;; emacs 删除文字优化 mac中使用
(delete-selection-mode t)

;;使用hungry-delay
(require 'hungry-delete)
(global-hungry-delete-mode)

;; Swiper & Counsel 优化 M-X 提示
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; js idea
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
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
					    ("today" "today is ")
					    ("syso" "System.out.println()")
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

;; Hipple 补全
(setq hippie-expand-try-function-list '(try-expand-debbrev
                                        try-expand-debbrev-all-buffers
                                        try-expand-debbrev-from-kill
                                        try-complete-file-name-partially
                                        try-complete-file-name
                                        try-expand-all-abbrevs
                                        try-expand-list
                                        try-expand-line
                                        try-complete-lisp-symbol-partially
                                        try-complete-lisp-symbol))

;; 删除和复制时总是询问是否要删除和拷贝
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;;清除回车时进入一个新目录创建一个新的缓冲区
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 启用 dired-x ()C-c C-j) to use
(require 'dired-x)
(setq dired-dwim-target 1)

;; '' 补全优化
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
;; 以上也可以这么干：(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;; 解决在代码块中让两边的括号都高亮起来
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))

;; 删除dos系统中的  \r\M
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; 设置web-mode 对不同语言缩减设置
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;; 定义两个空格和四个空格之间的切换
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
        (setq js-indent-level (if (= js-indent-level 2) 4 2))
        (setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
             (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
             (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))
  (setq indent-tabs-mode nil))

;; 添加js2-refactor hook
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

;; 增强Copy功能
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

;; emacs 中添加 slime

(setq inferior-lisp-program "/usr/bin/sbcl");
(add-to-list 'load-path "/opt/slime")
(require 'slime)
(slime-setup)
(require 'slime-autoloads)
(slime-setup '(slime-fancy slime-banner))

(provide 'init-better-defaults)
