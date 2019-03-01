;;给配制文件加快捷键
(global-set-key (kbd "<f4>") 'open-init-file)

;;swiper and counsel 相关设置
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;;在git中用文件名打文件
(global-set-key (kbd "C-c p f") 'counsel-git)


(add-hook 'js-mode-hook
          (lambda ()
            (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-expression)
            (define-key js-mode-map (kbd "C-c C-j") 'nodejs-repl-send-line)
            (define-key js-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
            (define-key js-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)
            (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)))

;; find-fcuntion find-variable find-function-on-key
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 开启打开最近文件记录
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;解决emacs ctrl-space与输入法冲突
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "S-SPC") 'set-mark-command)

;; 代码缩进设置快捷键
(global-set-key (kbd "C-S-f") 'indent-region-or-buffer)

;; Hippie 补全 比如路径补全
(global-set-key (kbd "s-/") 'hippie-expand)

;; 设置两个空格和四个空格切换
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; 设置copy当前行
(global-set-key (kbd "C-d") 'duplicate-line)

;; 根据文件名和文件内容查找对应的文件
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(provide 'init-keybindings)

