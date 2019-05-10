;;;; 此文件以是以前的包管理工具，现在已迁移用 Cask 做包管理工具

;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;; 			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
;; ;; cl - Common Lisp Extension
;; (require 'cl)

;; ;; Add Packages
;; (defvar my/packages '(
;; 		      use-package
;; 		      ;; --- Auto-completion ---
;;                       company
;; 		      auto-complete
;; 		      ac-slime
;; 		      real-auto-save
;; 		      ;; theme setup
;; 		      color-theme-sanityinc-tomorrow
;; 		      monokai-theme
;; 		      solarized-theme
;; 		      zenburn-theme
;; 		      ;; other set
;; 		      hungry-delete
;; 		      swiper
;; 		      counsel
;; 		      smartparens
;; 		      ;; major mode
;; 		      js2-mode
;; 		      js2-refactor
;; 		      ;; major mode
;; 		      nodejs-repl
;; 		      ;;shell edit
;; 		      exec-path-from-shell
;; 		      expand-region
;; 		      iedit
;; 		      popwin
;; 		      web-mode
;; 		      tide
;; 		      sr-speedbar
;; 		      projectile
;; 		      tabbar
;; 		      ;; vue setting
;; 		      lsp-mode
;; 		      css-mode
;; 		      scss-mode
;; 		      ;;lsp-clients
;; 		      ;;lsp-vue
;; 		      lsp-ui
;; 		      company-box
;; 		      company-lsp
;; 		      company-quickhelp

;; 		      ;; mac
;; 		      reveal-in-osx-finder
;; 		      ;; org-mode to html
;; 		      htmlize

;; 		      org-pomodoro
;; 		      helm-ag
;; 		      flycheck
;; 		      el-get
;; 		      yasnippet
;; 		      auto-yasnippet
;; 		      neotree
;; 		      all-the-icons

;;                       ) "Default packages")

;; (setq package-selected-packages my/packages)

;; (defun my/packages-installed-p ()
;;   (loop for pkg in my/packages
;;         when (not (package-installed-p pkg)) do (return nil)
;;         finally (return t)))

;; (unless (my/packages-installed-p)
;;   (message "%s" "Refreshing package database...")
;;   (package-refresh-contents)
;;   (dolist (pkg my/packages)
;;     (when (not (package-installed-p pkg))
;;       (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(provide 'init-packages)
