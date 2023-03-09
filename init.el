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
  :config 
  (load-theme 'dracula t))

;; vertico
(use-package vertico
  :ensure t
  :config 
  (vertico-mode))

;; marginalia
(use-package marginalia
  :ensure t
  :config 
  (marginalia-mode))

;; which key
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; company
(use-package company
  :ensure t
  :hook ((emacs-lisp-mode . (lambda ()
			      (setq-local company-backends '(company-elisp))))
	 (emacs-lisp-mode . company-mode))
  :config
  (company-keymap--unbind-quick-access company-active-map)
  (company-tng-configure-default)
  (setq company-idle-delay 0.1
	company-minimum-prefix-length 1))

;; --------------
;; LSP Settings
;; --------------

;; lsp mode
(use-package lsp-mode
  :ensure t
  :config
  (lsp-enable-which-key-integration t))

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Go mode
(use-package go-mode
  :ensure t
  :hook ((go-mode . lsp-deferred)
	 (go-mode . company-mode))
  :config
  (require 'lsp-go)
  (setq lsp-go-analyses
	'((fieldalignment . t)
	  (nilness . t)
	  (unusedwrite . t)
	  (unusedparams . t))))

;; ----------------------------------------
;; END Line
;; ----------------------------------------
