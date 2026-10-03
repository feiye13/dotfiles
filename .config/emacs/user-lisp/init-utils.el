;;; init-utils.el -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; Meow
(use-package meow
  :ensure t
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
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package vertico-posframe
  :ensure t
  :after vertico
  :config
  (vertico-posframe-mode 1))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package embark
  :ensure t
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :bind
  (("C-." . embark-act)))

(use-package consult
  :ensure t
  :bind
  (("C-s" . consult-line)
   ("C-x b" . consult-buffer)))

(use-package fanyi
  :ensure t
  :custom
  (fanyi-providers '(;; 海词
                     fanyi-haici-provider))
  :bind
  (("C-," . fanyi-dwim)))

(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode)
  :custom
  (undo-tree-auto-save-history nil))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package ghostel
  :ensure t
  :bind (("C-c t" . ghostel)
         :map ghostel-semi-char-mode-map
         ("C-s"  . consult-line))
  :hook (ghostel-mode . (lambda () (display-line-numbers-mode -1)))
  :config
  (add-to-list 'ghostel-eval-cmds '("magit-status-setup-buffer" magit-status-setup-buffer)))

(provide 'init-utils)
;;; init-utils.el ends here
