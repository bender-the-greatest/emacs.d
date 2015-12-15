;; Salt-State Syntax Highlighting
;; Treat .sls as yaml
;; TODO: Make this highlight the jinja too (maybe modify yaml-mode for this?)
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.sls\\'" . yaml-mode))
