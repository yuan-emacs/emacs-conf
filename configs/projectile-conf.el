(require 'projectile)

(setq projectile-cache-file (expand-file-name  "projectile.cache" savefile-dir))
(projectile-mode t)
(setq projectile-switch-project-action 'projectile-dired)

(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(provide 'projectile-conf)
