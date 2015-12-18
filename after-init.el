;; This file gets run after initialization
(load-user-file "ido-mode.el") ; put this first due to the performance benefits of ido
(load-user-file "remove-default-buffers.el") ; remove the startup buffers
(load-user-file "repositories.el") ; package repos
(load-user-file "neotree.el") ; neotree for file tree view
(load-user-file "dockerfile-mode.el") ; dockerfile-mode
(load-user-file "projectile.el") ; projects for emacs 
(load-user-file "jedi.el") ; python code completion
(load-user-file "flycheck.el"); enable flycheck
(load-user-file "python-mode.el") ; python development features
(load-user-file "salt-states.el") ; salt-states (TODO: Make this do jinja too)
(load-user-file "ibuffer.el") ; enable ibuffers
(load-user-file "windmove.el") ; some windmove defaults
(load-user-file "windmove-hooks.el") ; hack in some windmove hooks
;(load-user-file "hexrgb.el") ; eyedropper dependency. this should not need to be loaded here
(load-user-file "eyedropper.el") ; useful for getting buffer color information
;(load-user-file "workgroups2.el") ; disabled for preference, but can be safely enabled

(load-user-file "custom.el") ; other stuff
