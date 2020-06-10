(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(package-selected-packages
   (quote
    (company-irony flycheck ivy helm auto-yasnippet neotree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Mouse mode
(xterm-mouse-mode 1)

;; Save history
(savehist-mode 1)

;; Neotree on startup
(defun neotree-startup ()
  (interactive)
  (neotree-show)
  (call-interactively 'other-window))

(if (daemonp)
    (add-hook 'server-switch-hook #'neotree-startup)
  (add-hook 'after-init-hook #'neotree-startup)
)

;; Neotree hidden files
(setq-default neo-show-hidden-files t)

(show-paren-mode 1)

;; Ivy
(ivy-mode 1)

(add-hook 'prog-mode-hook 'linum-mode)

(setf company-backends '())
(add-to-list 'company-backends 'company-keywords)
(add-to-list 'company-backends 'company-irony)
(add-to-list 'company-backends 'company-irony-c-headers)
(add-hook 'flycheck-mode-hook 'flycheck-irony-setup)


(global-flycheck-mode)
