;;; init-utils.el -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; Meow
(use-package meow
  :ensure t
  ;; `:bind' would defer loading, but Meow must be loaded at startup so
  ;; that `meow-global-mode' is enabled and the state keymaps exist.
  :demand t
  :custom
  (meow-use-clipboard t)
  :bind
  ;; MOTION state
  (:map meow-motion-state-keymap
        ("j" . meow-next)
        ("k" . meow-prev)
        ("<escape>" . ignore))
  ;; Leader keys, also reachable via SPC in Meow (`mode-specific-map' is C-c)
  (:map mode-specific-map
        ("1" . meow-digit-argument)
        ("2" . meow-digit-argument)
        ("3" . meow-digit-argument)
        ("4" . meow-digit-argument)
        ("5" . meow-digit-argument)
        ("6" . meow-digit-argument)
        ("7" . meow-digit-argument)
        ("8" . meow-digit-argument)
        ("9" . meow-digit-argument)
        ("0" . meow-digit-argument)
        ("/" . meow-keypad-describe-key)
        ("?" . meow-cheatsheet))
  ;; NORMAL state
  (:map meow-normal-state-keymap
        ("0" . meow-expand-0)
        ("9" . meow-expand-9)
        ("8" . meow-expand-8)
        ("7" . meow-expand-7)
        ("6" . meow-expand-6)
        ("5" . meow-expand-5)
        ("4" . meow-expand-4)
        ("3" . meow-expand-3)
        ("2" . meow-expand-2)
        ("1" . meow-expand-1)
        ("-" . negative-argument)
        (";" . meow-reverse)
        ("," . meow-inner-of-thing)
        ("." . meow-bounds-of-thing)
        ("[" . meow-beginning-of-thing)
        ("]" . meow-end-of-thing)
        ("a" . meow-append)
        ("A" . meow-open-below)
        ("b" . meow-back-word)
        ("B" . meow-back-symbol)
        ("c" . meow-change)
        ("d" . meow-delete)
        ("D" . meow-backward-delete)
        ("e" . meow-next-word)
        ("E" . meow-next-symbol)
        ("f" . meow-find)
        ("g" . meow-cancel-selection)
        ("G" . meow-grab)
        ("h" . meow-left)
        ("H" . meow-left-expand)
        ("i" . meow-insert)
        ("I" . meow-open-above)
        ("j" . meow-next)
        ("J" . meow-next-expand)
        ("k" . meow-prev)
        ("K" . meow-prev-expand)
        ("l" . meow-right)
        ("L" . meow-right-expand)
        ("m" . meow-join)
        ("n" . meow-search)
        ("o" . meow-block)
        ("O" . meow-to-block)
        ("p" . meow-yank)
        ("q" . meow-quit)
        ("Q" . meow-goto-line)
        ("r" . meow-replace)
        ("R" . meow-swap-grab)
        ("s" . meow-kill)
        ("t" . meow-till)
        ("u" . meow-undo)
        ("U" . meow-undo-in-selection)
        ("v" . meow-visit)
        ("w" . meow-mark-word)
        ("W" . meow-mark-symbol)
        ("x" . meow-line)
        ("X" . meow-goto-line)
        ("y" . meow-save)
        ("Y" . meow-sync-grab)
        ("z" . meow-pop-selection)
        ("'" . repeat)
        ("<escape>" . ignore))
  :config
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)

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
