;;; init-tools.el -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package vertico
  :init
  (vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package embark
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :bind
  (("C-." . embark-act)))

(use-package consult
  :bind
  (("C-s" . consult-line)
   ("C-x b" . consult-buffer)))

(use-package fanyi
  :custom
  (fanyi-providers '(;; 海词
                     fanyi-haici-provider))
  :bind
  (("C-," . fanyi-dwim)))

(provide 'init-tools)
;;; init-tools.el ends here
