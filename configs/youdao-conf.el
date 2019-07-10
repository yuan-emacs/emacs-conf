(require 'youdao-dictionary)
(setq url-automatic-caching t)

(global-set-key (kbd "S-SPC y s") 'youdao-dictionary-search-at-point+)
(global-set-key (kbd "S-SPC y i") 'youdao-dictionary-search-from-input)

;; 保存搜索记录
(setq youdao-dictionary-search-history-file (expand-file-name "youdao-history.txt" savefile-dir))
;; 支持中文分词
(setq youdao-dictionary-use-chinese-word-segmentation t)

(provide 'youdao-conf)
