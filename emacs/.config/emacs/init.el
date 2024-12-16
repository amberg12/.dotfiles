(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(set-frame-font "JetBrainsMono Nerd Font Mono 22" nil t)

(column-number-mode 1)
(global-display-line-numbers-mode 1)
;; Some modes should not have line numbers.
(dolist (mode '(term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;;; Move custom to different location on system
(setq custom-file "~/.config/emacs/custom-file.el")
(load-file custom-file)

;;; Prevent emacs from cluttering other places with it's own files
(setq auto-save-default nil)

;;; Initialise package system
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Portability fix since not all platforms will have use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Configure ivy & swiper
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-n" . ivy-next-line)
	 ("C-p" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-n" . ivy-next-line)
	 ("C-p" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-done)
	 :map ivy-reverse-i-search-map
	 ("C-n" . ivy-next-line)
	 ("C-p" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package swiper
  :ensure t)

;;; Configure which-key
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  ;; The delay should be increased as I get more comfortable with emacs, and
  ;; being able to explore becomes less important.
  (setq which-key-idle-delay 0.3))

;;; Configure counsel
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-c b" . counsel-ibuffer)
	 ("C-c C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil))

;;; Configure projectile
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Projects")
    (setq projectile-project-search-path '("~/Projects")))
  (when (file-directory-p "~/Cardiff") ; University files
    (setq projectile-project-search-path '("~/Cardiff")))
  (setq projectile-switch-project-action #'projectile-dired))

;; counsel-projectile integration
(use-package counsel-projectile
  :config (counsel-projectile-mode))

;;; Initialise magit
(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;;; Add C style config
;; Shamelessly stolen from https://devkernel.io/posts/kernel-dev-setup-editor/#linux-kernel-coding-style
(defun linux-kernel-coding-style/c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
   (column (c-langelem-2nd-pos c-syntactic-element))
   (offset (- (1+ column) anchor))
   (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

;; Add Linux kernel style
(add-hook 'c-mode-common-hook
    (lambda ()
      (c-add-style "linux-kernel"
       '("linux" (c-offsets-alist
            (arglist-cont-nonempty
             c-lineup-gcc-asm-reg
             linux-kernel-coding-style/c-lineup-arglist-tabs-only))))))

(defun linux-kernel-coding-style/setup ()
  (let ((filename (buffer-file-name)))
    ;; Enable kernel mode for the appropriate files
    (when (and buffer-file-name
               ( or (string-match "linux" buffer-file-name)
                    (string-match "liburing" buffer-file-name)))
                    ;; (string-match "xfstests" buffer-file-name)))
      (setq indent-tabs-mode t)
      (setq tab-width 8)
      (setq c-basic-offset 8)
      (c-set-style "linux-kernel"))))

(add-hook 'c-mode-hook 'linux-kernel-coding-style/setup)
