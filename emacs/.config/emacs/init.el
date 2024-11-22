(setq inhibit-startup-message t
      auto-save-default nil
      make-backup-files nil
      custom-file "~/.config/emacs/custom.el")

(load custom-file)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(setq scroll-conservatively 9999)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package evil
  :config
  (evil-mode 1))

(set-frame-font "JetBrainsMono NF 18" nil t)
