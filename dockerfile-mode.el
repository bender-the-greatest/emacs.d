;; Dockerfile-mode
;; change the load-path to wherever you cloned dockerfile-mode
(add-to-list 'load-path "~/src/opensource/emacs-modes/dockerfile-mode/")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
