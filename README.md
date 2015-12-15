MetalSearGolid's Emacs Configuration
====================================

I made this for myself but decided to share the configuration for anyone who may want it. At some point I will probably put a cheat sheet up here if I ever get around to making one.

Required Plugins
---------------------------
Please note that as of Emacs 24.3 some of these plugins may be built into Emacs.

* ido-mode
* dockerfile-mode
* projectile
* jedi
* python-mode dot el
* yaml-mode
* ibuffer
* windmove
* eyedropper
* workspaces2

What Does This Configuration Do?
--------------------------------
It configures devlopment modes as well as takes advantage of several enhancement plugins. I also added in some enhanced features and created a shortcut for creating a development view with a main buffer, ready terminal shell, and file browsing on the side. There are also some minor customizations by me as well.

Who Might This Be Useful For?
---------------------------------
For my use case I have this specialized for Python, Docker and Salt-Stack. If you want language specific constructs removed, you can enable only the layout and enhancements by making sure ``after-init.el`` doesn't source ``dockerfile-mode.el``, ``salt-stack.el``, ``jedi.el``, or ``python-mode.el``.
