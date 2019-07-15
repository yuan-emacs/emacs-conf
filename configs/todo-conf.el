(require 'hl-todo)
(global-hl-todo-mode t)

(define-key hl-todo-mode-map (kbd "S-SPC t p") 'hl-todo-previous)
(define-key hl-todo-mode-map (kbd "S-SPC t n") 'hl-todo-next)
(define-key hl-todo-mode-map (kbd "S-SPC t o") 'hl-todo-occur)
(define-key hl-todo-mode-map (kbd "S-SPC t i") 'hl-todo-insert)

(provide 'todo-conf)
