;; neotree
(require 'neotree)

;; customized neotree functions
(defun msg/neotree-change-root ()
  (interactive)
  (message "Change root node")
  (neotree-change-root))

(defun msg/neotree-create ()
  (interactive)
  (message "Create new node")
  (neotree-create))

(defun msg/neotree-delete-node ()
  (interactive)
  (message "Delete node")
  (neotree-delete-node))

(defun msg/neotree-hidden-file-toggle ()
  (interactive)
  (message "Toggle hidden files")
  (neotree-hidden-file-toggle))

(defun msg/neotree-rename-node ()
  (interactive)
  (message "Rename node")
  (neotree-rename-node))

(defun msg/neotree-stretch-toggle ()
  (interactive)
  (message "Toggle neotree strech")
  (neotree-stretch-toggle))

(defun msg/neotree-toggle ()
  (interactive)
  (message "Toggle neotree view")
  (neotree-toggle))

;; neotree keybindings
;; unless marked otherwise these functions must have neotree focused to work
(global-unset-key "\C-t")
(global-set-key (kbd "C-t SPC") 'msg/neotree-change-root)
(global-set-key (kbd "C-t n") 'msg/neotree-create)
(global-set-key (kbd "C-t d") 'msg/neotree-delete-node)
(global-set-key (kbd "C-t C-h") 'msg/neotree-hidden-file-toggle) ; this does not need neotree focused
(global-set-key (kbd "C-t r") 'msg/neotree-rename-node)
(global-set-key (kbd "C-t h") 'msg/neotree-stretch-toggle) ; this does not need neotree focused
(global-set-key (kbd "C-t t") 'msg/neotree-toggle)  ; this does not need neotree focused

;; work with projectile (if not installed this will do nothing)
(setq projectile-switch-project-action 'neotree-projectile-action)
