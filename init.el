;; -------------
;; Basic Config
;; -------------

;; turn off startup message
(setq inhibit-startup-message t)

;; turn off tool bar
(tool-bar-mode -1)

;; turn off scroll bar
(scroll-bar-mode -1)

;; turn off menu bar
(menu-bar-mode -1)

;; change cursor
(blink-cursor-mode -1)

;; linum mode
(global-linum-mode 1)

;; turn off backup file
(setq make-backup-files nil)

;; turn on delete selection
(delete-selection-mode 1)

;; turn on hl-mode
(global-hl-line-mode 1)

;; turn off auto save
(setq auto-save-default nil)

;; turn off bell ring
(setq ring-bell-function 'ignore)

;; set font
(set-frame-font "MV Boli 12" nil t)

;; -----------------------
;; Package Management
;; -----------------------

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; use package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; load theme
(use-package dracula-theme
  :ensure t
  :config (load-theme 'dracula t))


;; ----------------------------------------
;; END Line
;; ----------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
