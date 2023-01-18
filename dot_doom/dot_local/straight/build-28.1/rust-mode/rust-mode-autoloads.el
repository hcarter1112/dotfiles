;;; rust-mode-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:


;;;### (autoloads nil "rust-mode" "rust-mode.el" (0 0 0 0))
;;; Generated autoloads from rust-mode.el

(autoload 'rust-mode "rust-mode" "\
Major mode for Rust code.

\\{rust-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;;;***

;;;### (autoloads nil "rust-utils" "rust-utils.el" (0 0 0 0))
;;; Generated autoloads from rust-utils.el

(autoload 'rust-dbg-wrap-or-unwrap "rust-utils" "\
Either remove or add the dbg! macro." t nil)

;;;***

;;;### (autoloads nil nil ("rust-cargo.el" "rust-compile.el" "rust-playpen.el"
;;;;;;  "rust-rustfmt.el") (0 0 0 0))

;;;***

(provide 'rust-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; rust-mode-autoloads.el ends here
