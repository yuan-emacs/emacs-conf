(setq default-abbrev-mode t)
(abbrev-mode t)
(setq abbrev-file-name (expand-file-name "abbrev_defs.el" special-dir))
(setq save-abbrevs t)
(quietly-read-abbrev-file)
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))

(global-set-key (kbd "S-SPC a g") 'define-global-abbrev)
(global-set-key (kbd "S-SPC a m") 'define-mode-abbrev)


(provide 'abbrev-conf)


