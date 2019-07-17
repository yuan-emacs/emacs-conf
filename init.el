(package-initialize)

;; emacs 包管理器用 cask 来管理
(require 'cask "~/.cask/cask.el")
(cask-initialize)    ; 类似于 package-initialize
(require 'pallet)
(pallet-mode t)      ; 激活 pallet, 在安装包时将 Cask 文件写入相应信息

;; 全局变量
(setq load-prefer-newer t)
(defvar home-path "~/.emacs.d/")
(defvar savefile-dir (expand-file-name "savefile" home-path))
(defvar special-dir (expand-file-name "special" home-path))

(add-to-list 'load-path "~/.emacs.d/configs")

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;给配制文件加快捷键
(global-set-key (kbd "<f4>") 'open-init-file)

(setq custom-file (expand-file-name "custom.el" special-dir))
(load-file custom-file)

;; Linux specific settings
(when (eq system-type 'gnu/linux)
  (require 'linux-conf))

(require 'base)

(require 'abbrev-conf)

(require 'base-company)

(require 'hungry-del)

(require 'helm-conf)

(require 'theme-conf)

(require 'projectile-conf)

(require 'popwin-conf)

(require 'auto-save-conf)

(require  'ivy-conf)

(require 'bookmark-conf)

(require 'web-conf)

;;(require 'ido-conf)

(require 'crux-conf)

(require 'youdao-conf)

(require 'org-conf)

(require 'magit-conf)

(require  'lsp-conf)

(require 'edit-conf)

(require 'todo-conf)
