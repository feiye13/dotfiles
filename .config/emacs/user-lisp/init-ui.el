;;; init-ui.el --- ui -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; Cursor
(blink-cursor-mode -1) ;; 关闭光标闪动
(setq visible-cursor nil)
(setopt cursor-in-non-selected-windows nil)

;; (global-display-line-numbers-mode t) ;; 显示行号
;; (setq display-line-numbers-type 'relative)
;; (global-hl-line-mode t) ;; 高亮光标所在行

;; (add-to-list 'default-frame-alist '(alpha-background . 90))

;; Font
(set-face-attribute 'default nil
                    :family "Sarasa Mono SC"
                    :height 160)

;; Theme
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (load-theme 'modus-operandi t))))
  (load-theme 'modus-operandi t))

;; modeline
(use-package doom-modeline
  :ensure t
  :init
  ;; 显示时间和光标行号
  (setq doom-modeline-time t
        doom-modeline-enable-buffer-position t
        doom-modeline-position-line-format '("L%l")
        doom-modeline-position-column-line-format '("L%l"))

  (doom-modeline-mode 1)
  :config
  ;; 使用 24 小时制，只显示时间
  (setq display-time-24hr-format t
        display-time-day-and-date nil)

  (display-time-mode 1)
  (line-number-mode 1))

(provide 'init-ui)
;;; init-ui.el ends here
