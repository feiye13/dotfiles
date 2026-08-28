;;; init-vc.el --- version control -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package magit
  :bind ("C-x g" . magit-status)
  :config
  (add-hook 'magit-mode-hook (lambda () (meow-mode -1))))

(provide 'init-vc)
;;; init-vc.el ends here
