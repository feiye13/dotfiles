;;; early-init.el --- Early initialization. -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 128 1024 1024)
                  gc-cons-percentage 0.1)))

(setq read-process-output-max (* 4 1024 1024))
(setq process-adaptive-read-buffering nil)

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
