(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-by-copying t)
 '(custom-safe-themes
   (quote
    ("4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" default)))
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(package-selected-packages
   (quote
    (flycheck-rust toml-mode ac-html cyberpunk-theme paredit smart-tabs-mode zenburn-theme yasnippet solarized-theme smooth-scrolling rainbow-delimiters multiple-cursors markdown-mode flycheck coffee-mode auto-complete 2048-game clojure-mode cider))))


;; Graeme custom options
;; Only disable toolbar in graphic mode
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)))




(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(setq my-package-list
      '(2048-game
	auto-complete
	coffee-mode
	dash
	multiple-cursors
	solarized-theme
	yasnippet
	zenburn-theme
	rainbow-delimiters
	smooth-scrolling
	markdown-mode
	flycheck
	smart-tabs-mode
    birds-of-paradise-plus-theme
	clojure-mode
	cider
    cyberpunk-theme))

(defun mygetpackages ()
  "Downloads all packages from my-package-list if any are missing."
  (interactive)
  (mapc (lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
	my-package-list))


;; (load-theme 'birds-of-paradise-plus t)
;; (load-theme 'tango-dark t)
(add-hook 'after-init-hook (lambda () (load-theme 'cyberpunk t)))
(ac-config-default)
(yas-global-mode 1)
 (show-paren-mode 1)
(setq coffee-tab-width 2)
(setq c-default-style "linux")
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode nil)
(setq column-number-mode t)

;;(electric-indent-mode -1)

;; Mode hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

;; Key commands
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
