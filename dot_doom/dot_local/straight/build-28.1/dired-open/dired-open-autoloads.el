;;; dired-open-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:


;;;### (autoloads nil "dired-open" "dired-open.el" (0 0 0 0))
;;; Generated autoloads from dired-open.el

(autoload 'dired-open-file "dired-open" "\
Try `dired-open-functions' to open the thing under point.

That can be either file or any other line of dired listing.

If no function succeeded, run `dired-find-file' normally.

With \\[universal-argument], run `dired-find-file' normally.

\(fn &optional ARG)" t nil)

;;;***

(provide 'dired-open-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; dired-open-autoloads.el ends here
