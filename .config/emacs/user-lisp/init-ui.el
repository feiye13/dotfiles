;;; init-ui.el --- ui -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; Cursor
(blink-cursor-mode -1) ;; 关闭光标闪动

(global-display-line-numbers-mode t) ;; 显示行号
(setq display-line-numbers-type 'relative)
(global-hl-line-mode t) ;; 高亮光标所在行

(setq-default mode-line-format nil)

;; Font
(add-hook 'emacs-startup-hook
          (lambda ()
            (custom-set-faces
             '(default ((t (:family "LXGW WenKai Mono" :height 160 :weight Medium))))
             )))

(setq redisplay-skip-fontification-on-input t)

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (select-frame frame)
                (load-theme 'modus-operandi-tinted)))
  (load-theme 'modus-operandi-tinted))

(use-package awesome-tray
  :vc (:url "https://github.com/manateelazycat/awesome-tray.git" :rev :newest)
  :custom
  (awesome-tray-active-modules '("location" "belong" "meow" "file-path" "mode-name" "git" "date"))
  (awesome-tray-info-padding-right 1)
  :config
  (if (daemonp)
      (add-hook 'server-after-make-frame-hook #'awesome-tray-mode)
    (awesome-tray-mode 1)))

(provide 'init-ui)
;;; init-ui.el ends here
