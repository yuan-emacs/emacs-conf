;;基础配制
(package-initialize)

;;(require 'org-install)
;;(require 'ob-tangle)
;;(org-babel-load-file (expand-file-name "org-file-name.org" user-emacs-directory))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; package management
(require 'init-packages)
(require 'init-org)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-mysql)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

;; 设置注释
(defun my-comment-or-uncomment-region (beg end &optional arg)  
  (interactive (if (use-region-p)  
                   (list (region-beginning) (region-end) nil)  
                 (list (line-beginning-position)  
                       (line-beginning-position 2))))  
  (comment-or-uncomment-region beg end arg))

(global-set-key (kbd "C-c C-/") 'my-comment-or-uncomment-region)


;; 修改M-; 注释内容
;; (add-hook (lambda () (setq comment-start ";;;;")))

;; 自定义代码输入
;; (defun insert-break-line()
;;   "Insert a break line at cursor point."
;;   (interactive)
;;   (insert ";; =======================================================")
;;   (eval (newline-and-indent))
;;   (insert ";; "))
;; (define-key (kbd "C-M-j") 'insert-break-line)


(load-file custom-file)
