;;; init.el --- emacs config -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(add-to-list 'load-path "~/.config/emacs/lisp/")

(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
    (load custom-file))

(require 'init-package)

(require 'init-base)

(require 'init-ui)
(require 'init-meow)
(require 'init-tools)
(require 'init-dev)
(require 'init-vc)

(provide 'init)
;;; init.el ends here
