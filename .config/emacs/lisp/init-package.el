;;; init-package.el --- package -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(require 'package)
(require 'use-package)

(setq package-archives '(("gnu" . "https://mirrors.nju.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.nju.edu.cn/elpa/melpa/")
                         ("nongnu" . "https://mirrors.nju.edu.cn/elpa/nongnu/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(setq use-package-always-ensure t)

(provide 'init-package)
;;; init-package.el ends here
