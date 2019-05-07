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
;; (require 'init-mysql)
;;(load-file (expand-file-name "~/.emacs.d/local/mysql-config.el"))
(require 'base)
(require 'init-hipple)
(require 'init-js)
(require 'init-slime)
(require 'init-swiper)
(require 'init-tide)
(require 'init-comment)
(require 'init-neotree)
;;(require 'init-git-emacs)
(require 'init-vue)			

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)




