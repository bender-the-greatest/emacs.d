;; Sorcery to add hooks to windmove
(require 'windmove)

(defcustom windmove-pre-move-hook nil
    "Hook run before windmove select is triggered."
    :group 'windmove
    :type 'hook)

(defcustom windmove-post-move-hook nil
  "Hook run after windmove select is triggered."
  :group 'windmove
  :type 'hook)

; Override the window select function to add before and after hooks.
(defadvice windmove-do-window-select (around my-windmove-do-window-select act)
  (run-hooks 'windmove-pre-move-hook)
  ad-do-it
  (run-hooks 'windmove-post-move-hook))
