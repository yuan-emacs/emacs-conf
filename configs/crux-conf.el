(require 'crux)
(require 'imenu-anywhere)

(global-set-key [(shift return)] 'crux-smart-open-line) ;实现 shift + 回事换行
(global-set-key (kbd "C-c i") 'imenu-anywhere)

(provide 'crux-conf)
