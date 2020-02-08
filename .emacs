;;Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq c-default-style "bsd"
      c-basic-offset 8
      tab-width 8
      indent-tabs-mode t)
(require 'whitespace)

(load "~/.emacs.d/private/Betty/betty-style")
(add-to-list 'flycheck-checkers 'betty-style)
(setq flycheck-gcc-pedantic t)
  (setq flycheck-gcc-warnings '("all" "extra" "error"))

(setq whitespace-style '(face empty lines-tail trailing))
(global-whitespace-mode t)

(setq column-number-mode t)

(require 'no-littering)

(add-hook 'prog-mode-hook 'linum-mode)
(setf company-backends '())
(add-to-list 'company-backends 'company-keywords)
(add-to-list 'company-backends 'company-irony)
(add-to-list 'company-backends 'company-irony-c-headers)
(add-hook 'flycheck-mode-hook 'flycheck-irony-setup)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-safe-themes
   (quote
    ("b6ed216e578e673399a6086666accf1d2c2100269446c009405c4415af0c8c9c" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" default)))
 '(package-selected-packages
   (quote
    (dashboard magit emmet-mode no-littering markdown-mode multiple-cursors benchmark-init flycheck-rtags yasnippet-snippets treemacs srefactor sequences rtags neotree multi-term kaolin-themes ivy helm-c-yasnippet google-c-style git-gutter+ flymake-easy flycheck-pkg-config flycheck-irony flycheck-color-mode-line el-autoyas company-ycm company-irony-c-headers company-ghc company-fuzzy company-c-headers c0-mode auto-complete-clang anzu all-the-icons ac-helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-auto-complete-mode t)

(add-to-list 'load-path
	     "~/path-to-yasnippet")
(require 'yasnippet)
   (yas-global-mode 1)

(xterm-mouse-mode 1)

;; Or if you have use-package installed

(rtags-enable-standard-keybindings)
(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(defun company-rtags-setup ()
  "Configure company-backends for company-rtags."
  (delete 'company-semantic company-backends)
  (setq rtags-completions-enabled t)
  (push '(company-rtags :with company-yasnippet) company-backends))


(add-hook 'c++-mode-hook 'flycheck-rtags-setup)
(add-hook 'c-mode-hook 'flycheck-rtags-setup)

;;(defun flycheck-list-errors-only-when-errors ()
  ;(if flycheck-current-errors
   ;   (flycheck-list-errors)
					;(-when-let (buffer (get-buffer flycheck-error-list-buffer))
     ; (dolist (window (get-buffer-window-list buffer))
;	(quit-window nil window)))))

(add-hook 'before-save-hook #'flycheck-list-errors-only-when-errors)

(add-hook 'after-init-hook #'global-flycheck-mode)

(defun neotree-startup ()
  (interactive)
  (neotree-show)
  (call-interactively 'other-window))

(if (daemonp)
    (add-hook 'server-switch-hook #'neotree-startup)
  (add-hook 'after-init-hook #'neotree-startup)
  )

(setq-default neo-show-hidden-files t)

(savehist-mode 1)

(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))

(show-paren-mode 1)

(setq load-path (cons "~/Build/Emacs/org-mode/lisp" load-path))
(setq load-path (cons "~/Build/Emacs/org-mode/contrib/lisp"
		      load-path))

(require 'org-install)

(global-set-key (kbd "C-c m c") 'mc/edit-lines)


(add-to-list 'load-path "/path/to/autopair") ;; comment if autopair.el is in standard load path
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

(setq electric-pair-preserve-balance nil)

;;;.emacs ends here
