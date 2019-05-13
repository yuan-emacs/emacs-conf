;; org mode set
(require 'org)
(setq org-src-fontify-natively t)
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "工作安排")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
	("c" "Todo" entry (file+headline "~/org/abc.org" "other")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
	))

(global-set-key (kbd "C-c r") 'org-capture)

(require 'org-pomodoro)
(provide 'init-org)








