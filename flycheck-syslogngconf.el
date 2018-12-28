;;; flycheck-syslogngconf.el --- flycheck module for syslog-ng configuration file

;; Author: Antal Nemes
;; Version: 0.0.1
;; Package-version: 20181228

;;; Commentary:
;; syslog-ng config syntax checker module
;; To override executable, you can use
;;   (set-variable 'flycheck-syslogngconf-executable "<path to executable>")

;;; Code:

(require 'flycheck)

(flycheck-define-checker syslogngconf
  "A syslog-ng config syntax checker using the syslog-ng binary.

  See URL `https://syslog-ng.org/'."
  :command ("syslog-ng" "-s" "-f" source)
  :error-patterns
  ((error line-start (message) " in " (file-name) ":"
          line ":" (one-or-more digit) "-" (one-or-more digit) ":" (one-or-more digit) ":" line-end)
   (error line-start (message) " from " (file-name) ":"
          line ":" (one-or-more digit) "-" (one-or-more digit) ":" (one-or-more digit) ":" line-end))
  :modes (conf-space-mode conf-unix-mode))

(add-to-list 'flycheck-checkers 'syslogngconf t)

(provide 'flycheck-syslogngconf)
;;; flycheck-syslogngconf.el ends here
