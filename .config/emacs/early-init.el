;;; early-init.el --- Early initialization. -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 128 1024 1024)
                  gc-cons-percentage 0.1)))

;; 增加 IO 性能
(setq process-adaptive-read-buffering nil)
(setq read-process-output-max (* 1024 1024))

;; 对大文件或超长行提供性能优化
(setq-default bidi-display-reordering nil)
(setq-default bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t
      long-line-threshold 1000
      large-hscroll-threshold 1000
      syntax-wholeline-max 1000)

(setq package-enable-at-startup nil)

(prefer-coding-system 'utf-8)

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Set the scaling mode to avoid gaps after maximizing the window.
(setq frame-resize-pixelwise t)

;; Maximize the frame
(let ((my-max '(fullscreen . maximized)))
  (add-to-list 'initial-frame-alist my-max)
  (add-to-list 'default-frame-alist my-max))

(provide 'early-init)
;;; early-init.el ends here
