(require 'org)
(require 'org-pomodoro)

(setq org-src-fontify-natively t)

(add-to-list 'auto-mode-alist '("\\.org\\’" . org-mode))
(global-set-key (kbd "C-c o l") 'org-store-link)
(global-set-key (kbd "C-c o a") 'org-agenda)
(global-set-key (kbd "C-c o b") 'org-iswitchb)
(setq org-log-done t)

(setq org-agenda-files '("~/org"))

(setq org-capture-templates
      '(("e" "Todo" entry (file+headline "~/org/emacs_study.org" "emacs笔记")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
        ("t" "Todo" entry (file+headline "~/org/work.org" "临时性工作安排")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
        ("s" "Todo" entry (file+headline "~/org/sale.org" "销售系统工作内容")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
        ("d" "Todo" entry (file+headline "~/org/daily.org" "工作日志")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
	))

(global-set-key (kbd "C-c o c") 'org-capture)

(provide 'org-conf)
