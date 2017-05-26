;;;
;;; MODES FOR EMACS
;;;

;;; Ruby
; Apply Ruby mode to Rakefile files
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec" . ruby-mode))

;;; Treetop
(require 'treetop)
;(add-to-list 'interpreter-mode-alist '("treetop" . treetop-mode))
(add-to-list 'auto-mode-alist '("\\.treetop$" . treetop-mode))

;;; Octave - similar at Matlab
;;; http://sunsite.univie.ac.at/textbooks/octave/octave_34.html
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

;;; Cobol
(require 'cobol-mode)
(add-to-list 'auto-mode-alist '("\\.cob" . cobol-mode))
(add-to-list 'auto-mode-alist '("\\.cbl" . cobol-mode))

;;; Aspectj
(add-to-list 'load-path "~/.emacs.d/aspectj-mode")
(require 'aspectj-mode)

;;; Text
;;; Make Text mode the default mode for new buffers.
(setq-default major-mode 'text-mode)
