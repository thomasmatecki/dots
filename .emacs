(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-blue)))
 '(custom-safe-themes
   (quote
    ("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" default)))
 '(package-selected-packages
   (quote
    (helm company paredit git-gutter git-messenger geiser color-theme-sanityinc-tomorrow rainbow-delimiters evil borland-blue-theme))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(require 'color-theme-sanityinc-tomorrow)
(evil-mode 1)
(global-linum-mode t) 

(rainbow-delimiters-mode t)

;; Navigate between panes like vim
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-k") 'windmove-up)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
;; Remap from set-fill-column
(global-set-key (kbd "C-x f") 'recentf-open-files)

(setq load-path (cons "/usr/local/share/mdk" load-path))
(autoload 'mixal-mode "mixal-mode" t)
(add-to-list 'auto-mode-alist '("\\.mixal\\'" . mixal-mode))
(autoload 'mixvm "mixvm" "mixvm/gud interaction" t)

;; to workaround https://savannah.gnu.org/bugs/index.php?55877
(define-obsolete-function-alias 'string-to-int 'string-to-number "22.1")
