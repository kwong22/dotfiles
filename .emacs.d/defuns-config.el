;; --------------------
;; -- Global defuns ---
;; --------------------
(defun whitespace-cleanup-all ()
  (interactive)
  (setq indent-tab-mode nil)
  (whitespace-cleanup))

(defun whitespace-clean-and-compile ()
  "Cleans up whitespace and compiles. The compile-command is a
varies with the active mode."
  (interactive)
  (whitespace-cleanup-all)
  (compile compile-command))
