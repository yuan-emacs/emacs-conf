

(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
                      company
		      auto-complete
		      ac-slime
		      ;; theme setup
		      monokai-theme
		      solarized-theme
		      zenburn-theme
		      ;; other set
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      ;; major mode
		      js2-mode
		      js2-refactor
		      ;; major mode
		      nodejs-repl
		      ;;shell edit
		      exec-path-from-shell
		      popwin
		      web-mode
		      tide
		      sr-speedbar
		      projectile
		      tabbar
		      
                      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(provide 'init-packages)
