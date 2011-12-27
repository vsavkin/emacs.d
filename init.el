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

;; eproject
(add-to-list 'load-path "~/.emacs.d/vendor/eproject")
(require 'eproject)
(require 'eproject-extras)

;; eproject global bindings
(defmacro .emacs-curry (function &rest args)
  `(lambda () (interactive)
     (,function ,@args)))

(defmacro .emacs-eproject-key (key command)
  (cons 'progn
        (loop for (k . p) in (list (cons key 4) (cons (upcase key) 1))
              collect
              `(global-set-key
                (kbd ,(format "C-x p %s" k))
                (.emacs-curry ,command ,p)))))

(.emacs-eproject-key "k" eproject-kill-project-buffers)
(.emacs-eproject-key "v" eproject-revisit-project)
(.emacs-eproject-key "b" eproject-ibuffer)
(.emacs-eproject-key "o" eproject-open-all-project-files)

(define-project-type ruby (generic-git) (look-for "Gemfile"))
