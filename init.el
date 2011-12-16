(require 'package)

;; packages -----------
;; --------------------
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)

(package-initialize)



;; visual -------------
;;---------------------

;; disable bell
(setq visible-bell nil)
(setq ring-bell-function (lambda () ()))

;; color theme
(set-default-font "Consolas-13")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-solarized-light)))

(global-linum-mode 1)
(global-hl-line-mode)


;; auto-complete
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
