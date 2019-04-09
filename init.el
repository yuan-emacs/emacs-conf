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

;; sql setting

(load-file (expand-file-name "~/.emacs.d/lisp/mysql/sql.el"))
(load-file (expand-file-name "~/.emacs.d/lisp/mysql/mysql.el"))
(setq sql-connection-alist
      '((pool-a
         (sql-product 'mysql)
         (sql-server "test.db.zmaxis.com")
         (sql-user "forge")
         (sql-password "Zhangmen1dui1")
         (sql-database "zm-audio")
         (sql-port 3306))
	))


(defun sql-connect-preset (name)
  "Connect to a predefined SQL connection listed in `sql-connection-alist'"
  (eval `(let ,(cdr (assoc name sql-connection-alist))
	   (flet ((sql-get-login (&rest what)))
	     (sql-product-interactive sql-product)))))

(defun sql-local ()
  "Connect to the local MySQL server"
  (interactive)
  (sql-connect-preset 'pool-a)
  (delete-other-windows))

(define-key global-map [f10] 'sql-local)

;; ssh 连接mysql
;; (defadvice sql-mysql (around sql-mysql-around activate)
;;   "SSH to linux, then connect"
;;   (let ((default-directory "/ssh:host.myhost.com:"))
;;     ad-do-it))


(load-file custom-file)
