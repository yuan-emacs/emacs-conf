(require 'projectile)

(setq projectile-cache-file (expand-file-name  "projectile.cache" savefile-dir))
(projectile-mode t)
(setq projectile-switch-project-action 'projectile-dired)
(setq projectile-project-search-path '("~/disk/dev/zhangmen/"))

(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p A") 'projectile-add-known-project)
(define-key projectile-mode-map (kbd "s-p A") 'projectile-add-known-project)

(require 'helm-projectile)
(helm-projectile-on)
(define-key projectile-mode-map (kbd "C-c p h") 'helm-projectile)
(define-key projectile-mode-map (kbd "s-p h") 'helm-projectile)

(provide 'projectile-conf)
