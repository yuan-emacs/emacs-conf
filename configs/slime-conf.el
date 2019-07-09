;; 用ac-slime 实现 lisp 代码提示
(require 'ac-slime)
 (add-hook 'slime-mode-hook 'set-up-slime-ac)
 (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
 (eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'slime-repl-mode))

;; emacs 中添加 slime

(setq inferior-lisp-program "/usr/local/bin/sbcl");
(add-to-list 'load-path "/usr/local/lisp/slime-2.23")
(require 'slime)
(slime-setup)
(require 'slime-autoloads)
(slime-setup '(slime-fancy slime-banner))


(provide 'slime-conf)
