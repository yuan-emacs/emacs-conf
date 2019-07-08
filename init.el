(package-initialize)

;; emacs 包管理器用 cask 来管理
(require 'cask "~/.cask/cask.el")
(cask-initialize)    ; 类似于 package-initialize
(require 'pallet)
(pallet-mode t)      ; 激活 pallet, 在安装包时将 Cask 文件写入相应信息

(add-to-list 'load-path "./configs")

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;给配制文件加快捷键
(global-set-key (kbd "<f4>") 'open-init-file)

(setq custom-file (expand-file-name "./custom.el" user-emacs-directory))
(load-file custom-file)

(require 'base)

(require 'base-company)

(require 'hungry-del)
