;; We fiddle with the gc threshold to reduce startup times.
(setq gc-cons-threshold (* 50 1000 1000))

;; Settings
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
		org-mode-hook
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

;;; Initialise org-mode

(defun amber/org-mode-setup ()
  (org-indent-mode)
  (auto-fill-mode 0)
  (visual-line-mode 1))

(use-package org
  :hook (org-mode . amber/org-mode-setup)
  :config
  (setq org-ellipsis " ▼"))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun amber/org-mode-visual-fill ()
  (setq visual-fill-column-width 80
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . amber/org-mode-visual-fill))

(use-package org-roam
  :ensure t
  :init
  (unless (file-directory-p "~/OrgBrain")
    (make-directory "~/OrgBrain"))
  :custom
  (org-roam-directory "~/OrgBrain")
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))

;; Embarrasing confession - I actually really like the obsidian graph mode and I
;; was genuinely worried about missing it when switching over to
;; org-mode/org-... ect ect.
(use-package org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync t
	org-roam-ui-follow t
	org-roam-ui-update-on-save t
	org-roam-ui-open-on-start t))

;;; ;;; Initialise terminal modeds ;;; ;;;

;;; Initiialise term
(use-package term
  :config
  (setq explicit-shell-file-name "bash"))

;;; Initialise vterm
(use-package vterm
  :commands vterm
  :config
  (setq vterm-max-scrollback 10000))

(global-set-key (kbd "C-c C-v") 'vterm)

;; We return the GC settings to something more sensible.
(setq gc-cons-threshold (* 2 1000 1000))
