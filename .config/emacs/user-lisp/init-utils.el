;;; init-utils.el -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; Meow
(use-package meow
  :custom
  (meow-use-clipboard t)
  :config
  (meow-setup)

  (setopt meow-mode-state-list
          (append '((magit-mode . motion)
                    (ghostel-mode . insert)
                    (git-commit-mode . motion))
                  meow-mode-state-list))

  (meow-global-mode 1))

;; magit
(use-package magit
  :bind ("C-x g" . magit-status))

(use-package vertico
  :init
  (vertico-mode))

(use-package vertico-posframe
  :after vertico
  :config
  (vertico-posframe-mode 1))

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

(use-package undo-tree
 :init (global-undo-tree-mode)
 :custom
 (undo-tree-auto-save-history nil))

(use-package rainbow-delimiters
 :hook (prog-mode . rainbow-delimiters-mode))

(use-package ghostel
  :bind (("C-c t" . ghostel)
         :map ghostel-semi-char-mode-map
         ("C-s"  . consult-line))
  :hook (ghostel-mode . (lambda () (display-line-numbers-mode -1)))
  :config
  (add-to-list 'ghostel-eval-cmds '("magit-status-setup-buffer" magit-status-setup-buffer)))

(provide 'init-utils)
;;; init-utils.el ends here
