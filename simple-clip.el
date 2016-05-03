;; better access to the system clipboard
(require 'simpleclip)

(unless (display-graphic-p)
  (simpleclip-mode 1)
  (global-set-key (kbd "C-w") 'simpleclip-cut)
  (global-set-key (kbd "C-y") 'simpleclip-paste)
  (global-set-key (kbd "M-w") 'simpleclip-copy))
