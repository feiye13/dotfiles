;;; init-base.el --- base -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

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

(setq make-backup-files nil)
(setq auto-save-default nil) ; 关闭自动保存，不会生成以 '~' 结尾的文件

(setq-default indent-tabs-mode nil) ; only use spaces instead of TAB, use C-q TAB to input the TAB char
(setq-default tab-width 4) ; make tab-width always 4

(setq inhibit-startup-screen t)
(setq use-short-answers t) ; 用 y/n 代替 yes/no
(setq mouse-yank-at-point t) ; 粘贴于光标处,而不是鼠标指针处
(setq x-select-enable-clipboard t) ; 支持 emacs 和外部程序的粘贴
(setq inhibit-compacting-font-caches t) ; 使用字体缓存，避免卡顿
(setq confirm-kill-processes nil) ; 退出自动杀掉进程
(setq word-wrap-by-category t) ;按照中文折行

(setq scroll-margin 5)
(setq scroll-conservatively 10000)

(delete-selection-mode t) ; 输入字符替换选中的文本
(global-auto-revert-mode t) ; 读取文件在 Emacs 外的修改
(auto-save-visited-mode t)
(electric-pair-mode t) ; 括号补全
(show-paren-mode t) ; 括号匹配提示

(editorconfig-mode t)

;; Save place
(use-package saveplace
  :hook (after-init . save-place-mode))

;; History
(use-package recentf
  :bind (("C-x C-r" . recentf-open-files))
  :hook (after-init . recentf-mode)
  :init (setq recentf-max-saved-items 300
              recentf-exclude
              '("\\.?cache" ".cask" "url" "COMMIT_EDITMSG\\'" "bookmarks"
                "\\.\\(?:gz\\|gif\\|svg\\|png\\|jpe?g\\|bmp\\|xpm\\)$"
                "\\.?ido\\.last$" "\\.revive$" "/G?TAGS$" "/.elfeed/"
                "^/tmp/" "^/var/folders/.+$" "^/ssh:" "/persp-confs/"
                (lambda (file) (file-in-directory-p file package-user-dir))))
  :config
  (push (expand-file-name recentf-save-file) recentf-exclude)
  (add-to-list 'recentf-filename-handlers #'abbreviate-file-name))

(use-package savehist
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
              history-length 1000
              savehist-additional-variables '(mark-ring
                                              global-mark-ring
                                              search-ring
                                              regexp-search-ring
                                              extended-command-history)
              savehist-autosave-interval 300))

(provide 'init-base)
;;; init-base.el ends here
