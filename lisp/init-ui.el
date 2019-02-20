;; 关闭 默认的 toolbar
(tool-bar-mode -1)
(scroll-bar-mode t)

;显示行号
(global-linum-mode t)
 ;更改光标样式
(setq-default cursor-type 'bar)

;;关闭启动画面
(setq inhibit-splash-screen 1)

;;设置高亮当前行
(global-hl-line-mode t)

;;设置字体
(set-default-font "Consolas-14")

;;设置默认开启全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(provide 'init-ui)

