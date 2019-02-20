;;基础配制
(package-initialize)
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

(load-file custom-file)
