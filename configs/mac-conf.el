(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; It's all in the Meta
(setq ns-function-modifier 'hyper)

(defun swap-meta-and-super ()
  "Swap mate and super."
  (interactive)
  (if (eq mac-command-modifier 'super)
      (progn
        (setq mac-command-modifier 'meta)
        (setq mac-option-modifier 'super))

    (setq mac-command-modifier 'super)
    (setq mac-option-modifier 'meta)))

(global-set-key (kbd "S-SPC w") 'swap-meta-and-super)
(global-set-key (kbd "S-SPC /") 'hippie-expand)

;; There's no point in hiding the menu bar on macOS, so let's not do it
(menu-bar-mode +1)

;; Enable emoji, and stop the UI from freezing when trying to display them.
(when (fboundp 'set-fontset-font)
  (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))

;; 在mac打开该文件所在文件夹
(require 'reveal-in-osx-finder)
(global-set-key (kbd "S-SPC o f") 'reveal-in-osx-finder)

(provide 'mac-conf)
