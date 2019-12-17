;;;
;;; MODES FOR EMACS
;;;

;;; Ruby
; Apply Ruby mode to Rakefile files
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec" . ruby-mode))

;;; Text
;;; Make Text mode the default mode for new buffers.
(setq-default major-mode 'text-mode)
