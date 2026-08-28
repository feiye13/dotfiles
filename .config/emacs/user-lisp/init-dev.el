;;; init-dev.el --- Development Configuration -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package corfu
  :hook
  ((prog-mode . corfu-mode)
   (shell-mode . corfu-mode)
   (eshell-mode . corfu-mode))
  :init
  (global-corfu-mode)
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 2))

(use-package eglot
  :ensure nil
  :hook
  (prog-mode . eglot-ensure)
  :bind
  ("C-c l f" . eglot-format)
  :config
  (setq eglot-ignored-server-capabilities '(:inlayHintProvider)))

(use-package yasnippet
  :init
  (yas-global-mode 1))

;;; treesit-auto
(use-package treesit-auto
  :config
  (global-treesit-auto-mode))

;;; c-ts-mode
(use-package c-ts-mode
  :ensure nil
  :mode ("\\.c\\'" "\\.h\\'")
  :hook ((c-ts-mode . (lambda ()
                        (setq c-ts-mode-indent-offset 4)))))

;;; yaml-ts-mode
(use-package yaml-ts-mode
  :ensure nil
  :mode ("\\.ya?ml\\'" "\\.yaml\\'")
  :hook ((yaml-ts-mode . (lambda ()
                           (setq-local yaml-indent-offset 2)))))

(provide 'init-dev)
;;; init-dev.el ends here
