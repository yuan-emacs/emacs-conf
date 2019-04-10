;; sql setting

(load-file (expand-file-name "~/.emacs.d/lisp/lib/sql.el"))
(load-file (expand-file-name "~/.emacs.d/lisp/lib/mysql.el"))
(setq sql-connection-alist
      '((pool-a
         (sql-product 'mysql)
         (sql-server "you ip")
         (sql-user "username")
         (sql-password "password")
         (sql-database "database name")
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

(define-key global-map [C-f1] 'sql-local)

;; ssh 连接mysql
;; (defadvice sql-mysql (around sql-mysql-around activate)
;;   "SSH to linux, then connect"
;;   (let ((default-directory "/ssh:host.myhost.com:"))
;;     ad-do-it))

(provide 'init-mysql)
