(require 'helm-ag)
(helm-mode t)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c q") 'helm-do-ag-project-root)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(provide 'helm-conf)

