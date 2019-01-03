;;; flycheck-syslogngconf.el --- flycheck module for syslog-ng configuration file

;; Author: Antal Nemes
;; Package-Requires: ((flycheck) (syslogngconf-mode))
;; Version: 0.0.1
;; Package-version: 20190103

;;; Commentary:
;; syslog-ng config syntax checker module
;; To override executable, you can use
;;   (set-variable 'flycheck-syslogngconf-executable "<path to executable>")

;;; Code:

(require 'flycheck)
(require 'syslogngconf-mode)

(flycheck-define-checker syslogngconf
  "A syslog-ng config syntax checker using the syslog-ng binary.

  See URL `https://syslog-ng.org/'."
  :command ("syslog-ng" "-s" "-f" source)
  :error-patterns
  ((error line-start (message) " in " (file-name) ":"
          line ":" (one-or-more digit) "-" (one-or-more digit) ":" (one-or-more digit) ":" line-end)
   (error line-start (message) " from " (file-name) ":"
          line ":" (one-or-more digit) "-" (one-or-more digit) ":" (one-or-more digit) ":" line-end))
  :modes (syslogngconf-mode))

(add-to-list 'flycheck-checkers 'syslogngconf t)

(provide 'flycheck-syslogngconf)
;;; flycheck-syslogngconf.el ends here
