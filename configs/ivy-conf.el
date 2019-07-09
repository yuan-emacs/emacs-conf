(require 'ivy)

(ivy-mode t)

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)

(setq projectile-completion-system 'ivy)

;; 修改 C-s 查询窗口
(global-set-key "\C-s" 'swiper)

(provide 'ivy-conf)
