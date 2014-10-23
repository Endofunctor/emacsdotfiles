(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'default-frame-alist '(font . "Menlo for Powerline"))
(set-face-attribute 'default t :font "Menlo for Powerline")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'color-theme-phil-neon t)

(load-file "~/.emacs.d/julia-mode.el")
(require 'julia-mode)

(load-file "~/.emacs.d/vendor/ppindent/ppindent.el")
(require 'ppindent)

(add-to-list 'load-path "/Users/marques/Development/rust/src/etc/emacs/")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)

(load-file "~/.emacs.d/themes/color-theme-purpdrank-neon.el")
(require 'color-theme)
(color-theme-purpdrank-neon)

;; Following 4 commands are an attempt to fix the damn installer
;; (setq powerline-color1 "#073642")
;; (setq powerline-color2 "#002b36")

;; (set-face-attribute 'mode-line nil
;; 		    :inverse-video nil
;;                     :foreground "#fdf6e3"
;;                     :background "#2aa198"
;;                     :box nil)
;; (set-face-attribute 'mode-line-inactive nil
;; 		    :inverse-video nil
;;                     :box nil)

;; (set-face-attribute 'mode-line nil
;;                     :foreground "#fdf6e3"
;;                     :background "#859900"
;;                     :box nil)
;; (set-face-attribute 'mode-line-inactive nil
;;                     :box nil)(set-face-attribute 'mode-line nil
;;                     :box nil)
;; (set-face-attribute 'mode-line-inactive nil
;;                     :box nil)

;; Set the cursor style
(set-default 'cursor-type 'bar)

;; Get rid of the aquamacs toolbar
(tool-bar-mode 0)

;; Ditch them scrollbars
(scroll-bar-mode -1)

;; Highlight current line
(global-hl-line-mode 1)

;; Customize background color of lighlighted line
;;(set-face-background 'hl-line "#222222")

;;(modify-frame-parameters (selected-frame) '((alpha . 90)))

;;(setq tab-stop-list (number-sequence 2 200 2))
(setq default-tab-width 8)
(setq c-default-style "linux"
      c-basic-offset 2)
(setq js-indent-level 2)

(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

(add-to-list 'load-path "~/emacs/vendor/tramp/lisp/")
(require 'tramp)

;; 
(defun node-js-eval-region-or-buffer ()
  "Evaluate the current buffer (or region if mark-active),
   and return the result into another buffer,
   which is to be shown in a window."
  (interactive)
  (let ((debug-on-error t) (start 1) (end 1))
    (cond
     (mark-active
      (setq start (point))
      (setq end (mark)))
     (t
      (setq start (point-min))
      (setq end (point-max))))
    (call-process-region
     start end     ; seems the order does not matter
     "node"        ; node.js
     nil           ; don't delete region
     "node.js"     ; output buffer
     nil)          ; no redisply during output
    (message "Region or buffer evaluated!")
    (setq deactivate-mark t))) ; deactive the region, regardless

(define-key global-map (kbd "C-c v") 'node-js-eval-region-or-buffer)

(add-to-list 'load-path "~/.emacs.d/vendor/smooth-scroll")
(require 'smooth-scroll)
(smooth-scroll-mode t)

(add-to-list 'load-path "~/.emacs.d/vendor/emacs-nav-49")
(require 'nav)
(nav-disable-overeager-window-splitting)
(global-set-key [f6] 'nav-toggle)

(require 'package)
(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;; (add-to-list 'load-path "~/.emacs.d/slime/")
;; (setq inferior-lisp-program "/opt/local/bin/sbcl")
;; (require 'slime)
;; (slime-setup)


;; (autoload 'js2-mode "js2-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (global-set-key [f5] 'slime-js-reload)
;; (add-hook 'js2-mode-hook
;;            (lambda ()
;;              (slime-js-minor-mode 1)))
;; (load-file "~/.emacs.d/setup-slime-js.el")

;; (eval-after-load 'auto-complete
;; 	'(progn
;; 		 (add-to-list 'ac-modes 'slime-repl-mode)
;; 		 (add-to-list 'ac-modes 'js2-mode)
;; 		 (add-to-list 'ac-modes 'js-mode)
;; 		 (add-hook 'slime-mode-hook 'set-up-slime-ac)
;; 		 (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)))

;; (eval-after-load 'slime
;; 	'(progn
;;       (setq slime-protocol-version 'ignore
;;             slime-net-coding-system 'utf-8-unix
;;             slime-complete-symbol*-fancy t
;;             slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
;;       (slime-setup '(slime-repl slime-js))))

;; (add-hook 'js2-mode-hook 'ac-js2-mode)
;; (setq ac-js2-evaluate-calls t)


;; Just recently disabled
;; (add-to-list 'load-path "~/.emacs.d/tern/emacs/")
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
;; (eval-after-load 'tern
;;    '(progn
;;       (require 'tern-auto-complete)
;;       (tern-ac-setup)))



