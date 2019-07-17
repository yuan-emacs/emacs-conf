(require 'helm-ag)
(require 'helm-etags-plus)

(helm-mode t)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c q") 'helm-do-ag-project-root)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

(global-set-key (kbd "s-/") 'helm-etags-plus-select)

;;list all visited tags
(global-set-key (kbd "s-l") 'helm-etags-plus-history)
;;go back directly
(global-set-key (kbd "s-,") 'helm-etags-plus-history-go-back)
;;go forward directly
(global-set-key (kbd "s-.") 'helm-etags-plus-history-go-forward) 

(provide 'helm-conf)

