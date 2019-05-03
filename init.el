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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (pallet ace-window company auto-complete ac-slime real-auto-save monokai-theme solarized-theme zenburn-theme hungry-delete swiper counsel smartparens js2-mode js2-refactor nodejs-repl exec-path-from-shell expand-region iedit popwin web-mode tide sr-speedbar projectile tabbar lsp-mode lsp-vue company-lsp company-quickhelp reveal-in-osx-finder htmlize org-pomodoro helm-ag flycheck el-get yasnippet auto-yasnippet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
