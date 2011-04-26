(setq dependencies
     '(behavior bindings buffer bytecompile display identity javascript
       python))

(setq hostname-components (split-string (system-name) "\\."))
(setq google-found nil)
(while hostname-components
  (setq momentary (car hostname-components))
  (print momentary)
  (setq hostname-components (cdr hostname-components))
  (if (string= momentary "google") (setq google-found t)))


(defun load-google-stuffs
  ()
  "Load Google items."
  (message "Loading Google Stuffs.")
  (push 'google dependencies))

(if google-found
    (load-google-stuffs))

(mapcar
 (lambda (x)
   (setq file (format "~/.emacs.d/personal/%s.el" x))
   (load-file file))
 dependencies)

(setq requires
      '(bookmark desktop))

(mapcar
 (lambda (x)
   (require x))
 requires)

(provide 'personal)
