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
