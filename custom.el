;; Customizations that don't really merit their own file

;; allow 'y' or 'n' in place of 'yes' or 'no' in prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; window splitting
(global-set-key (kbd "C-\"") 'split-window-vertically)
(global-set-key (kbd "C-'") 'split-window-horizontally)

;; window navigation
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; dev layout
(defun generate-dev-layout ()
  (interactive)
  (message "Enabled dev layout")
  (neotree-toggle) ; change this to neotree-show if workgroups2 is enabled
  (other-window 1)
  (split-window-vertically)
  (enlarge-window 5)
  (other-window 1)
  (ansi-term "/bin/bash")
  (other-window -1))
(global-set-key (kbd "C-x g") 'generate-dev-layout)

;; windmove hooks are defined in windmove-hooks.el
;; these will activate themes based on which buffer is active
(defun msg/window-focus-enter()
  (load-theme-buffer-local 'deeper-blue (current-buffer)))

(defun msg/window-focus-leave()
  (load-theme-buffer-local 'sanityinc-solarized-dark (current-buffer)))

(add-hook 'windmove-post-move-hook 'msg/window-focus-enter)
(add-hook 'windmove-pre-move-hook 'msg/window-focus-leave)
