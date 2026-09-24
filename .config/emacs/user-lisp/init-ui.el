;;; init-ui.el --- ui -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; Cursor
(blink-cursor-mode -1) ;; 关闭光标闪动
(setq visible-cursor nil)
(setopt cursor-in-non-selected-windows nil)

(global-display-line-numbers-mode t) ;; 显示行号
(setq display-line-numbers-type 'relative)
(global-hl-line-mode t) ;; 高亮光标所在行

;; Font
(add-hook 'emacs-startup-hook
          (lambda ()
            (custom-set-faces
             '(default ((t (:family "LXGW WenKai Mono" :height 160 :weight Medium))))
             )))

(setq redisplay-skip-fontification-on-input t)

;; Theme
(use-package catppuccin-theme
  :config
  (setq catppuccin-flavor 'frappe)
  (if (daemonp)
      (add-hook 'server-after-make-frame-hook #'catppuccin-reload)
    (load-theme 'catppuccin :no-confirm)))

;; modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1))

(provide 'init-ui)
;;; init-ui.el ends here
