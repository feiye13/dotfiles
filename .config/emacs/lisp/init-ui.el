;;; init-ui.el --- ui -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; Cursor
(blink-cursor-mode -1) ;; 关闭光标闪动

(global-display-line-numbers-mode t) ;; 显示行号
(setq display-line-numbers-type 'relative)
(global-hl-line-mode t) ;; 高亮光标所在行


;; Font
(add-hook 'emacs-startup-hook
          (lambda ()
            (custom-set-faces
             '(default ((t (:family "LXGW WenKai Mono" :height 180 :weight Medium))))
             )))

(use-package doom-themes
  :config
  (load-theme 'doom-oksolar-dark t))

(provide 'init-ui)
;;; init-ui.el ends here
