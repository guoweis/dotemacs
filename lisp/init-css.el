;;─────────────────────────────────────────────────────────────────────────────
;; Configure Emacs for CSS buffers
;;─────────────────────────────────────────────────────────────────────────────


;; Built-in
(use-package css-mode
  :init
  (setq css-indent-offset 2))


;; https://github.com/antonj/scss-mode/
(use-package scss-mode
  :ensure t
  :init
  (setq scss-compile-at-save nil)
  (add-to-list 'auto-mode-alist '("\\.css\\'" . scss-mode))
  (add-to-list 'auto-mode-alist '("\\.less\\'" . scss-mode))
  (add-to-list 'auto-mode-alist '("\\.sass\\'" . scss-mode))
  (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode)))


;;─────────────────────────────────────────────────────────────────────────────
;; End init-css.el
;;─────────────────────────────────────────────────────────────────────────────


(provide 'init-css)
