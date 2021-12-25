;;======================================================================
;; Configuration file to Emacs (>=25.2.2) by Vinicius Riffel.
;;
;; This file is hosted at https://github.com/vriffel/emacs.
;;
;; Almost all the content available here was obtained/inspired by
;; Walmes Zeviani's Emacs settings. (https://github.com/walmes). Please,
;; send questions, problems and/or suggestions as an issue on GitHub
;; project of this file.
;;======================================================================

;; Load Fernando Mayer's functions (see https://github.com/fernandomayer)
(load "~/.emacs.d/lisp/funcs.el")

(setq byte-compile-warnings '(cl-functions))

;; Fix bug see https://emacs.stackexchange.com/questions/52171/trying-to-install-auctex-via-package-install
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Intialize fullscreen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(tool-bar-mode 0)                   ;; Remove tool bar
(menu-bar-mode 0)                   ;; Remove menu bar
(scroll-bar-mode -1)                ;; Remove scroll bar
(global-hl-line-mode 1)             ;; Highlight the cursor line.
(visual-line-mode 1)                ;; Screen lines, not logical lines.
(show-paren-mode 1)                 ;; Highlight matching pairs.
(delete-selection-mode 1)           ;; Allows delete region.
(setq column-number-mode t)         ;; Show cursor position.
(setq auto-save-default nil)        ;; Turn off #autosave#.
(setq make-backup-files nil)        ;; Turn off backup~.
(setq comment-empty-lines t)        ;; Comment even in empty lines.
(setq x-select-enable-clipboard t)  ;; Allow shared transfer area.
(setq-default indent-tabs-mode nil) ;; Spaces to indent.
(setq-default fill-column 80)       ;; Column width.

;; Highlight whitespace.
(setq whitespace-line-column fill-column)
(setq whitespace-style
      '(face lines-tail trailing tabs empty))
(global-whitespace-mode +1)

;; Adds font
;; (cond
;;  ((find-font (font-spec :name "Inconsolata"))
;;   (set-default-font "Inconsolata-14"))
;;  ((find-font (font-spec :name "Noto Sans Mono"))
;;   (set-default-font "Noto Sans Mono-14"))
;;  (t
;;   (set-default-font "Ubuntu Mono-14")))

;; (set-default-font "Noto Sans Mono")
;; (set-default-font "Inconsolata")
;; (set-frame-font "Ubuntu Mono-14")
(set-frame-font "Inconsolata 12" nil t)

;; Adds IDO and smex
(ido-mode t)
;(global-set-key (kbd "M-x") 'smex)

;; C-page down e C-page up to move along buffers.
(global-set-key (kbd "C-<next>") 'next-buffer)
(global-set-key (kbd "C-<prior>") 'previous-buffer)

;; C-z to 'undo, the default is C-/.
(global-unset-key "\C-z")
(global-set-key "\C-z" 'undo)

;; M-. to (un)comment paragraph.
(global-set-key [?\M-.] (kbd "M-h M-; M-}"))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/") t))

(package-initialize)

(require 'polymode)
(require 'poly-markdown)
(require 'poly-R)
(require 'ess)
(require 'ess-site)
(require 'ess-view)
(require 'smartparens)
(require 'smartparens-config)
(require 'company)

(smartparens-global-mode 1)
(sp-pair "\"" nil :unless '(sp-point-after-word-p))
(sp-pair "'" nil :unless '(sp-point-after-word-p))
(sp-local-pair '(ess-mode) "(" nil :unless '(sp-point-before-word-p))
(sp-local-pair '(ess-mode) "[" nil :unless '(sp-point-before-word-p))
(sp-local-pair '(ess-mode) "{" nil :unless '(sp-point-before-word-p))

(setq ess-R-font-lock-keywords
      '((ess-R-fl-keyword:modifiers . t)
        (ess-R-fl-keyword:fun-defs . t)
        (ess-R-fl-keyword:keywords . t)
        (ess-R-fl-keyword:assign-ops . t)
        (ess-R-fl-keyword:constants . t)
        (ess-fl-keyword:fun-calls . t)
        (ess-fl-keyword:numbers . t)
        (ess-fl-keyword:operators . t)
        (ess-fl-keyword:delimiters . t)
        (ess-fl-keyword:= . t)
        (ess-R-fl-keyword:F&T . t)))
(setq inferior-R-font-lock-keywords
      '((ess-S-fl-keyword:prompt . t)
        (ess-R-fl-keyword:messages . t)
        (ess-R-fl-keyword:modifiers . t)
        (ess-R-fl-keyword:fun-defs . t)
        (ess-R-fl-keyword:keywords . t)
        (ess-R-fl-keyword:assign-ops . t)
        (ess-R-fl-keyword:constants . t)
        (ess-fl-keyword:matrix-labels . t)
        (ess-fl-keyword:fun-calls . t)
        (ess-fl-keyword:numbers . t)
        (ess-fl-keyword:operators . t)
        (ess-fl-keyword:delimiters . t)
        (ess-fl-keyword:= . t)
        (ess-R-fl-keyword:F&T . t)))

(add-hook
 'ess-mode-hook
 (lambda()
   ;;-------------------------------------
   (ess-toggle-underscore nil)
   (define-key ess-mode-map [?\M--]
     'ess-cycle-assign) ;; `Alt + -'  to cycle `<- | <<- | = ...'.
   ;;-------------------------------------
   (company-mode 1)                               ;; (company-mode -1)
   (ess-smart-equals-mode -1)
   ;;-------------------------------------
   (define-key ess-mode-map [f5] 'company-R-args) ;; F5 do show ARGS.
   (setq-local comment-add 1)                     ;; Double ## as default.
   (setq ess-smart-operators t)                   ;; Smart comma.
   ;; (setq ess-indent-with-fancy-comments nil)      ;; No indent levels.
   ;; (setq ess-smart-equals-no-space t)
   (setq comint-scroll-to-bottom-on-input t)
   (setq comint-scroll-to-bottom-on-output t)
   (setq comint-move-point-for-output t)))

(load-theme 'darktooth t)
