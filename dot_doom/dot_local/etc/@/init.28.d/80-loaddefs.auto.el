(defvar doom-real-buffer-functions '(doom-dired-buffer-p) "A list of predicate functions run to determine if a buffer is real, unlike
`doom-unreal-buffer-functions'. They are passed one argument: the buffer to be
tested.

Should any of its function returns non-nil, the rest of the functions are
ignored and the buffer is considered real.

See `doom-real-buffer-p' for more information.")(defvar doom-unreal-buffer-functions '(minibufferp doom-special-buffer-p doom-non-file-visiting-buffer-p) "A list of predicate functions run to determine if a buffer is *not* real,
unlike `doom-real-buffer-functions'. They are passed one argument: the buffer to
be tested.

Should any of these functions return non-nil, the rest of the functions are
ignored and the buffer is considered unreal.

See `doom-real-buffer-p' for more information.")(defvar-local doom-real-buffer-p nil "If non-nil, this buffer should be considered real no matter what. See
`doom-real-buffer-p' for more information.")(defvar doom-fallback-buffer-name "*scratch*" "The name of the buffer to fall back to if no other buffers exist (will create
it if it doesn't exist).")(autoload 'doom-buffer-frame-predicate "~/.doom/lisp/lib/buffers" "To be used as the default frame buffer-predicate parameter. Returns nil if
BUF should be skipped over by functions like `next-buffer' and `other-buffer'.

(fn BUF)" nil nil)(autoload 'doom-fallback-buffer "~/.doom/lisp/lib/buffers" "Returns the fallback buffer, creating it if necessary. By default this is the
scratch buffer. See `doom-fallback-buffer-name' to change this." nil nil)(defalias 'doom-buffer-list #'buffer-list)(autoload 'doom-project-buffer-list "~/.doom/lisp/lib/buffers" "Return a list of buffers belonging to the specified PROJECT.

If PROJECT is nil, default to the current project.

If no project is active, return all buffers.

(fn &optional PROJECT)" nil nil)(autoload 'doom-open-projects "~/.doom/lisp/lib/buffers" "Return a list of projects with open buffers." nil nil)(autoload 'doom-dired-buffer-p "~/.doom/lisp/lib/buffers" "Returns non-nil if BUF is a dired buffer.

(fn BUF)" nil nil)(autoload 'doom-special-buffer-p "~/.doom/lisp/lib/buffers" "Returns non-nil if BUF's name starts and ends with an *.

(fn BUF)" nil nil)(autoload 'doom-temp-buffer-p "~/.doom/lisp/lib/buffers" "Returns non-nil if BUF is temporary.

(fn BUF)" nil nil)(autoload 'doom-visible-buffer-p "~/.doom/lisp/lib/buffers" "Return non-nil if BUF is visible.

(fn BUF)" nil nil)(autoload 'doom-buried-buffer-p "~/.doom/lisp/lib/buffers" "Return non-nil if BUF is not visible.

(fn BUF)" nil nil)(autoload 'doom-non-file-visiting-buffer-p "~/.doom/lisp/lib/buffers" "Returns non-nil if BUF does not have a value for `buffer-file-name'.

(fn BUF)" nil nil)(autoload 'doom-real-buffer-list "~/.doom/lisp/lib/buffers" "Return a list of buffers that satisfy `doom-real-buffer-p'.

(fn &optional BUFFER-LIST)" nil nil)(autoload 'doom-real-buffer-p "~/.doom/lisp/lib/buffers" "Returns t if BUFFER-OR-NAME is a 'real' buffer.

A real buffer is a useful buffer; a first class citizen in Doom. Real ones
should get special treatment, because we will be spending most of our time in
them. Unreal ones should be low-profile and easy to cast aside, so we can focus
on real ones.

The exact criteria for a real buffer is:

  1. A non-nil value for the buffer-local value of the `doom-real-buffer-p'
     variable OR
  2. Any function in `doom-real-buffer-functions' returns non-nil OR
  3. None of the functions in `doom-unreal-buffer-functions' must return
     non-nil.

If BUFFER-OR-NAME is omitted or nil, the current buffer is tested.

(fn BUFFER-OR-NAME)" nil nil)(autoload 'doom-unreal-buffer-p "~/.doom/lisp/lib/buffers" "Return t if BUFFER-OR-NAME is an 'unreal' buffer.

See `doom-real-buffer-p' for details on what that means.

(fn BUFFER-OR-NAME)" nil nil)(autoload 'doom-buffers-in-mode "~/.doom/lisp/lib/buffers" "Return a list of buffers whose `major-mode' is `eq' to MODE(S).

If DERIVED-P, test with `derived-mode-p', otherwise use `eq'.

(fn MODES &optional BUFFER-LIST DERIVED-P)" nil nil)(autoload 'doom-visible-windows "~/.doom/lisp/lib/buffers" "Return a list of the visible, non-popup (dedicated) windows.

(fn &optional WINDOW-LIST)" nil nil)(autoload 'doom-visible-buffers "~/.doom/lisp/lib/buffers" "Return a list of visible buffers (i.e. not buried).

(fn &optional BUFFER-LIST)" nil nil)(autoload 'doom-buried-buffers "~/.doom/lisp/lib/buffers" "Get a list of buffers that are buried.

(fn &optional BUFFER-LIST)" nil nil)(autoload 'doom-matching-buffers "~/.doom/lisp/lib/buffers" "Get a list of all buffers that match the regex PATTERN.

(fn PATTERN &optional BUFFER-LIST)" nil nil)(autoload 'doom-set-buffer-real "~/.doom/lisp/lib/buffers" "Forcibly mark BUFFER as FLAG (non-nil = real).

See `doom-real-buffer-p' for an explanation for real buffers.

(fn BUFFER FLAG)" nil nil)(autoload 'doom-kill-buffer-and-windows "~/.doom/lisp/lib/buffers" "Kill the buffer and delete all the windows it's displayed in.

(fn BUFFER)" nil nil)(autoload 'doom-fixup-windows "~/.doom/lisp/lib/buffers" "Ensure that each of WINDOWS is showing a real buffer or the fallback buffer.

(fn WINDOWS)" nil nil)(autoload 'doom-kill-buffer-fixup-windows "~/.doom/lisp/lib/buffers" "Kill the BUFFER and ensure all the windows it was displayed in have switched
to a real buffer or the fallback buffer.

(fn BUFFER)" nil nil)(autoload 'doom-kill-buffers-fixup-windows "~/.doom/lisp/lib/buffers" "Kill the BUFFERS and ensure all the windows they were displayed in have
switched to a real buffer or the fallback buffer.

(fn BUFFERS)" nil nil)(autoload 'doom-kill-matching-buffers "~/.doom/lisp/lib/buffers" "Kill all buffers (in current workspace OR in BUFFER-LIST) that match the
regex PATTERN. Returns the number of killed buffers.

(fn PATTERN &optional BUFFER-LIST)" nil nil)(autoload 'doom-mark-buffer-as-real-h "~/.doom/lisp/lib/buffers" "Hook function that marks the current buffer as real.

See `doom-real-buffer-p' for an explanation for real buffers." nil nil)(autoload 'doom/save-and-kill-buffer "~/.doom/lisp/lib/buffers" "Save the current buffer to file, then kill it." t nil)(autoload 'doom/kill-this-buffer-in-all-windows "~/.doom/lisp/lib/buffers" "Kill BUFFER globally and ensure all windows previously showing this buffer
have switched to a real buffer or the fallback buffer.

If DONT-SAVE, don't prompt to save modified buffers (discarding their changes).

(fn BUFFER &optional DONT-SAVE)" t nil)(autoload 'doom/kill-all-buffers "~/.doom/lisp/lib/buffers" "Kill all buffers and closes their windows.

If the prefix arg is passed, doesn't close windows and only kill buffers that
belong to the current project.

(fn &optional BUFFER-LIST INTERACTIVE)" t nil)(autoload 'doom/kill-other-buffers "~/.doom/lisp/lib/buffers" "Kill all other buffers (besides the current one).

If the prefix arg is passed, kill only buffers that belong to the current
project.

(fn &optional BUFFER-LIST INTERACTIVE)" t nil)(autoload 'doom/kill-matching-buffers "~/.doom/lisp/lib/buffers" "Kill buffers that match PATTERN in BUFFER-LIST.

If the prefix arg is passed, only kill matching buffers in the current project.

(fn PATTERN &optional BUFFER-LIST INTERACTIVE)" t nil)(autoload 'doom/kill-buried-buffers "~/.doom/lisp/lib/buffers" "Kill buffers that are buried.

If PROJECT-P (universal argument), only kill buried buffers belonging to the
current project.

(fn &optional BUFFER-LIST INTERACTIVE)" t nil)(autoload 'doom/kill-project-buffers "~/.doom/lisp/lib/buffers" "Kill buffers for the specified PROJECT.

(fn PROJECT &optional INTERACTIVE)" t nil)(defvar doom-after-reload-hook nil "A list of hooks to run after `doom/reload' has reloaded Doom.")(defvar doom-before-reload-hook nil "A list of hooks to run before `doom/reload' has reloaded Doom.")(autoload 'doom/open-private-config "~/.doom/lisp/lib/config" "Browse your `doom-user-dir'." t nil)(autoload 'doom/find-file-in-private-config "~/.doom/lisp/lib/config" "Search for a file in `doom-user-dir'." t nil)(autoload 'doom/goto-private-init-file "~/.doom/lisp/lib/config" "Open your private init.el file.
And jumps to your `doom!' block." t nil)(autoload 'doom/goto-private-config-file "~/.doom/lisp/lib/config" "Open your private config.el file." t nil)(autoload 'doom/goto-private-packages-file "~/.doom/lisp/lib/config" "Open your private packages.el file." t nil)(autoload 'doom/reload "~/.doom/lisp/lib/config" "Reloads your private config.

This is experimental! It will try to do as `bin/doom sync' does, but from within
this Emacs session. i.e. it reload autoloads files (if necessary), reloads your
package list, and lastly, reloads your private config.el.

Runs `doom-after-reload-hook' afterwards." t nil)(autoload 'doom/reload-autoloads "~/.doom/lisp/lib/config" "Reload only the autoloads of the current profile.

This is much faster and safer than `doom/reload', but not as comprehensive. This
reloads your package and module visibility, but does not install new packages or
remove orphaned ones. It also doesn't reload your private config.

It is useful to only pull in changes performed by 'doom sync' on the command
line." t nil)(autoload 'doom/reload-env "~/.doom/lisp/lib/config" "Reloads your envvar file.

DOES NOT REGENERATE IT. You must run 'doom env' in your shell OUTSIDE of Emacs.
Doing so from within Emacs will taint your shell environment.

An envvar file contains a snapshot of your shell environment, which can be
imported into Emacs." t nil)(autoload 'doom/upgrade "~/.doom/lisp/lib/config" "Run 'doom upgrade' then prompt to restart Emacs." t nil)(defvar doom-debug-variables `((doom-print-minimum-level . debug) (doom-inhibit-log) async-debug debug-on-error gcmh-verbose init-file-debug jka-compr-verbose (message-log-max . 16384) (native-comp-async-report-warnings-errors . silent) (native-comp-warning-on-missing-source . t) url-debug use-package-verbose (warning-suppress-types)) "A list of variable to toggle on `doom-debug-mode'.

Each entry can be a variable symbol or a cons cell whose CAR is the variable
symbol and CDR is the value to set it to when `doom-debug-mode' is activated.")(defvar doom-debug-mode nil "Non-nil if Doom-Debug mode is enabled.
See the `doom-debug-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `doom-debug-mode'.")(autoload 'doom-debug-mode "~/.doom/lisp/lib/debug" "Toggle `debug-on-error' and `init-file-debug' for verbose logging.

This is a minor mode.  If called interactively, toggle the
`Doom-Debug mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='doom-debug-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t nil)(autoload 'doom-backtrace "~/.doom/lisp/lib/debug" "Return a stack trace as a list of `backtrace-frame' objects." nil nil)(autoload 'doom-run-all-startup-hooks-h "~/.doom/lisp/lib/debug" "Run all startup Emacs hooks. Meant to be executed after starting Emacs with
-q or -Q, for example:

  emacs -Q -l init.el -f doom-run-all-startup-hooks-h" nil nil)(autoload 'doom-info "~/.doom/lisp/lib/debug" "Returns diagnostic information about the current Emacs session in markdown,
ready to be pasted in a bug report on github." nil nil)(autoload 'doom-info-string "~/.doom/lisp/lib/debug" "Return the `doom-info' as a compact string.

FILL-COLUMN determines the column at which lines will be broken.

(fn &optional WIDTH NOCOLOR)" nil nil)(autoload 'doom/version "~/.doom/lisp/lib/debug" "Display the running version of Doom core, module sources, and Emacs." t nil)(autoload 'doom/info "~/.doom/lisp/lib/debug" "Collects some debug information about your Emacs session, formats it and
copies it to your clipboard, ready to be pasted into bug reports!" t nil)(autoload 'doom/toggle-profiler "~/.doom/lisp/lib/debug" "Toggle the Emacs profiler. Run it again to see the profiling report." t nil)(defvar doom-docs-dir (file-name-concat doom-emacs-dir "docs/") "Where Doom's documentation files are stored. Must end with a slash.")(autoload 'doom-docs-mode "~/.doom/lisp/lib/docs" "Hides metadata, tags, & drawers and activates all org-mode pretiffications.
This primes `org-mode' for reading.

This is a minor mode.  If called interactively, toggle the
`Doom-Docs mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `doom-docs-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t nil)(autoload 'doom/reload-docs "~/.doom/lisp/lib/docs" "Reload the ID locations in Doom's documentation and open docs buffers.

(fn &optional FORCE)" t nil)(autoload 'doom-docs-generate-id "~/.doom/lisp/lib/docs" "Generate an ID for a `doom-docs-org-mode' buffer.

(fn &optional FORCE\\=\\?)" nil nil)(autoload 'doom-docs-org-mode "~/.doom/lisp/lib/docs" "A derivative of `org-mode' for Doom's documentation files.

Keeps track of its own IDs in `doom-docs-dir' and toggles `doom-docs-mode' when
`read-only-mode' is activated.

(fn)" t nil)(autoload 'doom-docs-read-only-h "~/.doom/lisp/lib/docs" "Activate `read-only-mode' if the current file exists and is non-empty." nil nil)(autoload 'doom-path "~/.doom/lisp/lib/files" "Return an path expanded after concatenating SEGMENTS with path separators.

Ignores `nil' elements in SEGMENTS, and is intended as a fast compromise between
`expand-file-name' (slow, but accurate), `file-name-concat' (fast, but
inaccurate).

(fn &rest SEGMENTS)" nil nil)(autoload 'doom-glob "~/.doom/lisp/lib/files" "Return file list matching the glob created by joining SEGMENTS.

The returned file paths will be relative to `default-directory', unless SEGMENTS
concatenate into an absolute path.

Returns nil if no matches exist.
Ignores `nil' elements in SEGMENTS.
If the glob ends in a slash, only returns matching directories.

(fn &rest SEGMENTS)" nil nil)(function-put 'doom-glob 'side-effect-free 't)(define-obsolete-function-alias 'doom-dir 'doom-path "3.0.0")(autoload 'doom-files-in "~/.doom/lisp/lib/files" "Return a list of files/directories in PATHS (one string or a list of them).

FILTER is a function or symbol that takes one argument (the path). If it returns
non-nil, the entry will be excluded.

MAP is a function or symbol which will be used to transform each entry in the
results.

TYPE determines what kind of path will be included in the results. This can be t
(files and folders), 'files or 'dirs.

By default, this function returns paths relative to PATH-OR-PATHS if it is a
single path. If it a list of paths, this function returns absolute paths.
Otherwise, by setting RELATIVE-TO to a path, the results will be transformed to
be relative to it.

The search recurses up to DEPTH and no further. DEPTH is an integer.

MATCH is a string regexp. Only entries that match it will be included.

(fn PATHS &rest REST &key FILTER MAP (FULL t) (FOLLOW-SYMLINKS t) (TYPE \\='files) (RELATIVE-TO (unless full default-directory)) (DEPTH 99999) (MINDEPTH 0) (MATCH \"/[^._][^/]+\"))" nil nil)(autoload 'doom-file-cookie-p "~/.doom/lisp/lib/files" "Returns the evaluated result of FORM in a ;;;###COOKIE FORM at the top of
FILE.

If COOKIE doesn't exist, or cookie isn't within the first 256 bytes of FILE,
return NULL-VALUE.

(fn FILE &optional COOKIE NULL-VALUE)" nil nil)(autoload 'file-exists-p! "~/.doom/lisp/lib/files" "Returns non-nil if the FILES in DIRECTORY all exist.

DIRECTORY is a path; defaults to `default-directory'.

Returns the last file found to meet the rules set by FILES, which can be a
single file or nested compound statement of `and' and `or' statements.

(fn FILES &optional DIRECTORY)" nil t)(autoload 'doom-file-size "~/.doom/lisp/lib/files" "Returns the size of FILE (in DIR) in bytes.

(fn FILE &optional DIR)" nil nil)(autoload 'doom-directory-size "~/.doom/lisp/lib/files" "Returns the size of FILE (in DIR) in kilobytes.

(fn DIR)" nil nil)(autoload 'doom-file-read "~/.doom/lisp/lib/files" "Read FILE and return its contents.

Set BY to change how its contents are consumed. It accepts any function, to be
called with no arguments and expected to return the contents as any arbitrary
data. By default, BY is set to `buffer-string'. Otherwise, BY recognizes these
special values:

'insert      -- insert FILE's contents into the current buffer before point.
'read        -- read the first form in FILE and return it as a single S-exp.
'read*       -- read all forms in FILE and return it as a list of S-exps.
'(read . N)  -- read the first N (an integer) S-exps in FILE.

CODING dictates the encoding of the buffer. This defaults to `utf-8'.

If NOERROR is non-nil, don't throw an error if FILE doesn't exist. This will
still throw an error if FILE is unreadable, however.

If BEG and/or END are integers, only that region will be read from FILE.

(fn FILE &key (BY \\='buffer-string) (CODING (or coding-system-for-read \\='utf-8)) NOERROR BEG END)" nil nil)(autoload 'doom-file-write "~/.doom/lisp/lib/files" "Write CONTENTS (a string or list of forms) to FILE (a string path).

If CONTENTS is list of forms. Any literal strings in the list are inserted
verbatim, as text followed by a newline, with `insert'. Sexps are inserted with
`prin1'. BY is the function to use to emit

MODE dictates the permissions of the file. If FILE already exists, its
permissions will be changed.

CODING dictates the encoding to read/write with (see `coding-system-for-write').
If set to nil, `binary' is used.

APPEND dictates where CONTENTS will be written. If neither is set,
the file will be overwritten. If both are, the contents will be written to both
ends. Set either APPEND or PREPEND to `noerror' to silently ignore read errors.

(fn FILE CONTENTS &key APPEND (CODING \\='utf-8) MODE (MKDIR \\='parents) (INSERTFN #\\='insert) (PRINTFN #\\='prin1))" nil nil)(autoload 'with-file-contents! "~/.doom/lisp/lib/files" "Create a temporary buffer with FILE's contents and execute BODY in it.

The point is at the beginning of the buffer afterwards.

A convenience macro to express the common `with-temp-buffer' +
`insert-file-contents' idiom more succinctly, enforce `utf-8', and perform some
optimizations for `binary' IO.

(fn FILE &rest BODY)" nil t)(function-put 'with-file-contents! 'lisp-indent-function '1)(autoload 'with-file! "~/.doom/lisp/lib/files" "Evaluate BODY in a temp buffer, then write its contents to FILE.

Unlike `with-temp-file', this uses the `utf-8' encoding by default and performs
some optimizations for `binary' IO.

(fn FILE &rest BODY)" nil t)(function-put 'with-file! 'lisp-indent-function '1)(autoload 'doom/delete-this-file "~/.doom/lisp/lib/files" "Delete PATH, kill its buffers and expunge it from vc/magit cache.

If PATH is not specified, default to the current buffer's file.

If FORCE-P, delete without confirmation.

(fn &optional PATH FORCE-P)" t nil)(autoload 'doom/copy-this-file "~/.doom/lisp/lib/files" "Copy current buffer's file to NEW-PATH.

If FORCE-P, overwrite the destination file if it exists, without confirmation.

(fn NEW-PATH &optional FORCE-P)" t nil)(autoload 'doom/move-this-file "~/.doom/lisp/lib/files" "Move current buffer's file to NEW-PATH.

If FORCE-P, overwrite the destination file if it exists, without confirmation.

(fn NEW-PATH &optional FORCE-P)" t nil)(autoload 'doom/sudo-find-file "~/.doom/lisp/lib/files" "Open FILE as root.

(fn FILE)" t nil)(autoload 'doom/sudo-this-file "~/.doom/lisp/lib/files" "Open the current file as root." t nil)(autoload 'doom/sudo-save-buffer "~/.doom/lisp/lib/files" "Save this file as root." t nil)(autoload 'doom/remove-recent-file "~/.doom/lisp/lib/files" "Remove FILE from your recently-opened-files list.

(fn FILE)" t nil)(defvar doom-font-increment 2 "How many steps to increase the font size each time `doom/increase-font-size'
or `doom/decrease-font-size' are invoked.")(defvar doom-big-font nil "The font to use for `doom-big-font-mode'.
If nil, `doom-font' will be used, scaled up by `doom-big-font-increment'. See
`doom-font' for details on acceptable values for this variable.")(defvar doom-big-font-increment 4 "How many steps to increase the font size (with `doom-font' as the base) when
`doom-big-font-mode' is enabled and `doom-big-font' is nil.")(autoload 'doom-normalize-font "~/.doom/lisp/lib/fonts" "Return FONT as a normalized font spec.

The font will be normalized (i.e. :weight, :slant, and :width will set to
'normal if not specified) before it is converted.

FONT can be a `font-spec', a font object, an XFT font string, or an XLFD font
string.

(fn FONT)" nil nil)(autoload 'doom-adjust-font-size "~/.doom/lisp/lib/fonts" "Increase size of font in FRAME by INCREMENT.

If FIXED-SIZE-P is non-nil, treat INCREMENT as a font size, rather than a
scaling factor.

FONT-ALIST is an alist give temporary values to certain Doom font variables,
like `doom-font' or `doom-variable-pitch-font'. e.g.

  `((doom-font . ,(font-spec :family \"Sans Serif\" :size 12)))

Doesn't work in terminal Emacs.

(fn INCREMENT &optional FIXED-SIZE-P FONT-ALIST)" nil nil)(autoload 'doom-font-exists-p "~/.doom/lisp/lib/fonts" "Return non-nil if FONT exists on this system.

(fn FONT)" nil nil)(function-put 'doom-font-exists-p 'pure 't)(function-put 'doom-font-exists-p 'side-effect-free 't)(autoload 'doom/reload-font "~/.doom/lisp/lib/fonts" "Reload your fonts, if they're set.
See `doom-init-fonts-h'." t nil)(autoload 'doom/increase-font-size "~/.doom/lisp/lib/fonts" "Enlargens the font size across the current and child frames.

(fn COUNT &optional INCREMENT)" t nil)(autoload 'doom/decrease-font-size "~/.doom/lisp/lib/fonts" "Shrinks the font size across the current and child frames.

(fn COUNT &optional INCREMENT)" t nil)(autoload 'doom/reset-font-size "~/.doom/lisp/lib/fonts" "Reset font size and `text-scale'.

Assuming it has been adjusted via `doom/increase-font-size' and
`doom/decrease-font-size', or `text-scale-*' commands." t nil)(defvar doom-big-font-mode nil "Non-nil if Doom-BIG-Font mode is enabled.
See the `doom-big-font-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `doom-big-font-mode'.")(autoload 'doom-big-font-mode "~/.doom/lisp/lib/fonts" "Globally resizes your fonts for streams, screen-sharing or presentations.

This is a minor mode.  If called interactively, toggle the
`Doom-BIG-Font mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='doom-big-font-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

Uses `doom-big-font' if its set, otherwise uses `doom-font' (falling back to
your system font).

Also resizees `doom-variable-pitch-font' and `doom-serif-font'.

(fn &optional ARG)" t nil)(autoload 'doom-git-toplevel "~/.doom/lisp/lib/git" "Return the path to the current repo's root.

(fn &rest SEGMENTS)" nil nil)(autoload 'doom-active-minor-modes "~/.doom/lisp/lib/help" "Return a list of active minor-mode symbols." nil nil)(defalias 'doom/describe-autodefs #'doom/help-autodefs)(defalias 'doom/describe-module #'doom/help-modules)(defalias 'doom/describe-package #'doom/help-packages)(autoload 'doom/describe-active-minor-mode "~/.doom/lisp/lib/help" "Get information on an active minor mode. Use `describe-minor-mode' for a
selection of all minor-modes, active or not.

(fn MODE)" t nil)(autoload 'doom-completing-read-org-headings "~/.doom/lisp/lib/help" "TODO

(fn PROMPT FILES &rest PLIST &key DEPTH MINDEPTH INCLUDE-FILES INITIAL-INPUT EXTRA-CANDIDATES ACTION)" nil nil)(autoload 'doom/homepage "~/.doom/lisp/lib/help" "Open the doom emacs homepage in the browser." t nil)(autoload 'doom/issue-tracker "~/.doom/lisp/lib/help" "Open Doom Emacs' global issue tracker on Discourse." t nil)(autoload 'doom/report-bug "~/.doom/lisp/lib/help" "Open the browser on our Discourse.

If called when a backtrace buffer is present, it and the output of `doom-info'
will be automatically appended to the result." t nil)(autoload 'doom/discourse "~/.doom/lisp/lib/help" "Open Doom Emacs' issue tracker on Discourse." t nil)(autoload 'doom/help "~/.doom/lisp/lib/help" "Open Doom's user manual." t nil)(autoload 'doom/help-search-headings "~/.doom/lisp/lib/help" "Search Doom's documentation and jump to a headline.

(fn &optional INITIAL-INPUT)" t nil)(autoload 'doom/help-search "~/.doom/lisp/lib/help" "Perform a text search on all of Doom's documentation.

(fn &optional INITIAL-INPUT)" t nil)(autoload 'doom/help-search-news "~/.doom/lisp/lib/help" "Search headlines in Doom's newsletters.

(fn &optional INITIAL-INPUT)" t nil)(autoload 'doom/help-faq "~/.doom/lisp/lib/help" "Search Doom's FAQ and jump to a question.

(fn &optional INITIAL-INPUT)" t nil)(autoload 'doom/help-news "~/.doom/lisp/lib/help" "Open a Doom newsletter.
The latest newsletter will be selected by default." t nil)(autoload 'doom/help-autodefs "~/.doom/lisp/lib/help" "Open documentation for an autodef.

An autodef is a Doom concept. It is a function or macro that is always defined,
whether or not its containing module is disabled (in which case it will safely
no-op without evaluating its arguments). This syntactic sugar lets you use them
without needing to check if they are available.

(fn AUTODEF)" t nil)(autoload 'doom/help-modules "~/.doom/lisp/lib/help" "Open the documentation for a Doom module.

CATEGORY is a keyword and MODULE is a symbol. e.g. :editor and 'evil.

If VISIT-DIR is non-nil, visit the module's directory rather than its
documentation.

Automatically selects a) the module at point (in private init files), b) the
module derived from a `modulep!' or `require!' call, c) the module that the
current file is in, or d) the module associated with the current major mode (see
`doom--help-major-mode-module-alist').

(fn CATEGORY MODULE &optional VISIT-DIR)" t nil)(autoload 'doom/help-custom-variable "~/.doom/lisp/lib/help" "Look up documentation for a custom variable.

Unlike `helpful-variable', which casts a wider net that includes internal
variables, this only lists variables that exist to be customized (defined with
`defcustom').

(fn VAR)" t nil)(autoload 'doom/help-packages "~/.doom/lisp/lib/help" "Like `describe-package', but for packages installed by Doom modules.

Only shows installed packages. Includes information about where packages are
defined and configured.

If prefix arg is present, refresh the cache.

(fn PACKAGE)" t nil)(autoload 'doom/help-package-config "~/.doom/lisp/lib/help" "Jump to any `use-package!', `after!' or ;;;###package block for PACKAGE.

This only searches `doom-emacs-dir' (typically ~/.emacs.d) and does not include
config blocks in your private config.

(fn PACKAGE)" t nil)(defalias 'doom/help-package-homepage #'straight-visit-package-website)(autoload 'doom/help-search-load-path "~/.doom/lisp/lib/help" "Perform a text search on your `load-path'.
Uses the symbol at point or the current selection, if available.

(fn QUERY)" t nil)(autoload 'doom/help-search-loaded-files "~/.doom/lisp/lib/help" "Perform a text search on your `load-path'.
Uses the symbol at point or the current selection, if available.

(fn QUERY)" t nil)(autoload 'doom/reload-packages "~/.doom/lisp/lib/packages" "Reload `doom-packages', `package' and `quelpa'." t nil)(autoload 'doom/bumpify-package-at-point "~/.doom/lisp/lib/packages" "Convert `package!' call at point to a bump string." t nil)(autoload 'doom/bumpify-packages-in-buffer "~/.doom/lisp/lib/packages" "Convert all `package!' calls in buffer into bump strings." t nil)(autoload 'doom/bump-package-at-point "~/.doom/lisp/lib/packages" "Inserts or updates a `:pin' for the `package!' statement at point.
Grabs the latest commit id of the package using 'git'.

(fn &optional SELECT)" t nil)(autoload 'doom/bump-packages-in-buffer "~/.doom/lisp/lib/packages" "Inserts or updates a `:pin' to all `package!' statements in current buffer.
If SELECT (prefix arg) is non-nil, prompt you to choose a specific commit for
each package.

(fn &optional SELECT)" t nil)(autoload 'doom/bump-module "~/.doom/lisp/lib/packages" "Bump packages in CATEGORY MODULE.
If SELECT (prefix arg) is non-nil, prompt you to choose a specific commit for
each package.

(fn CATEGORY &optional MODULE SELECT)" t nil)(autoload 'doom/bump-package "~/.doom/lisp/lib/packages" "Bump PACKAGE in all modules that install it.

(fn PACKAGE)" t nil)(autoload 'doom/bumpify-diff "~/.doom/lisp/lib/packages" "Copy user/repo@hash -> user/repo@hash's of changed packages to clipboard.

Must be run from a magit diff buffer.

(fn &optional INTERACTIVE)" t nil)(autoload 'doom/commit-bumps "~/.doom/lisp/lib/packages" "Create a pre-filled magit commit for currently bumped packages." t nil)(autoload 'doom-package-homepage "~/.doom/lisp/lib/packages" "Return the url to PACKAGE's homepage (usually a repo).

(fn PACKAGE)" nil nil)(autoload 'plist-put! "~/.doom/lisp/lib/plist" "Set each PROP VALUE pair in REST to PLIST in-place.

(fn PLIST &rest REST)" nil t)(autoload 'doom-plist-get "~/.doom/lisp/lib/plist" "Return PROP in PLIST, if it exists. Otherwise NIL-VALUE.

(fn PLIST PROP &optional NIL-VALUE)" nil nil)(autoload 'doom-plist-merge "~/.doom/lisp/lib/plist" "Non-destructively merge FROM-PLIST onto TO-PLIST

(fn FROM-PLIST TO-PLIST)" nil nil)(autoload 'doom-plist-delete-nil "~/.doom/lisp/lib/plist" "Delete `nil' properties from a copy of PLIST.

(fn PLIST)" nil nil)(autoload 'doom-plist-keys "~/.doom/lisp/lib/plist" "Return the keys in PLIST.

(fn PLIST)" nil nil)(autoload 'doom-plist-values "~/.doom/lisp/lib/plist" "Return the values in PLIST.

(fn PLIST)" nil nil)(autoload 'doom-print "~/.doom/lisp/lib/print" "Print OUTPUT to stdout.

Unlike `message', this:
- Respects the value of `standard-output'.
- Indents according to `doom-print-indent' (if FORMAT is non-nil).
- Prints to stdout instead of stderr in batch mode.
- Recognizes more terminal escape codes (only in batch mode).
- No-ops if OUTPUT is nil or an empty/blank string.

Returns OUTPUT.

(fn OUTPUT &key (FORMAT nil) (LEVEL doom-print-level) (NEWLINE t) (STREAM standard-output))" nil nil)(autoload 'format! "~/.doom/lisp/lib/print" "An alternative to `format' that understands `print!'s style syntax.

(fn MESSAGE &rest ARGS)" nil t)(autoload 'print-group! "~/.doom/lisp/lib/print" "Indents any `print!' or `format!' output within BODY.

(fn &rest BODY)" nil t)(function-put 'print-group! 'lisp-indent-function 'defun)(autoload 'print! "~/.doom/lisp/lib/print" "Prints MESSAGE, formatted with ARGS, to stdout.

Returns non-nil if the message is a non-empty string.

Can be colored using (color ...) blocks:

  (print! \"Hello %s\" (bold (blue \"How are you?\")))
  (print! \"Hello %s\" (red \"World\"))
  (print! (green \"Great %s!\") \"success\")

Uses faces in interactive sessions and ANSI codes otherwise.

(fn MESSAGE &rest ARGS)" nil t)(autoload 'insert! "~/.doom/lisp/lib/print" "Like `insert', but with the power of `format!'.

Each argument in ARGS can be a list, as if they were arguments to `format!':
(MESSAGE [ARGS...]).

(fn &rest (MESSAGE . ARGS)...)" nil t)(autoload 'with-output-to! "~/.doom/lisp/lib/print" "Capture all output within BODY according to STREAMSPEC.

STREAMSPEC is a list of log specifications, indicating where to write output
based on the print level of the message. For example:

  `((>= notice ,(get-buffer-create \"*stdout*\"))
    (= error   ,(get-buffer-create \"*errors*\"))
    (t . ,(get-buffer-create \"*debug*\")))

(fn STREAMSPEC &rest BODY)" nil t)(function-put 'with-output-to! 'lisp-indent-function '1)(autoload 'doom-print--format "~/.doom/lisp/lib/print" "

(fn MESSAGE &rest ARGS)" nil nil)(autoload 'doom-print--indent "~/.doom/lisp/lib/print" "Indent TEXT by WIDTH spaces. If ARGS, format TEXT with them.

(fn TEXT &optional PREFIX)" nil nil)(autoload 'doom-print--fill "~/.doom/lisp/lib/print" "Ensure MSG is split into lines no longer than `fill-column'.

(fn MESSAGE &optional COLUMN INDENT)" nil nil)(autoload 'doom-print--paragraph "~/.doom/lisp/lib/print" "TODO

(fn &rest LINES)" nil nil)(autoload 'doom-print--join "~/.doom/lisp/lib/print" "Ensure SEQUENCE is joined with SEPARATOR.

`nil' and empty strings in SEQUENCE are omitted.

(fn SEQUENCE &optional SEPARATOR)" nil nil)(autoload 'doom-print--truncate "~/.doom/lisp/lib/print" "Replaces basic org markup with ansi/text-properties.

(fn TEXT &optional COL ELLIPSIS)" nil nil)(autoload 'doom-print--buffer "~/.doom/lisp/lib/print" "Replaces basic org markup with ansi/text-properties.

(fn BUFFER &optional BEG END)" nil nil)(autoload 'doom-print--cli-markup "~/.doom/lisp/lib/print" "Replace `...', `...`, and ```...``` quotes in TEXT with CLI formatting.

- `$ENVVAR' = bolded
- `--switch' = bolded
- `ARG' = underlined
- `symbol' = highlighted in blue
- `arbitrary code` = highlighted in blue
- ```
  Arbitrary multiline code gets highlighted in blue too.
  ```

(fn TEXT)" nil nil)(autoload 'doom-print--org "~/.doom/lisp/lib/print" "Replaces basic Org markup with ansi/text-properties.

All emphasis markers need to be preceded by a backslash.

(fn TEXT)" nil nil)(autoload 'doom-print--style "~/.doom/lisp/lib/print" "Apply STYLE to formatted MESSAGE with ARGS.

STYLE is a symbol that correlates to `doom-print-ansi-alist'.

In a noninteractive session, this wraps the result in ansi color codes.
Otherwise, it maps colors to a term-color-* face.

(fn STYLE FORMAT &rest ARGS)" nil nil)(autoload 'doom-print--class "~/.doom/lisp/lib/print" "Apply CLASS to formatted format with ARGS.

CLASS is derived from `doom-print-class-alist', and can contain any arbitrary,
transformative logic.

(fn CLASS FORMAT &rest ARGS)" nil nil)(autoload 'doom-call-process "~/.doom/lisp/lib/process" "Execute COMMAND with ARGS synchronously.

Returns (STATUS . OUTPUT) when it is done, where STATUS is the returned error
code of the process and OUTPUT is its stdout output.

(fn COMMAND &rest ARGS)" nil nil)(autoload 'doom-exec-process "~/.doom/lisp/lib/process" "Execute COMMAND with ARGS synchronously.

Unlike `doom-call-process', this pipes output to `standard-output' on the fly to
simulate 'exec' in the shell, so batch scripts could run external programs
synchronously without sacrificing their output.

Warning: freezes indefinitely on any stdin prompt.

(fn COMMAND &rest ARGS)" nil nil)(defvar projectile-project-root nil)(defvar projectile-enable-caching (not noninteractive))(defvar projectile-require-project-root 'prompt)(autoload 'project-file-exists-p! "~/.doom/lisp/lib/projects" "Checks if the project has the specified FILES.
Paths are relative to the project root, unless they start with ./ or ../ (in
which case they're relative to `default-directory'). If they start with a slash,
they are absolute.

(fn FILES)" nil t)(autoload 'doom/find-file-in-other-project "~/.doom/lisp/lib/projects" "Performs `projectile-find-file' in a known project of your choosing.

(fn PROJECT-ROOT)" t nil)(autoload 'doom/browse-in-other-project "~/.doom/lisp/lib/projects" "Performs `find-file' in a known project of your choosing.

(fn PROJECT-ROOT)" t nil)(autoload 'doom/browse-in-emacsd "~/.doom/lisp/lib/projects" "Browse files from `doom-emacs-dir'." t nil)(autoload 'doom/find-file-in-emacsd "~/.doom/lisp/lib/projects" "Find a file under `doom-emacs-dir', recursively." t nil)(autoload 'doom/add-directory-as-project "~/.doom/lisp/lib/projects" "Register an arbitrary directory as a project.

Unlike `projectile-add-known-project', if DIR isn't a valid project, a .project
file will be created within it so that it will always be treated as one. This
command will throw an error if a parent of DIR is a valid project (which would
mask DIR).

(fn DIR)" t nil)(autoload 'doom-project-p "~/.doom/lisp/lib/projects" "Return t if DIR (defaults to `default-directory') is a valid project.

(fn &optional DIR)" nil nil)(autoload 'doom-project-root "~/.doom/lisp/lib/projects" "Return the project root of DIR (defaults to `default-directory').
Returns nil if not in a project.

(fn &optional DIR)" nil nil)(autoload 'doom-project-name "~/.doom/lisp/lib/projects" "Return the name of the current project.

Returns '-' if not in a valid project.

(fn &optional DIR)" nil nil)(autoload 'doom-project-expand "~/.doom/lisp/lib/projects" "Expand NAME to project root.

(fn NAME &optional DIR)" nil nil)(autoload 'doom-project-find-file "~/.doom/lisp/lib/projects" "Jump to a file in DIR (searched recursively).

If DIR is not a project, it will be indexed (but not cached).

(fn DIR)" nil nil)(autoload 'doom-project-browse "~/.doom/lisp/lib/projects" "Traverse a file structure starting linearly from DIR.

(fn DIR)" nil nil)(autoload 'doom-project-ignored-p "~/.doom/lisp/lib/projects" "Return non-nil if temporary file or a straight package.

(fn PROJECT-ROOT)" nil nil)(progn (autoload 'set-project-type! "~/.doom/lisp/lib/projects.el" "Add a project type to `projectile-project-type'.

(fn NAME &key PREDICATE COMPILE RUN TEST CONFIGURE DIR)" nil nil) (function-put 'set-project-type! 'lisp-indent-function '1))(put 'set-project-type! 'doom-module '(:core))(autoload 'doom/sandbox "~/.doom/lisp/lib/sandbox" "Open the Emacs Lisp sandbox.

This is a test bed for running Emacs Lisp in another instance of Emacs with
varying amounts of Doom loaded, including:

  a) vanilla Emacs (nothing loaded),
  b) vanilla Doom (only Doom core),
  c) Doom + modules - your private config or
  c) Doom + modules + your private config (a complete Doom session)

This is done without sacrificing access to installed packages. Use the sandbox
to reproduce bugs and determine if Doom is to blame." t nil)(autoload 'doom-scratch-buffer "~/.doom/lisp/lib/scratch" "Return a scratchpad buffer in major MODE.

(fn &optional DONT-RESTORE-P MODE DIRECTORY PROJECT-NAME)" nil nil)(autoload 'doom-persist-scratch-buffer-h "~/.doom/lisp/lib/scratch" "Save the current buffer to `doom-scratch-dir'." nil nil)(autoload 'doom-persist-scratch-buffers-h "~/.doom/lisp/lib/scratch" "Save all scratch buffers to `doom-scratch-dir'." nil nil)(autoload 'doom-persist-scratch-buffers-after-switch-h "~/.doom/lisp/lib/scratch" "Kill scratch buffers when they are no longer visible, saving them to disk." nil nil)(unless noninteractive (add-hook 'kill-emacs-hook #'doom-persist-scratch-buffers-h))(autoload 'doom/open-scratch-buffer "~/.doom/lisp/lib/scratch" "Pop up a persistent scratch buffer.

If passed the prefix ARG, do not restore the last scratch buffer.
If PROJECT-P is non-nil, open a persistent scratch buffer associated with the
  current project.

(fn &optional ARG PROJECT-P SAME-WINDOW-P)" t nil)(autoload 'doom/switch-to-scratch-buffer "~/.doom/lisp/lib/scratch" "Like `doom/open-scratch-buffer', but switches to it in the current window.

If passed the prefix ARG, do not restore the last scratch buffer.

(fn &optional ARG PROJECT-P)" t nil)(autoload 'doom/open-project-scratch-buffer "~/.doom/lisp/lib/scratch" "Opens the (persistent) project scratch buffer in a popup.

If passed the prefix ARG, do not restore the last scratch buffer.

(fn &optional ARG SAME-WINDOW-P)" t nil)(autoload 'doom/switch-to-project-scratch-buffer "~/.doom/lisp/lib/scratch" "Like `doom/open-project-scratch-buffer', but switches to it in the current
window.

If passed the prefix ARG, do not restore the last scratch buffer.

(fn &optional ARG)" t nil)(autoload 'doom/revert-scratch-buffer "~/.doom/lisp/lib/scratch" "Revert scratch buffer to last persistent state." t nil)(autoload 'doom/delete-persistent-scratch-file "~/.doom/lisp/lib/scratch" "Deletes a scratch buffer file in `doom-scratch-dir'.

If prefix ARG, delete all persistent scratches.

(fn &optional ARG)" t nil)(autoload 'doom-session-file "~/.doom/lisp/lib/sessions" "TODO

(fn &optional NAME)" nil nil)(autoload 'doom-save-session "~/.doom/lisp/lib/sessions" "TODO

(fn &optional FILE)" nil nil)(autoload 'doom-load-session "~/.doom/lisp/lib/sessions" "TODO

(fn &optional FILE)" nil nil)(autoload 'doom/quickload-session "~/.doom/lisp/lib/sessions" "TODO" t nil)(autoload 'doom/quicksave-session "~/.doom/lisp/lib/sessions" "TODO" t nil)(autoload 'doom/load-session "~/.doom/lisp/lib/sessions" "TODO

(fn FILE)" t nil)(autoload 'doom/save-session "~/.doom/lisp/lib/sessions" "TODO

(fn FILE)" t nil)(autoload 'doom/restart "~/.doom/lisp/lib/sessions" "Restart Emacs (and the daemon, if active).

Unlike `doom/restart-and-restore', does not restart the current session." t nil)(autoload 'doom/restart-and-restore "~/.doom/lisp/lib/sessions" "Restart Emacs (and the daemon, if active).

If DEBUG (the prefix arg) is given, start the new instance with the --debug
switch.

(fn &optional DEBUG)" t nil)(autoload 'doom-store-persist "~/.doom/lisp/lib/store" "Persist VARIABLES (list of symbols) in LOCATION (symbol).
This populates these variables with cached values, if one exists, and saves them
to file when Emacs quits. This cannot persist buffer-local variables.

(fn LOCATION VARIABLES)" nil nil)(autoload 'doom-store-desist "~/.doom/lisp/lib/store" "Unregisters VARIABLES (list of symbols) in LOCATION (symbol).
Variables to persist are recorded in `doom-store-persist-alist'. Does not affect
the actual variables themselves or their values.

(fn LOCATION &optional VARIABLES)" nil nil)(autoload 'doom-store-get "~/.doom/lisp/lib/store" "Retrieve KEY from LOCATION (defaults to `doom-store-location').
If it doesn't exist or has expired, DEFAULT_VALUE is returned.

(fn KEY &optional LOCATION DEFAULT-VALUE NOFLUSH)" nil nil)(autoload 'doom-store-put "~/.doom/lisp/lib/store" "Set KEY to VALUE in the store at LOCATION.
KEY can be any lisp object that is comparable with `equal'. TTL is the duration
(in seconds) after which this cache entry expires; if nil, no cache expiration.
LOCATION is the super-key to store this cache item under. It defaults to
`doom-store-location'.

(fn KEY VALUE &optional TTL LOCATION NOFLUSH)" nil nil)(autoload 'doom-store-rem "~/.doom/lisp/lib/store" "Clear a cache LOCATION (defaults to `doom-store-location').

(fn KEY &optional LOCATION NOFLUSH)" nil nil)(autoload 'doom-store-member-p "~/.doom/lisp/lib/store" "Return t if KEY in LOCATION exists.
LOCATION defaults to `doom-store-location'.

(fn KEY &optional LOCATION)" nil nil)(autoload 'doom-store-clear "~/.doom/lisp/lib/store" "Clear the store at LOCATION (defaults to `doom-store-location').

(fn &optional LOCATION)" nil nil)(autoload 'doom-system-distro "~/.doom/lisp/lib/system" "Return a symbol representing the installed distro." nil nil)(autoload 'doom-system-distro-version "~/.doom/lisp/lib/system" "Return a distro name and version string." nil nil)(autoload 'doom-system-distro-icon "~/.doom/lisp/lib/system" "Display icon for the installed distro." nil nil)(autoload 'doom-system-cpus "~/.doom/lisp/lib/system" "Return the max number of processing units on this system.
Tries to be portable. Returns 1 if cannot be determined." nil nil)(defvar doom-point-in-comment-functions nil "List of functions to run to determine if point is in a comment.

Each function takes one argument: the position of the point. Stops on the first
function to return non-nil. Used by `doom-point-in-comment-p'.")(defvar doom-point-in-string-functions nil "List of functions to run to determine if point is in a string.

Each function takes one argument: the position of the point. Stops on the first
function to return non-nil. Used by `doom-point-in-string-p'.")(autoload 'doom-surrounded-p "~/.doom/lisp/lib/text" "Returns t if point is surrounded by a brace delimiter: {[(

If INLINE is non-nil, only returns t if braces are on the same line, and
whitespace is balanced on either side of the cursor.

If INLINE is nil, returns t if the opening and closing braces are on adjacent
lines, above and below, with only whitespace in between.

(fn PAIR &optional INLINE BALANCED)" nil nil)(autoload 'doom-point-in-comment-p "~/.doom/lisp/lib/text" "Return non-nil if POS is in a comment.
POS defaults to the current position.

(fn &optional POS)" nil nil)(autoload 'doom-point-in-string-p "~/.doom/lisp/lib/text" "Return non-nil if POS is in a string.

(fn &optional POS)" nil nil)(autoload 'doom-point-in-string-or-comment-p "~/.doom/lisp/lib/text" "Return non-nil if POS is in a string or comment.

(fn &optional POS)" nil nil)(autoload 'doom-region-active-p "~/.doom/lisp/lib/text" "Return non-nil if selection is active.
Detects evil visual mode as well." nil nil)(function-put 'doom-region-active-p 'side-effect-free 't)(autoload 'doom-region-beginning "~/.doom/lisp/lib/text" "Return beginning position of selection.
Uses `evil-visual-beginning' if available." nil nil)(function-put 'doom-region-beginning 'side-effect-free 't)(autoload 'doom-region-end "~/.doom/lisp/lib/text" "Return end position of selection.
Uses `evil-visual-end' if available." nil nil)(function-put 'doom-region-end 'side-effect-free 't)(autoload 'doom-thing-at-point-or-region "~/.doom/lisp/lib/text" "Grab the current selection, THING at point, or xref identifier at point.

Returns THING if it is a string. Otherwise, if nothing is found at point and
PROMPT is non-nil, prompt for a string (if PROMPT is a string it'll be used as
the prompting string). Returns nil if all else fails.

NOTE: Don't use THING for grabbing symbol-at-point. The xref fallback is smarter
in some cases.

(fn &optional THING PROMPT)" nil nil)(function-put 'doom-thing-at-point-or-region 'side-effect-free 't)(autoload 'doom/backward-to-bol-or-indent "~/.doom/lisp/lib/text" "Jump between the indentation column (first non-whitespace character) and the
beginning of the line. The opposite of
`doom/forward-to-last-non-comment-or-eol'.

(fn &optional POINT)" t nil)(autoload 'doom/forward-to-last-non-comment-or-eol "~/.doom/lisp/lib/text" "Jumps between the last non-blank, non-comment character in the line and the
true end of the line. The opposite of `doom/backward-to-bol-or-indent'.

(fn &optional POINT)" t nil)(autoload 'doom/backward-kill-to-bol-and-indent "~/.doom/lisp/lib/text" "Kill line to the first non-blank character. If invoked again afterwards, kill
line to beginning of line. Same as `evil-delete-back-to-indentation'." t nil)(autoload 'doom/delete-backward-word "~/.doom/lisp/lib/text" "Like `backward-kill-word', but doesn't affect the kill-ring.

(fn ARG)" t nil)(autoload 'doom/dumb-indent "~/.doom/lisp/lib/text" "Inserts a tab character (or spaces x tab-width)." t nil)(autoload 'doom/dumb-dedent "~/.doom/lisp/lib/text" "Dedents the current line." t nil)(autoload 'doom/retab "~/.doom/lisp/lib/text" "Converts tabs-to-spaces or spaces-to-tabs within BEG and END (defaults to
buffer start and end, to make indentation consistent. Which it does depends on
the value of `indent-tab-mode'.

If ARG (universal argument) is non-nil, retab the current buffer using the
opposite indentation style.

(fn ARG &optional BEG END)" t nil)(autoload 'doom/delete-trailing-newlines "~/.doom/lisp/lib/text" "Trim trailing newlines.

Respects `require-final-newline'." t nil)(autoload 'doom/dos2unix "~/.doom/lisp/lib/text" "Convert the current buffer to a Unix file encoding." t nil)(autoload 'doom/unix2dos "~/.doom/lisp/lib/text" "Convert the current buffer to a DOS file encoding." t nil)(autoload 'doom/toggle-indent-style "~/.doom/lisp/lib/text" "Switch between tabs and spaces indentation style in the current buffer." t nil)(autoload 'doom/set-indent-width "~/.doom/lisp/lib/text" "Change the indentation size to WIDTH of the current buffer.

The effectiveness of this command is significantly improved if you have
editorconfig or dtrt-indent installed.

(fn WIDTH)" t nil)(autoload 'doom-enable-delete-trailing-whitespace-h "~/.doom/lisp/lib/text" "Enables the automatic deletion of trailing whitespaces upon file save.

i.e. enables `ws-butler-mode' in the current buffer." nil nil)(autoload 'doom-disable-delete-trailing-whitespace-h "~/.doom/lisp/lib/text" "Disables the automatic deletion of trailing whitespaces upon file save.

i.e. disables `ws-butler-mode' in the current buffer." nil nil)(autoload 'doom-enable-show-trailing-whitespace-h "~/.doom/lisp/lib/text" "Enable `show-trailing-whitespace' in the current buffer." nil nil)(autoload 'doom-disable-show-trailing-whitespace-h "~/.doom/lisp/lib/text" "Disable `show-trailing-whitespace' in the current buffer." nil nil)(defconst doom-customize-theme-hook nil)(autoload 'custom-theme-set-faces! "~/.doom/lisp/lib/themes" "Apply a list of face SPECS as user customizations for THEME.

THEME can be a single symbol or list thereof. If nil, apply these settings to
all themes. It will apply to all themes once they are loaded.

(fn THEME &rest SPECS)" nil t)(function-put 'custom-theme-set-faces! 'lisp-indent-function 'defun)(autoload 'custom-set-faces! "~/.doom/lisp/lib/themes" "Apply a list of face SPECS as user customizations.

This is a convenience macro alternative to `custom-set-face' which allows for a
simplified face format, and takes care of load order issues, so you can use
doom-themes' API without worry.

(fn &rest SPECS)" nil t)(function-put 'custom-set-faces! 'lisp-indent-function 'defun)(autoload 'doom/reload-theme "~/.doom/lisp/lib/themes" "Reload the current Emacs theme." t nil)(autoload 'doom-theme-face-attribute "~/.doom/lisp/lib/themes" "Read a FACE's ATTRIBUTE for a loaded THEME.

This is different from `face-attribute', which reads the attribute of an active
face for the current theme, but an active theme can change (or fail to load) in
non-interactive or frame-less sessions.

(fn THEME FACE ATTRIBUTE &optional RECURSIVE)" nil nil)(autoload 'doom-resize-window "~/.doom/lisp/lib/ui" "Resize a window to NEW-SIZE. If HORIZONTAL, do it width-wise.
If FORCE-P is omitted when `window-size-fixed' is non-nil, resizing will fail.

(fn WINDOW NEW-SIZE &optional HORIZONTAL FORCE-P)" nil nil)(autoload 'doom-quit-p "~/.doom/lisp/lib/ui" "Prompt the user for confirmation when killing Emacs.

Returns t if it is safe to kill this session. Does not prompt if no real buffers
are open.

(fn &optional PROMPT)" nil nil)(autoload 'doom-recenter-a "~/.doom/lisp/lib/ui" "Generic advice for recentering window (typically :after other functions).

(fn &rest _)" nil nil)(autoload 'doom-preserve-window-position-a "~/.doom/lisp/lib/ui" "Generic advice for preserving cursor position on screen after scrolling.

(fn FN &rest ARGS)" nil nil)(autoload 'doom-shut-up-a "~/.doom/lisp/lib/ui" "Generic advisor for silencing noisy functions.

In interactive Emacs, this just inhibits messages from appearing in the
minibuffer. They are still logged to *Messages*.

In tty Emacs, messages are suppressed completely.

(fn FN &rest ARGS)" nil nil)(autoload 'doom-apply-ansi-color-to-compilation-buffer-h "~/.doom/lisp/lib/ui" "Applies ansi codes to the compilation buffers. Meant for
`compilation-filter-hook'." nil nil)(autoload 'doom-disable-show-paren-mode-h "~/.doom/lisp/lib/ui" "Turn off `show-paren-mode' buffer-locally." nil nil)(autoload 'doom-enable-line-numbers-h "~/.doom/lisp/lib/ui" nil nil nil)(autoload 'doom-disable-line-numbers-h "~/.doom/lisp/lib/ui" nil nil nil)(autoload 'doom/toggle-line-numbers "~/.doom/lisp/lib/ui" "Toggle line numbers.

Cycles through regular, relative and no line numbers. The order depends on what
`display-line-numbers-type' is set to. If you're using Emacs 26+, and
visual-line-mode is on, this skips relative and uses visual instead.

See `display-line-numbers' for what these values mean." t nil)(autoload 'doom/delete-frame-with-prompt "~/.doom/lisp/lib/ui" "Delete the current frame, but ask for confirmation if it isn't empty." t nil)(autoload 'doom/window-maximize-buffer "~/.doom/lisp/lib/ui" "Close other windows to focus on this one.
Use `winner-undo' to undo this. Alternatively, use `doom/window-enlargen'.

(fn &optional ARG)" t nil)(autoload 'doom/window-enlargen "~/.doom/lisp/lib/ui" "Enlargen the current window (i.e. shrinks others) so you can focus on it.
Use `winner-undo' to undo this. Alternatively, use
`doom/window-maximize-buffer'.

(fn &optional ARG)" t nil)(autoload 'doom/window-maximize-horizontally "~/.doom/lisp/lib/ui" "Delete all windows to the left and right of the current window." t nil)(autoload 'doom/window-maximize-vertically "~/.doom/lisp/lib/ui" "Delete all windows above and below the current window." t nil)(autoload 'doom/set-frame-opacity "~/.doom/lisp/lib/ui" "Interactively change the current frame's opacity.

OPACITY is an integer between 0 to 100, inclusive.

(fn OPACITY)" t nil)(autoload 'doom/narrow-buffer-indirectly "~/.doom/lisp/lib/ui" "Restrict editing in this buffer to the current region, indirectly.

This recursively creates indirect clones of the current buffer so that the
narrowing doesn't affect other windows displaying the same buffer. Call
`doom/widen-indirectly-narrowed-buffer' to undo it (incrementally).

Inspired from http://demonastery.org/2013/04/emacs-evil-narrow-region/

(fn BEG END)" t nil)(autoload 'doom/widen-indirectly-narrowed-buffer "~/.doom/lisp/lib/ui" "Widens narrowed buffers.

This command will incrementally kill indirect buffers (under the assumption they
were created by `doom/narrow-buffer-indirectly') and switch to their base
buffer.

If ARG, then kill all indirect buffers, return the base buffer and widen it.

If the current buffer is not an indirect buffer, it is `widen'ed.

(fn &optional ARG)" t nil)(autoload 'doom/toggle-narrow-buffer "~/.doom/lisp/lib/ui" "Narrow the buffer to BEG END. If narrowed, widen it.

(fn BEG END)" t nil)(defvar +company-backend-alist '((text-mode (:separate company-dabbrev company-yasnippet company-ispell)) (prog-mode company-capf company-yasnippet) (conf-mode company-capf company-dabbrev-code company-yasnippet)) "An alist matching modes to company backends. The backends for any mode is
built from this.")(autoload '+company-init-backends-h "~/.doom/modules/completion/company/autoload" "Set `company-backends' for the current buffer." nil nil)(autoload '+company-has-completion-p "~/.doom/modules/completion/company/autoload" "Return non-nil if a completion candidate exists at point." nil nil)(autoload '+company/toggle-auto-completion "~/.doom/modules/completion/company/autoload" "Toggle as-you-type code completion." t nil)(autoload '+company/complete "~/.doom/modules/completion/company/autoload" "Bring up the completion popup. If only one result, complete it." t nil)(autoload '+company/dabbrev "~/.doom/modules/completion/company/autoload" "Invokes `company-dabbrev-code' in prog-mode buffers and `company-dabbrev'
everywhere else." t nil)(autoload '+company/whole-lines "~/.doom/modules/completion/company/autoload" "`company-mode' completion backend that completes whole-lines, akin to vim's
C-x C-l.

(fn COMMAND &optional ARG &rest IGNORED)" t nil)(autoload '+company/dict-or-keywords "~/.doom/modules/completion/company/autoload" "`company-mode' completion combining `company-dict' and `company-keywords'." t nil)(autoload '+company/dabbrev-code-previous "~/.doom/modules/completion/company/autoload" "TODO" t nil)(autoload '+company/completing-read "~/.doom/modules/completion/company/autoload" "Complete current company candidates in minibuffer.

Uses ivy, helm, vertico, or ido, if available." t nil)(progn (autoload 'set-company-backend! "~/.doom/modules/completion/company/autoload.el" "Prepends BACKENDS (in order) to `company-backends' in MODES.

MODES should be one symbol or a list of them, representing major or minor modes.
This will overwrite backends for MODES on consecutive uses.

If the car of BACKENDS is nil, unset the backends for MODES.

Examples:

  (set-company-backend! 'js2-mode
    'company-tide 'company-yasnippet)

  (set-company-backend! 'sh-mode
    '(company-shell :with company-yasnippet))

  (set-company-backend! '(c-mode c++-mode)
    '(:separate company-irony-c-headers company-irony))

  (set-company-backend! 'sh-mode nil)  ; unsets backends for sh-mode

(fn MODES &rest BACKENDS)" nil nil) (function-put 'set-company-backend! 'lisp-indent-function 'defun))(put 'set-company-backend! 'doom-module '(:completion . company))(autoload '+ivy:project-search "~/.doom/modules/completion/ivy/autoload/evil" nil t)(autoload '+ivy:project-search-from-cwd "~/.doom/modules/completion/ivy/autoload/evil" nil t)(autoload '+ivy-rich-buffer-name "~/.doom/modules/completion/ivy/autoload/ivy" "Display the buffer name.

Buffers that are considered unreal (see `doom-real-buffer-p') are dimmed with
`+ivy-buffer-unreal-face'.

(fn CANDIDATE)" nil nil)(autoload '+ivy-rich-buffer-icon "~/.doom/modules/completion/ivy/autoload/ivy" "Display the icon for CANDIDATE buffer.

(fn CANDIDATE)" nil nil)(autoload '+ivy-rich-describe-variable-transformer "~/.doom/modules/completion/ivy/autoload/ivy" "Previews the value of the variable in the minibuffer

(fn CAND)" nil nil)(autoload '+ivy-format-function-line-or-arrow "~/.doom/modules/completion/ivy/autoload/ivy" "Transform CANDS into a string for minibuffer.

If in terminal, prefix candidates with a chevron to make it more obvious which
one you're selecting, especially in themes that can't set a good background for
`ivy-current-match'. This is a combination of `ivy-format-function-line' and
`ivy-format-function-arrow'.

In the GUI, this is the same as `ivy-format-function-line'.

(fn CANDS)" nil nil)(autoload '+ivy/switch-workspace-buffer "~/.doom/modules/completion/ivy/autoload/ivy" "Switch to another buffer within the current workspace.

If ARG (universal argument), open selection in other-window.

(fn &optional ARG)" t nil)(autoload '+ivy/switch-workspace-buffer-other-window "~/.doom/modules/completion/ivy/autoload/ivy" "Switch another window to a buffer within the current workspace." t nil)(autoload '+ivy/switch-buffer "~/.doom/modules/completion/ivy/autoload/ivy" "Switch to another buffer." t nil)(autoload '+ivy/switch-buffer-other-window "~/.doom/modules/completion/ivy/autoload/ivy" "Switch to another buffer in another window." t nil)(autoload '+ivy/woccur "~/.doom/modules/completion/ivy/autoload/ivy" "Invoke a wgrep buffer on the current ivy results, if supported." t nil)(autoload '+ivy-yas-prompt-fn "~/.doom/modules/completion/ivy/autoload/ivy" "

(fn PROMPT CHOICES &optional DISPLAY-FN)" nil nil)(autoload '+ivy-git-grep-other-window-action "~/.doom/modules/completion/ivy/autoload/ivy" "Opens the current candidate in another window.

(fn X)" nil nil)(autoload '+ivy-confirm-delete-file "~/.doom/modules/completion/ivy/autoload/ivy" "

(fn X)" nil nil)(autoload '+ivy/projectile-find-file "~/.doom/modules/completion/ivy/autoload/ivy" "A more sensible `counsel-projectile-find-file', which will revert to
`counsel-find-file' if invoked from $HOME or /, `counsel-file-jump' if invoked
from a non-project, `projectile-find-file' if in a big project (more than
`ivy-sort-max-size' files), or `counsel-projectile-find-file' otherwise.

The point of this is to avoid Emacs locking up indexing massive file trees." t nil)(autoload '+ivy-file-search "~/.doom/modules/completion/ivy/autoload/ivy" "Conduct a file search using ripgrep.

:query STRING
  Determines the initial input to search for.
:in PATH
  Sets what directory to base the search out of. Defaults to the current
  project's root.
:recursive BOOL
  Whether or not to search files recursively from the base directory.

(fn &key QUERY IN ALL-FILES (RECURSIVE t) PROMPT ARGS)" nil nil)(function-put '+ivy-file-search 'lisp-indent-function 'defun)(autoload '+ivy/project-search "~/.doom/modules/completion/ivy/autoload/ivy" "Performs a live project search from the project root using ripgrep.

If ARG (universal argument), include all files, even hidden or compressed ones,
in the search.

(fn &optional ARG INITIAL-QUERY DIRECTORY)" t nil)(autoload '+ivy/project-search-from-cwd "~/.doom/modules/completion/ivy/autoload/ivy" "Performs a project search recursively from the current directory.

If ARG (universal argument), include all files, even hidden or compressed ones.

(fn &optional ARG INITIAL-QUERY)" t nil)(autoload '+ivy/compile "~/.doom/modules/completion/ivy/autoload/ivy" "Execute a compile command from the current buffer's directory." t nil)(autoload '+ivy/project-compile "~/.doom/modules/completion/ivy/autoload/ivy" "Execute a compile command from the current project's root." t nil)(autoload '+ivy/jump-list "~/.doom/modules/completion/ivy/autoload/ivy" "Go to an entry in evil's (or better-jumper's) jumplist." t nil)(autoload '+ivy/git-grep-other-window-action "~/.doom/modules/completion/ivy/autoload/ivy" "Open the current counsel-{ag,rg,git-grep} candidate in other-window." t nil)(autoload '+vertico:project-search "~/.doom/modules/completion/vertico/autoload/evil" nil t)(autoload '+vertico:project-search-from-cwd "~/.doom/modules/completion/vertico/autoload/evil" nil t)(autoload '+vertico/embark-magit-status "~/.doom/modules/completion/vertico/autoload/magit" "Run `magit-status` on repo containing the embark target.

(fn FILE)" t nil)(defvar embark-quit-after-action)(autoload '+vertico-file-search "~/.doom/modules/completion/vertico/autoload/vertico" "Conduct a file search using ripgrep.

:query STRING
  Determines the initial input to search for.
:in PATH
  Sets what directory to base the search out of. Defaults to the current project's root.
:recursive BOOL
  Whether or not to search files recursively from the base directory.

(fn &key QUERY IN ALL-FILES (RECURSIVE t) PROMPT ARGS)" nil nil)(function-put '+vertico-file-search 'lisp-indent-function 'defun)(autoload '+vertico/project-search "~/.doom/modules/completion/vertico/autoload/vertico" "Performs a live project search from the project root using ripgrep.
If ARG (universal argument), include all files, even hidden or compressed ones,
in the search.

(fn &optional ARG INITIAL-QUERY DIRECTORY)" t nil)(autoload '+vertico/project-search-from-cwd "~/.doom/modules/completion/vertico/autoload/vertico" "Performs a live project search from the current directory.
If ARG (universal argument), include all files, even hidden or compressed ones.

(fn &optional ARG INITIAL-QUERY)" t nil)(autoload '+vertico/search-symbol-at-point "~/.doom/modules/completion/vertico/autoload/vertico" "Performs a search in the current buffer for thing at point." t nil)(autoload '+vertico-embark-target-package-fn "~/.doom/modules/completion/vertico/autoload/vertico" "Targets Doom's package! statements and returns the package name" nil nil)(autoload '+vertico/embark-export-write "~/.doom/modules/completion/vertico/autoload/vertico" "Export the current vertico results to a writable buffer if possible.

Supports exporting consult-grep to wgrep, file to wdeired, and consult-location to occur-edit" t nil)(autoload '+vertico/embark-preview "~/.doom/modules/completion/vertico/autoload/vertico" "Previews candidate in vertico buffer, unless it's a consult command" t nil)(autoload '+vertico/find-file-in "~/.doom/modules/completion/vertico/autoload/vertico" "Jump to file under DIR (recursive).
If INITIAL is non-nil, use as initial input.

(fn &optional DIR INITIAL)" t nil)(autoload '+vertico/jump-list "~/.doom/modules/completion/vertico/autoload/vertico" "Go to an entry in evil's (or better-jumper's) jumplist.

(fn JUMP)" t nil)(autoload '+vertico-embark-which-key-indicator "~/.doom/modules/completion/vertico/autoload/vertico" "An embark indicator that displays keymaps using which-key.
The which-key help message will show the type and value of the
current target followed by an ellipsis if there are further
targets." nil nil)(autoload '+vertico--consult--fd-builder "~/.doom/modules/completion/vertico/autoload/vertico" "

(fn INPUT)" nil nil)(autoload '+vertico/consult-fd "~/.doom/modules/completion/vertico/autoload/vertico" "

(fn &optional DIR INITIAL)" t nil)(autoload '+vertico-basic-remote-try-completion "~/.doom/modules/completion/vertico/autoload/vertico" "

(fn STRING TABLE PRED POINT)" nil nil)(autoload '+vertico-basic-remote-all-completions "~/.doom/modules/completion/vertico/autoload/vertico" "

(fn STRING TABLE PRED POINT)" nil nil)(autoload '+vertico/switch-workspace-buffer "~/.doom/modules/completion/vertico/autoload/workspaces" "Switch to another buffer in the same or a specified workspace.

Type the workspace's number (starting from 1) followed by a space to display its
buffer list. Selecting a buffer in another workspace will switch to that
workspace instead. If FORCE-SAME-WORKSPACE (the prefix arg) is non-nil, that
buffer will be opened in the current workspace instead.

(fn &optional FORCE-SAME-WORKSPACE)" t nil)(autoload '+vertico/embark-open-in-new-workspace "~/.doom/modules/completion/vertico/autoload/workspaces" "Open X (a file) in a new workspace.

(fn X)" t nil)(autoload '+doom-dashboard/open "~/.doom/modules/ui/doom-dashboard/autoload" "Switch to the dashboard in the current window, of the current FRAME.

(fn FRAME)" t nil)(autoload '+doom-dashboard/forward-button "~/.doom/modules/ui/doom-dashboard/autoload" "Like `forward-button', but don't wrap.

(fn N)" t nil)(autoload '+doom-dashboard/backward-button "~/.doom/modules/ui/doom-dashboard/autoload" "Like `backward-button', but don't wrap.

(fn N)" t nil)(define-obsolete-function-alias 'set-pretty-symbols! 'set-ligatures! "3.0.0")(progn (autoload 'set-ligatures! "~/.doom/modules/ui/ligatures/autoload/ligatures.el" "Associates string patterns with icons in certain major-modes.

  MODES is a major mode symbol or a list of them.
  PLIST is a property list whose keys must match keys in
`+ligatures-extra-symbols', and whose values are strings representing the text
to be replaced with that symbol. If the car of PLIST is nil, then unset any
pretty symbols previously defined for MODES.

This function accepts one special property:

  :alist ALIST
    Appends ALIST to `prettify-symbols-alist' literally, without mapping text to
    `+ligatures-extra-symbols'.

For example, the rule for emacs-lisp-mode is very simple:

  (set-ligatures! 'emacs-lisp-mode
    :lambda \"lambda\")

This will replace any instances of \"lambda\" in emacs-lisp-mode with the symbol
assicated with :lambda in `+ligatures-extra-symbols'.

Pretty symbols can be unset for emacs-lisp-mode with:

  (set-ligatures! 'emacs-lisp-mode nil)

(fn MODES &rest PLIST)" nil nil) (function-put 'set-ligatures! 'lisp-indent-function 'defun))(put 'set-ligatures! 'doom-module '(:ui . ligatures))(autoload '+modeline-resize-for-font-h "~/.doom/modules/ui/modeline/autoload" "Adjust the modeline's height when the font size is changed by
`doom/increase-font-size' or `doom/decrease-font-size'.

Meant for `doom-change-font-size-hook'." nil nil)(autoload '+modeline-update-env-in-all-windows-h "~/.doom/modules/ui/modeline/autoload" "Update version strings in all buffers.

(fn &rest _)" nil nil)(autoload '+modeline-clear-env-in-all-windows-h "~/.doom/modules/ui/modeline/autoload" "Blank out version strings in all buffers.

(fn &rest _)" nil nil)(autoload '+popup--init "~/.doom/modules/ui/popup/autoload/popup" "Initializes a popup window. Run any time a popup is opened. It sets the
default window parameters for popup windows, clears leftover transient timers
and enables `+popup-buffer-mode'.

(fn WINDOW &optional ALIST)" nil nil)(autoload '+popup-buffer-p "~/.doom/modules/ui/popup/autoload/popup" "Return non-nil if BUFFER is a popup buffer. Defaults to the current buffer.

(fn &optional BUFFER)" nil nil)(autoload '+popup-window-p "~/.doom/modules/ui/popup/autoload/popup" "Return non-nil if WINDOW is a popup window. Defaults to the current window.

(fn &optional WINDOW)" nil nil)(autoload '+popup-buffer "~/.doom/modules/ui/popup/autoload/popup" "Open BUFFER in a popup window. ALIST describes its features.

(fn BUFFER &optional ALIST)" nil nil)(autoload '+popup-parameter "~/.doom/modules/ui/popup/autoload/popup" "Fetch the window PARAMETER (symbol) of WINDOW

(fn PARAMETER &optional WINDOW)" nil nil)(autoload '+popup-parameter-fn "~/.doom/modules/ui/popup/autoload/popup" "Fetch the window PARAMETER (symbol) of WINDOW. If it is a function, run it
with ARGS to get its return value.

(fn PARAMETER &optional WINDOW &rest ARGS)" nil nil)(autoload '+popup-windows "~/.doom/modules/ui/popup/autoload/popup" "Returns a list of all popup windows." nil nil)(autoload '+popup-shrink-to-fit "~/.doom/modules/ui/popup/autoload/popup" "Shrinks WINDOW to fit the buffer contents, if the buffer isn't empty.

Uses `shrink-window-if-larger-than-buffer'.

(fn &optional WINDOW)" nil nil)(autoload '+popup-alist-from-window-state "~/.doom/modules/ui/popup/autoload/popup" "Convert window STATE (from `window-state-get') to a `display-buffer' alist.

(fn STATE)" nil nil)(autoload '+popup-adjust-fringes-h "~/.doom/modules/ui/popup/autoload/popup" "Hides the fringe in popup windows, restoring them if `+popup-buffer-mode' is
disabled." nil nil)(autoload '+popup-adjust-margins-h "~/.doom/modules/ui/popup/autoload/popup" "Creates padding for the popup window determined by `+popup-margin-width',
restoring it if `+popup-buffer-mode' is disabled." nil nil)(autoload '+popup-set-modeline-on-enable-h "~/.doom/modules/ui/popup/autoload/popup" "Don't show modeline in popup windows without a `modeline' window-parameter.
Possible values for this parameter are:

  t            show the mode-line as normal
  nil          hide the modeline entirely (the default)
  a function   `mode-line-format' is set to its return value

Any non-nil value besides the above will be used as the raw value for
`mode-line-format'." nil nil)(autoload '+popup-unset-modeline-on-disable-h "~/.doom/modules/ui/popup/autoload/popup" "Restore the modeline when `+popup-buffer-mode' is deactivated." nil nil)(autoload '+popup-close-on-escape-h "~/.doom/modules/ui/popup/autoload/popup" "If called inside a popup, try to close that popup window (see
`+popup/close'). If called outside, try to close all popup windows (see
`+popup/close-all')." nil nil)(autoload '+popup-cleanup-rules-h "~/.doom/modules/ui/popup/autoload/popup" "Cleans up any duplicate popup rules." t nil)(autoload '+popup-kill-buffer-hook-h "~/.doom/modules/ui/popup/autoload/popup" "TODO" nil nil)(defalias 'other-popup #'+popup/other)(autoload '+popup/buffer "~/.doom/modules/ui/popup/autoload/popup" "Open this buffer in a popup window." t nil)(autoload '+popup/other "~/.doom/modules/ui/popup/autoload/popup" "Cycle through popup windows, like `other-window'. Ignores regular windows." t nil)(autoload '+popup/close "~/.doom/modules/ui/popup/autoload/popup" "Close WINDOW, if it's a popup window.

This will do nothing if the popup's `quit' window parameter is either nil or
'other. This window parameter is ignored if FORCE-P is non-nil.

(fn &optional WINDOW FORCE-P)" t nil)(autoload '+popup/close-all "~/.doom/modules/ui/popup/autoload/popup" "Close all open popup windows.

This will ignore popups with an `quit' parameter that is either nil or 'current.
This window parameter is ignored if FORCE-P is non-nil.

(fn &optional FORCE-P)" t nil)(autoload '+popup/toggle "~/.doom/modules/ui/popup/autoload/popup" "Toggle any visible popups.
If no popups are available, display the *Messages* buffer in a popup window." t nil)(autoload '+popup/restore "~/.doom/modules/ui/popup/autoload/popup" "Restore the last popups that were closed, if any." t nil)(autoload '+popup/raise "~/.doom/modules/ui/popup/autoload/popup" "Raise the current popup window into a regular window and
return it. If prefix ARG, raise the current popup into a new
window and return that window.

(fn WINDOW &optional ARG)" t nil)(autoload '+popup/diagnose "~/.doom/modules/ui/popup/autoload/popup" "Reveal what popup rule will be used for the current buffer." t nil)(autoload '+popup-close-a "~/.doom/modules/ui/popup/autoload/popup" "TODO

(fn &rest _)" nil nil)(autoload '+popup-save-a "~/.doom/modules/ui/popup/autoload/popup" "Sets aside all popups before executing the original function, usually to
prevent the popup(s) from messing up the UI (or vice versa).

(fn FN &rest ARGS)" nil nil)(autoload '+popup-display-buffer-fullframe-fn "~/.doom/modules/ui/popup/autoload/popup" "Displays the buffer fullscreen.

(fn BUFFER ALIST)" nil nil)(autoload '+popup-display-buffer-stacked-side-window-fn "~/.doom/modules/ui/popup/autoload/popup" "A `display-buffer' action that serves as an alternative to
`display-buffer-in-side-window', but allows for stacking popups with the `vslot'
alist entry.

Accepts the same arguments as `display-buffer-in-side-window'. You must set
`window--sides-inhibit-check' to non-nil for this work properly.

(fn BUFFER ALIST)" nil nil)(defvar +popup--display-buffer-alist nil)(defvar +popup-defaults (list :side 'bottom :height 0.16 :width 40 :quit t :select #'ignore :ttl 5) "Default properties for popup rules defined with `set-popup-rule!'.")(autoload '+popup-make-rule "~/.doom/modules/ui/popup/autoload/settings" "

(fn PREDICATE PLIST)" nil nil)(progn (autoload 'set-popup-rule! "~/.doom/modules/ui/popup/autoload/settings.el" "Define a popup rule.

These rules affect buffers displayed with `pop-to-buffer' and `display-buffer'
(or their siblings). Buffers displayed with `switch-to-buffer' (and its
variants) will not be affected by these rules (as they are unaffected by
`display-buffer-alist', which powers the popup management system).

PREDICATE can be either a) a regexp string (matched against the buffer's name)
or b) a function that takes two arguments (a buffer name and the ACTION argument
of `display-buffer') and returns a boolean.

PLIST can be made up of any of the following properties:

:ignore BOOL
  If BOOL is non-nil, popups matching PREDICATE will not be handled by the popup
  system. Use this for buffers that have their own window management system like
  magit or helm.

:actions ACTIONS
  ACTIONS is a list of functions or an alist containing (FUNCTION . ALIST). See
  `display-buffer''s second argument for more information on its format and what
  it accepts. If omitted, `+popup-default-display-buffer-actions' is used.

:side 'bottom|'top|'left|'right
  Which side of the frame to open the popup on. This is only respected if
  `+popup-display-buffer-stacked-side-window-fn' or `display-buffer-in-side-window'
  is in :actions or `+popup-default-display-buffer-actions'.

:size/:width/:height FLOAT|INT|FN
  Determines the size of the popup. If more than one of these size properties are
  given :size always takes precedence, and is mapped with window-width or
  window-height depending on what :side the popup is opened. Setting a height
  for a popup that opens on the left or right is harmless, but comes into play
  if two popups occupy the same :vslot.

  If a FLOAT (0 < x < 1), the number represents how much of the window will be
    consumed by the popup (a percentage).
  If an INT, the number determines the size in lines (height) or units of
    character width (width).
  If a function, it takes one argument: the popup window, and can do whatever it
    wants with it, typically resize it, like `+popup-shrink-to-fit'.

:slot/:vslot INT
  (This only applies to popups with a :side and only if :actions is blank or
  contains the `+popup-display-buffer-stacked-side-window-fn' action) These control
  how multiple popups are laid out. INT can be any integer, positive and
  negative.

  :slot controls lateral positioning (e.g. the horizontal positioning for
    top/bottom popups, or vertical positioning for left/right popups).
  :vslot controls popup stacking (from the edge of the frame toward the center).

  Let's assume popup A and B are opened with :side 'bottom, in that order.
    If they possess the same :slot and :vslot, popup B will replace popup A.
    If popup B has a higher :slot, it will open to the right of popup A.
    If popup B has a lower :slot, it will open to the left of popup A.
    If popup B has a higher :vslot, it will open above popup A.
    If popup B has a lower :vslot, it will open below popup A.

:ttl INT|BOOL|FN
  Stands for time-to-live. It can be t, an integer, nil or a function. This
  controls how (and if) the popup system will clean up after the popup.

  If any non-zero integer, wait that many seconds before killing the buffer (and
    any associated processes).
  If 0, the buffer is immediately killed.
  If nil, the buffer won't be killed and is left to its own devices.
  If t, resort to the default :ttl in `+popup-defaults'. If none exists, this is
    the same as nil.
  If a function, it takes one argument: the target popup buffer. The popup
    system does nothing else and ignores the function's return value.

:quit FN|BOOL|'other|'current
  Can be t, 'other, 'current, nil, or a function. This determines the behavior
  of the ESC/C-g keys in or outside of popup windows.

  If t, close the popup if ESC/C-g is pressed anywhere.
  If 'other, close this popup if ESC/C-g is pressed outside of any popup. This
    is great for popups you may press ESC/C-g a lot in.
  If 'current, close the current popup if ESC/C-g is pressed from inside of the
    popup. This makes it harder to accidentally close a popup until you really
    want to.
  If nil, pressing ESC/C-g will never close this popup.
  If a function, it takes one argument: the to-be-closed popup window, and is
    run when ESC/C-g is pressed while that popup is open. It must return one of
    the other values to determine the fate of the popup.

:select BOOL|FN
  Can be a boolean or function. The boolean determines whether to focus the
  popup window after it opens (non-nil) or focus the origin window (nil).

  If a function, it takes two arguments: the popup window and originating window
    (where you were before the popup opened). The popup system does nothing else
    and ignores the function's return value.

:modeline BOOL|FN|LIST
  Can be t (show the default modeline), nil (show no modeline), a function that
  returns a modeline format or a valid value for `mode-line-format' to be used
  verbatim. The function takes no arguments and is run in the context of the
  popup buffer.

:autosave BOOL|FN
  This parameter determines what to do with modified buffers when closing popup
  windows. It accepts t, 'ignore, a function or nil.

  If t, no prompts. Just save them automatically (if they're file-visiting
    buffers). Same as 'ignore for non-file-visiting buffers.
  If nil (the default), prompt the user what to do if the buffer is
    file-visiting and modified.
  If 'ignore, no prompts, no saving. Just silently kill it.
  If a function, it is run with one argument: the popup buffer, and must return
    non-nil to save or nil to do nothing (but no prompts).

:parameters ALIST
  An alist of custom window parameters. See `(elisp)Window Parameters'.

If any of these are omitted, defaults derived from `+popup-defaults' will be
used.

(fn PREDICATE &key IGNORE ACTIONS SIDE SIZE WIDTH HEIGHT SLOT VSLOT TTL QUIT SELECT MODELINE AUTOSAVE PARAMETERS)" nil nil) (function-put 'set-popup-rule! 'lisp-indent-function 'defun))(put 'set-popup-rule! 'doom-module '(:ui . popup))(progn (autoload 'set-popup-rules! "~/.doom/modules/ui/popup/autoload/settings.el" "Defines multiple popup rules.

Every entry in RULESETS should be a list of alists where the CAR is the
predicate and CDR is a plist. See `set-popup-rule!' for details on the predicate
and plist.

Example:

  (set-popup-rules!
    '((\"^ \\*\" :slot 1 :vslot -1 :size #'+popup-shrink-to-fit)
      (\"^\\*\"  :slot 1 :vslot -1 :select t))
    '((\"^\\*Completions\" :slot -1 :vslot -2 :ttl 0)
      (\"^\\*Compil\\(?:ation\\|e-Log\\)\" :size 0.3 :ttl 0 :quit t)))

(fn &rest RULESETS)" nil nil) (function-put 'set-popup-rules! 'lisp-indent-function '0))(put 'set-popup-rules! 'doom-module '(:ui . popup))(defalias '+vc-gutter/stage-hunk #'git-gutter:stage-hunk)(defalias '+vc-gutter/revert-hunk #'git-gutter:revert-hunk)(defalias '+vc-gutter/next-hunk #'git-gutter:next-hunk)(defalias '+vc-gutter/previous-hunk #'git-gutter:previous-hunk)(add-hook! '(prog-mode-hook text-mode-hook conf-mode-hook) #'vi-tilde-fringe-mode)(autoload '+workspace:save "~/.doom/modules/ui/workspaces/autoload/evil" nil t)(autoload '+workspace:load "~/.doom/modules/ui/workspaces/autoload/evil" nil t)(autoload '+workspace:new "~/.doom/modules/ui/workspaces/autoload/evil" nil t)(autoload '+workspace:rename "~/.doom/modules/ui/workspaces/autoload/evil" nil t)(autoload '+workspace:delete "~/.doom/modules/ui/workspaces/autoload/evil" nil t)(autoload '+workspace:switch-next "~/.doom/modules/ui/workspaces/autoload/evil" nil t)(autoload '+workspace:switch-previous "~/.doom/modules/ui/workspaces/autoload/evil" nil t)(defface +workspace-tab-selected-face '((t (:inherit highlight))) "The face for selected tabs displayed by `+workspace/display'" :group 'persp-mode)(defface +workspace-tab-face '((t (:inherit default))) "The face for selected tabs displayed by `+workspace/display'" :group 'persp-mode)(defalias #'+workspace-p #'perspective-p "Return t if OBJ is a perspective hash table.")(autoload '+workspace-exists-p "~/.doom/modules/ui/workspaces/autoload/workspaces" "Returns t if NAME is the name of an existing workspace.

(fn NAME)" nil nil)(defalias #'+workspace-contains-buffer-p #'persp-contain-buffer-p "Return non-nil if BUFFER is in WORKSPACE (defaults to current workspace).")(defalias #'+workspace-current #'get-current-persp "Return the currently active workspace.")(autoload '+workspace-get "~/.doom/modules/ui/workspaces/autoload/workspaces" "Return a workspace named NAME. Unless NOERROR is non-nil, this throws an
error if NAME doesn't exist.

(fn NAME &optional NOERROR)" nil nil)(autoload '+workspace-current-name "~/.doom/modules/ui/workspaces/autoload/workspaces" "Get the name of the current workspace." nil nil)(autoload '+workspace-list "~/.doom/modules/ui/workspaces/autoload/workspaces" "Return a list of workspace structs (satisifes `+workspace-p')." nil nil)(autoload '+workspace-list-names "~/.doom/modules/ui/workspaces/autoload/workspaces" "Return the list of names of open workspaces." nil nil)(autoload '+workspace-buffer-list "~/.doom/modules/ui/workspaces/autoload/workspaces" "Return a list of buffers in PERSP.

PERSP can be a string (name of a workspace) or a workspace (satisfies
`+workspace-p'). If nil or omitted, it defaults to the current workspace.

(fn &optional PERSP)" nil nil)(autoload '+workspace-orphaned-buffer-list "~/.doom/modules/ui/workspaces/autoload/workspaces" "Return a list of buffers that aren't associated with any perspective." nil nil)(autoload '+workspace-load "~/.doom/modules/ui/workspaces/autoload/workspaces" "Loads a single workspace (named NAME) into the current session. Can only
retrieve perspectives that were explicitly saved with `+workspace-save'.

Returns t if successful, nil otherwise.

(fn NAME)" nil nil)(autoload '+workspace-save "~/.doom/modules/ui/workspaces/autoload/workspaces" "Saves a single workspace (NAME) from the current session. Can be loaded again
with `+workspace-load'. NAME can be the string name of a workspace or its
perspective hash table.

Returns t on success, nil otherwise.

(fn NAME)" nil nil)(autoload '+workspace-new "~/.doom/modules/ui/workspaces/autoload/workspaces" "Create a new workspace named NAME. If one already exists, return nil.
Otherwise return t on success, nil otherwise.

(fn NAME)" nil nil)(autoload '+workspace-rename "~/.doom/modules/ui/workspaces/autoload/workspaces" "Rename the current workspace named NAME to NEW-NAME. Returns old name on
success, nil otherwise.

(fn NAME NEW-NAME)" nil nil)(autoload '+workspace-delete "~/.doom/modules/ui/workspaces/autoload/workspaces" "Delete the workspace denoted by WORKSPACE, which can be the name of a perspective
or its hash table. If INHIBIT-KILL-P is non-nil, don't kill this workspace's
buffers.

(fn WORKSPACE &optional INHIBIT-KILL-P)" nil nil)(autoload '+workspace-switch "~/.doom/modules/ui/workspaces/autoload/workspaces" "Switch to another workspace named NAME (a string).

If AUTO-CREATE-P is non-nil, create the workspace if it doesn't exist, otherwise
throws an error.

(fn NAME &optional AUTO-CREATE-P)" nil nil)(defalias '+workspace/restore-last-session #'doom/quickload-session)(autoload '+workspace/load "~/.doom/modules/ui/workspaces/autoload/workspaces" "Load a workspace and switch to it. If called with C-u, try to reload the
current workspace (by name) from session files.

(fn NAME)" t nil)(autoload '+workspace/save "~/.doom/modules/ui/workspaces/autoload/workspaces" "Save the current workspace. If called with C-u, autosave the current
workspace.

(fn NAME)" t nil)(autoload '+workspace/rename "~/.doom/modules/ui/workspaces/autoload/workspaces" "Rename the current workspace.

(fn NEW-NAME)" t nil)(autoload '+workspace/delete "~/.doom/modules/ui/workspaces/autoload/workspaces" "Delete this workspace. If called with C-u, prompts you for the name of the
workspace to delete.

(fn NAME)" t nil)(autoload '+workspace/kill-session "~/.doom/modules/ui/workspaces/autoload/workspaces" "Delete the current session, all workspaces, windows and their buffers.

(fn &optional INTERACTIVE)" t nil)(autoload '+workspace/kill-session-and-quit "~/.doom/modules/ui/workspaces/autoload/workspaces" "Kill emacs without saving anything." t nil)(autoload '+workspace/new "~/.doom/modules/ui/workspaces/autoload/workspaces" "Create a new workspace named NAME. If CLONE-P is non-nil, clone the current
workspace, otherwise the new workspace is blank.

(fn &optional NAME CLONE-P)" t nil)(autoload '+workspace/new-named "~/.doom/modules/ui/workspaces/autoload/workspaces" "Create a new workspace with a given NAME.

(fn NAME)" t nil)(autoload '+workspace/switch-to "~/.doom/modules/ui/workspaces/autoload/workspaces" "Switch to a workspace at a given INDEX. A negative number will start from the
end of the workspace list.

(fn INDEX)" t nil)(dotimes (i 9) (defalias (intern (format "+workspace/switch-to-%d" i)) (lambda nil (interactive) (+workspace/switch-to i)) (format "Switch to workspace #%d" (1+ i))))(autoload '+workspace/switch-to-final "~/.doom/modules/ui/workspaces/autoload/workspaces" "Switch to the final workspace in open workspaces." t nil)(autoload '+workspace/other "~/.doom/modules/ui/workspaces/autoload/workspaces" "Switch to the last activated workspace." t nil)(autoload '+workspace/cycle "~/.doom/modules/ui/workspaces/autoload/workspaces" "Cycle n workspaces to the right (default) or left.

(fn N)" t nil)(autoload '+workspace/switch-left "~/.doom/modules/ui/workspaces/autoload/workspaces" nil t nil)(autoload '+workspace/switch-right "~/.doom/modules/ui/workspaces/autoload/workspaces" nil t nil)(autoload '+workspace/close-window-or-workspace "~/.doom/modules/ui/workspaces/autoload/workspaces" "Close the selected window. If it's the last window in the workspace, either
close the workspace (as well as its associated frame, if one exists) and move to
the next." t nil)(autoload '+workspace/swap-left "~/.doom/modules/ui/workspaces/autoload/workspaces" "Swap the current workspace with the COUNTth workspace on its left.

(fn &optional COUNT)" t nil)(autoload '+workspace/swap-right "~/.doom/modules/ui/workspaces/autoload/workspaces" "Swap the current workspace with the COUNTth workspace on its right.

(fn &optional COUNT)" t nil)(autoload '+workspace-message "~/.doom/modules/ui/workspaces/autoload/workspaces" "Show an 'elegant' message in the echo area next to a listing of workspaces.

(fn MESSAGE &optional TYPE)" nil nil)(autoload '+workspace-error "~/.doom/modules/ui/workspaces/autoload/workspaces" "Show an 'elegant' error in the echo area next to a listing of workspaces.

(fn MESSAGE &optional NOERROR)" nil nil)(autoload '+workspace/display "~/.doom/modules/ui/workspaces/autoload/workspaces" "Display a list of workspaces (like tabs) in the echo area." t nil)(autoload '+workspaces-delete-associated-workspace-h "~/.doom/modules/ui/workspaces/autoload/workspaces" "Delete workspace associated with current frame.
A workspace gets associated with a frame when a new frame is interactively
created.

(fn &optional FRAME)" nil nil)(autoload '+workspaces-associate-frame-fn "~/.doom/modules/ui/workspaces/autoload/workspaces" "Create a blank, new perspective and associate it with FRAME.

(fn FRAME &optional NEW-FRAME-P)" nil nil)(autoload '+workspaces-set-project-action-fn "~/.doom/modules/ui/workspaces/autoload/workspaces" "A `projectile-switch-project-action' that sets the project directory for
`+workspaces-switch-to-project-h'." nil nil)(autoload '+workspaces-switch-to-project-h "~/.doom/modules/ui/workspaces/autoload/workspaces" "Creates a workspace dedicated to a new project. If one already exists, switch
to it. If in the main workspace and it's empty, recycle that workspace, without
renaming it.

Afterwords, runs `+workspaces-switch-project-function'. By default, this prompts
the user to open a file in the new project.

This be hooked to `projectile-after-switch-project-hook'.

(fn &optional DIR)" nil nil)(autoload '+workspaces-save-tab-bar-data-h "~/.doom/modules/ui/workspaces/autoload/workspaces" "Save the current workspace's tab bar data.

(fn _)" nil nil)(autoload '+workspaces-load-tab-bar-data-h "~/.doom/modules/ui/workspaces/autoload/workspaces" "Restores the tab bar data of the workspace we have just switched to.

(fn _)" nil nil)(autoload '+workspaces-autosave-real-buffers-a "~/.doom/modules/ui/workspaces/autoload/workspaces" "Don't autosave if no real buffers are open.

(fn FN &rest ARGS)" nil nil)(autoload '+evil-escape-a "~/.doom/modules/editor/evil/autoload/advice" "Call `doom/escape' if `evil-force-normal-state' is called interactively.

(fn &rest _)" nil nil)(autoload '+evil-replace-filename-modifiers-a "~/.doom/modules/editor/evil/autoload/advice" "Take a path and resolve any vim-like filename modifiers in it. This adds
support for most vim file modifiers, as well as:

  %:P   Resolves to `doom-project-root'.

See http://vimdoc.sourceforge.net/htmldoc/cmdline.html#filename-modifiers for
more information on modifiers.

(fn FILE-NAME)" nil nil)(autoload '+evil--insert-newline-below-and-respect-comments-a "~/.doom/modules/editor/evil/autoload/advice" "

(fn FN COUNT)" nil nil)(autoload '+evil--insert-newline-above-and-respect-comments-a "~/.doom/modules/editor/evil/autoload/advice" "

(fn FN COUNT)" nil nil)(autoload '+evil-window-split-a "~/.doom/modules/editor/evil/autoload/advice" nil t)(autoload '+evil-window-vsplit-a "~/.doom/modules/editor/evil/autoload/advice" nil t)(autoload '+evil-join-a "~/.doom/modules/editor/evil/autoload/advice" nil nil)(autoload '+evil--fix-dabbrev-in-minibuffer-h "~/.doom/modules/editor/evil/autoload/advice" "Make `try-expand-dabbrev' from `hippie-expand' work in minibuffer. See
`he-dabbrev-beg', so we need to redefine syntax for '/'." nil nil)(autoload '+evil--embrace-get-pair "~/.doom/modules/editor/evil/autoload/embrace" "

(fn CHAR)" nil nil)(autoload '+evil--embrace-escaped "~/.doom/modules/editor/evil/autoload/embrace" "Backslash-escaped surround character support for embrace." nil nil)(autoload '+evil--embrace-latex "~/.doom/modules/editor/evil/autoload/embrace" "LaTeX command support for embrace." nil nil)(autoload '+evil--embrace-elisp-fn "~/.doom/modules/editor/evil/autoload/embrace" "Elisp function support for embrace." nil nil)(autoload '+evil--embrace-angle-brackets "~/.doom/modules/editor/evil/autoload/embrace" "Type/generic angle brackets." nil nil)(autoload '+evil/shift-right "~/.doom/modules/editor/evil/autoload/evil" "vnoremap < <gv" t nil)(autoload '+evil/shift-left "~/.doom/modules/editor/evil/autoload/evil" "vnoremap > >gv" t nil)(autoload '+evil/alt-paste "~/.doom/modules/editor/evil/autoload/evil" "Call `evil-paste-after' but invert `evil-kill-on-visual-paste'.
By default, this replaces the selection with what's in the clipboard without
replacing its contents." t nil)(autoload '+evil/window-move-left "~/.doom/modules/editor/evil/autoload/evil" "Swap windows to the left." t nil)(autoload '+evil/window-move-right "~/.doom/modules/editor/evil/autoload/evil" "Swap windows to the right" t nil)(autoload '+evil/window-move-up "~/.doom/modules/editor/evil/autoload/evil" "Swap windows upward." t nil)(autoload '+evil/window-move-down "~/.doom/modules/editor/evil/autoload/evil" "Swap windows downward." t nil)(autoload '+evil/window-split-and-follow "~/.doom/modules/editor/evil/autoload/evil" "Split current window horizontally, then focus new window.
If `evil-split-window-below' is non-nil, the new window isn't focused." t nil)(autoload '+evil/window-vsplit-and-follow "~/.doom/modules/editor/evil/autoload/evil" "Split current window vertically, then focus new window.
If `evil-vsplit-window-right' is non-nil, the new window isn't focused." t nil)(autoload '+evil:apply-macro "~/.doom/modules/editor/evil/autoload/evil" nil t)(autoload '+evil:retab "~/.doom/modules/editor/evil/autoload/evil" nil t)(autoload '+evil:narrow-buffer "~/.doom/modules/editor/evil/autoload/evil" nil t)(autoload '+evil:yank-unindented "~/.doom/modules/editor/evil/autoload/evil" nil t)(autoload '+evil-delete "~/.doom/modules/editor/evil/autoload/evil" nil t)(progn (autoload 'set-evil-initial-state! "~/.doom/modules/editor/evil/autoload/evil.el" "Set the initialize STATE of MODES using `evil-set-initial-state'.

(fn MODES STATE)" nil nil) (function-put 'set-evil-initial-state! 'lisp-indent-function 'defun))(put 'set-evil-initial-state! 'doom-module '(:editor . evil))(autoload '+evil-ex-regexp-match "~/.doom/modules/editor/evil/autoload/ex" "

(fn FLAG &optional ARG INVERT)" nil nil)(autoload '+evil:align "~/.doom/modules/editor/evil/autoload/ex" nil t)(autoload '+evil:align-right "~/.doom/modules/editor/evil/autoload/ex" nil t)(autoload '+evil:open-scratch-buffer "~/.doom/modules/editor/evil/autoload/ex" nil t)(autoload '+evil:pwd "~/.doom/modules/editor/evil/autoload/ex" nil t)(autoload '+evil:make "~/.doom/modules/editor/evil/autoload/ex" nil t)(autoload '+evil:compile "~/.doom/modules/editor/evil/autoload/ex" nil t)(autoload '+evil:reverse-lines "~/.doom/modules/editor/evil/autoload/ex" nil t)(autoload '+evil:cd "~/.doom/modules/editor/evil/autoload/ex" nil t)(autoload '+evil:kill-all-buffers "~/.doom/modules/editor/evil/autoload/ex" nil t)(autoload '+evil:kill-matching-buffers "~/.doom/modules/editor/evil/autoload/ex" nil t)(autoload '+evil:help "~/.doom/modules/editor/evil/autoload/ex" nil t)(autoload '+evil:read "~/.doom/modules/editor/evil/autoload/ex" nil t)(autoload '+evil:delete-this-file "~/.doom/modules/editor/evil/autoload/files" nil t)(autoload '+evil:move-this-file "~/.doom/modules/editor/evil/autoload/files" nil t)(autoload '+evil:copy-this-file "~/.doom/modules/editor/evil/autoload/files" nil t)(autoload '+evil:whole-buffer-txtobj "~/.doom/modules/editor/evil/autoload/textobjects" nil nil)(autoload '+evil:defun-txtobj "~/.doom/modules/editor/evil/autoload/textobjects" nil nil)(autoload '+evil:inner-url-txtobj "~/.doom/modules/editor/evil/autoload/textobjects" nil nil)(autoload '+evil:outer-url-txtobj "~/.doom/modules/editor/evil/autoload/textobjects" nil nil)(autoload '+evil:inner-any-quote "~/.doom/modules/editor/evil/autoload/textobjects" nil nil)(autoload '+evil:outer-any-quote "~/.doom/modules/editor/evil/autoload/textobjects" nil nil)(autoload '+evil/next-beginning-of-method "~/.doom/modules/editor/evil/autoload/unimpaired" "Jump to the beginning of the COUNT-th method/function after point.

(fn COUNT)" t nil)(autoload '+evil/previous-beginning-of-method "~/.doom/modules/editor/evil/autoload/unimpaired" "Jump to the beginning of the COUNT-th method/function before point.

(fn COUNT)" t nil)(defalias #'+evil/next-end-of-method #'end-of-defun "Jump to the end of the COUNT-th method/function after point.")(autoload '+evil/previous-end-of-method "~/.doom/modules/editor/evil/autoload/unimpaired" "Jump to the end of the COUNT-th method/function before point.

(fn COUNT)" t nil)(autoload '+evil/next-preproc-directive "~/.doom/modules/editor/evil/autoload/unimpaired" "Jump to the COUNT-th preprocessor directive after point.

By default, this only recognizes C preproc directives. To change this see
`+evil-preprocessor-regexp'.

(fn COUNT)" t nil)(autoload '+evil/previous-preproc-directive "~/.doom/modules/editor/evil/autoload/unimpaired" "Jump to the COUNT-th preprocessor directive before point.

See `+evil/next-preproc-directive' for details.

(fn COUNT)" t nil)(autoload '+evil/next-comment "~/.doom/modules/editor/evil/autoload/unimpaired" "Jump to the beginning of the COUNT-th commented region after point.

(fn COUNT)" t nil)(autoload '+evil/previous-comment "~/.doom/modules/editor/evil/autoload/unimpaired" "Jump to the beginning of the COUNT-th commented region before point.

(fn COUNT)" t nil)(autoload '+evil/insert-newline-below "~/.doom/modules/editor/evil/autoload/unimpaired" "Insert COUNT blank line(s) below current line. Does not change modes.

(fn COUNT)" t nil)(autoload '+evil/insert-newline-above "~/.doom/modules/editor/evil/autoload/unimpaired" "Insert COUNT blank line(s) above current line. Does not change modes.

(fn COUNT)" t nil)(autoload '+evil/next-frame "~/.doom/modules/editor/evil/autoload/unimpaired" "Focus next frame.

(fn COUNT)" t nil)(autoload '+evil/previous-frame "~/.doom/modules/editor/evil/autoload/unimpaired" "Focus previous frame.

(fn COUNT)" t nil)(autoload '+evil/next-file "~/.doom/modules/editor/evil/autoload/unimpaired" "Open file following this one, alphabetically, in the same directory.

(fn COUNT)" t nil)(autoload '+evil/previous-file "~/.doom/modules/editor/evil/autoload/unimpaired" "Open file preceding this one, alphabetically, in the same directory.

(fn COUNT)" t nil)(autoload '+evil:url-encode "~/.doom/modules/editor/evil/autoload/unimpaired" nil t)(autoload '+evil:url-decode "~/.doom/modules/editor/evil/autoload/unimpaired" nil t)(autoload '+evil:c-string-encode "~/.doom/modules/editor/evil/autoload/unimpaired" nil t)(autoload '+evil:c-string-decode "~/.doom/modules/editor/evil/autoload/unimpaired" nil t)(autoload '+evil/reselect-paste "~/.doom/modules/editor/evil/autoload/unimpaired" "Return to visual mode and reselect the last pasted region." t nil)(autoload '+file-templates--expand "~/.doom/modules/editor/file-templates/autoload" "Auto insert a yasnippet snippet into current file and enter insert mode (if
evil is loaded and enabled).

(fn PRED &key PROJECT MODE TRIGGER IGNORE WHEN)" nil nil)(autoload '+file-templates-get-short-path "~/.doom/modules/editor/file-templates/autoload" "Fetches a short file path for the header in Doom module templates." nil nil)(autoload '+file-templates-module-for-path "~/.doom/modules/editor/file-templates/autoload" "Generate a title for a doom module's readme at PATH.

(fn &optional PATH)" nil nil)(autoload '+file-templates/insert-license "~/.doom/modules/editor/file-templates/autoload" "Insert a license file template into the current file." t nil)(autoload '+file-templates/debug "~/.doom/modules/editor/file-templates/autoload" "Tests the current buffer and outputs the file template rule most appropriate
for it. This is used for testing." t nil)(progn (autoload 'set-file-template! "~/.doom/modules/editor/file-templates/autoload.el" "Register a file template.

PRED can either be a regexp string or a major mode symbol. PLIST may contain
these properties:

  :when FUNCTION
    Provides a secondary predicate. This function takes no arguments and is
    executed from within the target buffer. If it returns nil, this rule will be
    skipped over.
  :trigger STRING|FUNCTION
    If a string, this is the yasnippet trigger keyword used to trigger the
      target snippet.
    If a function, this function will be run in the context of the buffer to
      insert a file template into. It is given no arguments and must insert text
      into the current buffer manually.
    If omitted, `+file-templates-default-trigger' is used.
  :mode SYMBOL
    What mode to get the yasnippet snippet from. If omitted, either PRED (if
    it's a major-mode symbol) or the mode of the buffer is used.
  :project BOOL
    If non-nil, ignore this template if this buffer isn't in a project.
  :ignore BOOL
    If non-nil, don't expand any template for this file and don't test any other
    file template rule against this buffer.

(fn PRED &key WHEN TRIGGER MODE PROJECT IGNORE)" nil nil) (function-put 'set-file-template! 'lisp-indent-function 'defun))(put 'set-file-template! 'doom-module '(:editor . file-templates))(autoload 'set-file-templates! "~/.doom/modules/editor/file-templates/autoload.el" "Like `set-file-template!', but can register multiple file templates at once.

(fn &rest (PRED &key WHEN TRIGGER MODE PROJECT IGNORE))" nil nil)(put 'set-file-templates! 'doom-module '(:editor . file-templates))(autoload '+fold/toggle "~/.doom/modules/editor/fold/autoload/fold" "Toggle the fold at point.

Targets `vimmish-fold', `hideshow', `ts-fold' and `outline' folds." t nil)(autoload '+fold/open "~/.doom/modules/editor/fold/autoload/fold" "Open the folded region at point.

Targets `vimmish-fold', `hideshow', `ts-fold' and `outline' folds." t nil)(autoload '+fold/close "~/.doom/modules/editor/fold/autoload/fold" "Close the folded region at point.

Targets `vimmish-fold', `hideshow', `ts-fold' and `outline' folds." t nil)(autoload '+fold/open-all "~/.doom/modules/editor/fold/autoload/fold" "Open folds at LEVEL (or all folds if LEVEL is nil).

(fn &optional LEVEL)" t nil)(autoload '+fold/close-all "~/.doom/modules/editor/fold/autoload/fold" "Close folds at LEVEL (or all folds if LEVEL is nil).

(fn &optional LEVEL)" t nil)(autoload '+fold/next "~/.doom/modules/editor/fold/autoload/fold" "Jump to the next vimish fold, outline heading or folded region.

(fn COUNT)" t nil)(autoload '+fold/previous "~/.doom/modules/editor/fold/autoload/fold" "Jump to the previous vimish fold, outline heading or folded region.

(fn COUNT)" t nil)(autoload '+fold-hideshow-haml-forward-sexp-fn "~/.doom/modules/editor/fold/autoload/hideshow" "

(fn ARG)" nil nil)(autoload '+fold-hideshow-forward-block-by-indent-fn "~/.doom/modules/editor/fold/autoload/hideshow" "

(fn ARG)" nil nil)(autoload '+fold-hideshow-set-up-overlay-fn "~/.doom/modules/editor/fold/autoload/hideshow" "

(fn OV)" nil nil)(autoload 'set-yas-minor-mode! "~/.doom/modules/editor/snippets/autoload/settings.el" "Register minor MODES (one mode symbol or a list of them) with yasnippet so it
can have its own snippets category, if the folder exists.

(fn MODES)" nil nil)(put 'set-yas-minor-mode! 'doom-module '(:editor . snippets))(autoload '+snippets-prompt-private "~/.doom/modules/editor/snippets/autoload/snippets" "Prioritize private snippets over built-in ones if there are multiple
choices.

There are two groups of snippets in Doom Emacs. The built in ones (under
`doom-emacs-dir'; provided by Doom or its plugins) or your private snippets
(outside of `doom-eamcs-dir').

If there are multiple snippets with the same key in either camp (but not both),
you will be prompted to select one.

If there are conflicting keys across the two camps, the built-in ones are
ignored. This makes it easy to override built-in snippets with private ones.

(fn PROMPT CHOICES &optional DISPLAY-FN)" nil nil)(autoload '+snippets/goto-start-of-field "~/.doom/modules/editor/snippets/autoload/snippets" "Go to the beginning of the current field." t nil)(autoload '+snippets/goto-end-of-field "~/.doom/modules/editor/snippets/autoload/snippets" "Go to the end of the current field." t nil)(autoload '+snippets/delete-backward-char "~/.doom/modules/editor/snippets/autoload/snippets" "Prevents Yas from interfering with backspace deletion.

(fn &optional FIELD)" t nil)(autoload '+snippets/delete-forward-char-or-field "~/.doom/modules/editor/snippets/autoload/snippets" "Delete forward, or skip the current field if it's empty. This is to prevent
buggy behavior when <delete> is pressed in an empty field.

(fn &optional FIELD)" t nil)(autoload '+snippets/delete-to-start-of-field "~/.doom/modules/editor/snippets/autoload/snippets" "Delete to start-of-field.

(fn &optional FIELD)" t nil)(autoload '+snippets/find "~/.doom/modules/editor/snippets/autoload/snippets" "Open a snippet file (in all of `yas-snippet-dirs')." t nil)(autoload '+snippets/find-private "~/.doom/modules/editor/snippets/autoload/snippets" "Open a private snippet file in `+snippets-dir'." t nil)(autoload '+snippets/find-for-current-mode "~/.doom/modules/editor/snippets/autoload/snippets" "Open a snippet for this mode.

(fn TEMPLATE-UUID)" t nil)(autoload '+snippets/new "~/.doom/modules/editor/snippets/autoload/snippets" "Create a new snippet in `+snippets-dir'." t nil)(autoload '+snippets/new-alias "~/.doom/modules/editor/snippets/autoload/snippets" "Create an alias for a snippet with uuid TEMPLATE-UUID.

You will be prompted for a snippet to alias.

(fn TEMPLATE-UUID)" t nil)(autoload '+snippets/edit "~/.doom/modules/editor/snippets/autoload/snippets" "Edit a snippet with uuid TEMPLATE-UUID.

If the snippet isn't in `+snippets-dir', it will be copied there (where it will
shadow the default snippet).

(fn TEMPLATE-UUID)" t nil)(autoload '+snippets-show-hints-in-header-line-h "~/.doom/modules/editor/snippets/autoload/snippets" nil nil nil)(autoload '+snippets-enable-project-modes-h "~/.doom/modules/editor/snippets/autoload/snippets" "Automatically enable snippet libraries for project minor modes defined with
`def-project-mode!'.

(fn MODE &rest _)" nil nil)(autoload '+snippets-read-only-maybe-h "~/.doom/modules/editor/snippets/autoload/snippets" "Enable `read-only-mode' if snippet is built-in." nil nil)(autoload '+snippets-expand-on-region-a "~/.doom/modules/editor/snippets/autoload/snippets" "Fix off-by-one when expanding snippets on an evil visual region.

Also strips whitespace out of selection. Also switches to insert mode. If
`evil-local-mode' isn't enabled, or we're not in visual mode, run FN as is.

(fn FN &optional NO-CONDITION)" nil nil)(autoload '+word-wrap-mode "~/.doom/modules/editor/word-wrap/autoload" "Wrap long lines in the buffer with language-aware indentation.

This is a minor mode.  If called interactively, toggle the
`+Word-Wrap mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `+word-wrap-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

This mode configures `adaptive-wrap' and `visual-line-mode' to wrap long lines
without modifying the buffer content. This is useful when dealing with legacy
code which contains gratuitously long lines, or running emacs on your
wrist-phone.

Wrapped lines will be indented to match the preceding line. In code buffers,
lines which are not inside a string or comment will have additional indentation
according to the configuration of `+word-wrap-extra-indent'.

(fn &optional ARG)" t nil)(put '+global-word-wrap-mode 'globalized-minor-mode t)(defvar +global-word-wrap-mode nil "Non-nil if +Global-Word-Wrap mode is enabled.
See the `+global-word-wrap-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `+global-word-wrap-mode'.")(autoload '+global-word-wrap-mode "~/.doom/modules/editor/word-wrap/autoload" "Toggle +Word-Wrap mode in all buffers.
With prefix ARG, enable +Global-Word-Wrap mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

+Word-Wrap mode is enabled in all buffers where
`+word-wrap--enable-global-mode' would do it.

See `+word-wrap-mode' for more information on +Word-Wrap mode.

(fn &optional ARG)" t nil)(autoload '+dired/quit-all "~/.doom/modules/emacs/dired/autoload" "Kill all `dired-mode' buffers." t nil)(autoload '+dired-enable-git-info-h "~/.doom/modules/emacs/dired/autoload" "Enable `dired-git-info-mode' in git repos." nil nil)(progn (autoload 'set-electric! "~/.doom/modules/emacs/electric/autoload.el" "Declare that WORDS (list of strings) or CHARS (lists of chars) should trigger
electric indentation.

Enables `electric-indent-local-mode' in MODES.

(fn MODES &key WORDS CHARS)" nil nil) (function-put 'set-electric! 'lisp-indent-function 'defun))(put 'set-electric! 'doom-module '(:emacs . electric))(autoload '+vc/browse-at-remote "~/.doom/modules/emacs/vc/autoload/vc" "Open URL to current file (and line if selection is active) in browser.
If prefix ARG, negate the default value of `browse-at-remote-prefer-symbolic'.

(fn &optional ARG)" t nil)(autoload '+vc/browse-at-remote-kill "~/.doom/modules/emacs/vc/autoload/vc" "Copy URL to current file (and line if selection is active) to clipboard.
If prefix ARG, negate the default value of `browse-at-remote-prefer-symbolic'.

(fn &optional ARG)" t nil)(autoload '+vc/browse-at-remote-homepage "~/.doom/modules/emacs/vc/autoload/vc" "Open homepage for current project in browser." t nil)(autoload '+vc/browse-at-remote-kill-homepage "~/.doom/modules/emacs/vc/autoload/vc" "Copy homepage URL of current project to clipboard." t nil)(autoload 'eshell/emacs "~/.doom/modules/term/eshell/autoload/commands" "Open a FILES in Emacs.
For folks with a habit of using \"emacs\" to open files, even in eshell.

(fn &rest FILES)" nil nil)(defalias 'eshell/e #'eshell/emacs)(autoload 'eshell/cd-to-project "~/.doom/modules/term/eshell/autoload/commands" "Change to the project root of the current directory." nil nil)(autoload 'eshell/quit-and-close "~/.doom/modules/term/eshell/autoload/commands" "Quit the current eshell buffer and close the window it's in.

(fn &rest _)" nil nil)(autoload 'eshell/mkdir-and-cd "~/.doom/modules/term/eshell/autoload/commands" "Create a directory then cd into it.

(fn DIR)" nil nil)(autoload 'company-pcomplete-available "~/.doom/modules/term/eshell/autoload/company" nil nil nil)(autoload 'company-pcomplete "~/.doom/modules/term/eshell/autoload/company" "`company-mode' completion backend using `pcomplete'.

(fn COMMAND &optional ARG &rest IGNORED)" t nil)(autoload '+eshell-last-buffer "~/.doom/modules/term/eshell/autoload/eshell" "Return the last opened eshell buffer.

(fn &optional NOERROR)" nil nil)(autoload '+eshell-buffers "~/.doom/modules/term/eshell/autoload/eshell" "TODO" nil nil)(autoload '+eshell-run-command "~/.doom/modules/term/eshell/autoload/eshell" "TODO

(fn COMMAND &optional BUFFER)" nil nil)(autoload '+eshell/toggle "~/.doom/modules/term/eshell/autoload/eshell" "Toggle eshell popup window.

(fn ARG &optional COMMAND)" t nil)(autoload '+eshell/here "~/.doom/modules/term/eshell/autoload/eshell" "Open eshell in the current window.

(fn &optional COMMAND)" t nil)(autoload '+eshell/frame "~/.doom/modules/term/eshell/autoload/eshell" "Open a frame dedicated to eshell.

Once the eshell process is killed, the previous frame layout is restored.

(fn &optional COMMAND)" t nil)(autoload '+eshell/search-history "~/.doom/modules/term/eshell/autoload/eshell" "Search the eshell command history with helm, ivy or `eshell-list-history'." t nil)(autoload '+eshell/pcomplete "~/.doom/modules/term/eshell/autoload/eshell" "Use pcomplete with completion-in-region backend instead of popup window at
bottom. This ties pcomplete into ivy or helm, if they are enabled." t nil)(autoload '+eshell/quit-or-delete-char "~/.doom/modules/term/eshell/autoload/eshell" "Delete a character (ahead of the cursor) or quit eshell if there's nothing to
delete.

(fn ARG)" t nil)(autoload '+eshell/split-below "~/.doom/modules/term/eshell/autoload/eshell" "Create a new eshell window below the current one." t nil)(autoload '+eshell/split-right "~/.doom/modules/term/eshell/autoload/eshell" "Create a new eshell window to the right of the current one." t nil)(autoload '+eshell/switch-to-next "~/.doom/modules/term/eshell/autoload/eshell" "Switch to the next eshell buffer." t nil)(autoload '+eshell/switch-to-previous "~/.doom/modules/term/eshell/autoload/eshell" "Switch to the previous eshell buffer." t nil)(autoload '+eshell/switch-to-last "~/.doom/modules/term/eshell/autoload/eshell" "Switch to the last eshell buffer that was open (and is still alive)." t nil)(autoload '+eshell/switch-to "~/.doom/modules/term/eshell/autoload/eshell" "Interactively switch to another eshell buffer.

(fn BUFFER)" t nil)(autoload '+eshell/kill-and-close "~/.doom/modules/term/eshell/autoload/eshell" "Kill the current eshell buffer and close its window." t nil)(autoload '+eshell-init-h "~/.doom/modules/term/eshell/autoload/eshell" "Initialize and track this eshell buffer in `+eshell-buffers'." nil nil)(autoload '+eshell-cleanup-h "~/.doom/modules/term/eshell/autoload/eshell" "Close window (or workspace) on quit." nil nil)(autoload '+eshell-switch-workspace-fn "~/.doom/modules/term/eshell/autoload/eshell" "

(fn TYPE)" nil nil)(autoload '+eshell-save-workspace-fn "~/.doom/modules/term/eshell/autoload/eshell" "

(fn WORKSPACE TARGET)" nil nil)(autoload '+eshell:run "~/.doom/modules/term/eshell/autoload/evil" nil t)(autoload '+eshell-goto-prompt-on-insert-a "~/.doom/modules/term/eshell/autoload/evil" "Move cursor to the prompt when switching to insert mode (if point isn't
already there).

  Meant to replace `evil-collection-eshell-next-prompt-on-insert'." nil nil)(autoload '+eshell/goto-end-of-prompt "~/.doom/modules/term/eshell/autoload/evil" "Move cursor to the prompt when switching to insert mode (if point isn't
already there)." t nil)(defface +eshell-prompt-pwd '((t (:inherit font-lock-constant-face))) "TODO" :group 'eshell)(defface +eshell-prompt-git-branch '((t (:inherit font-lock-builtin-face))) "TODO" :group 'eshell)(autoload '+eshell-default-prompt-fn "~/.doom/modules/term/eshell/autoload/prompts" "Generate the prompt string for eshell. Use for `eshell-prompt-function'." nil nil)(autoload 'set-eshell-alias! "~/.doom/modules/term/eshell/autoload/settings.el" "Define aliases for eshell.

ALIASES is a flat list of alias -> command pairs. e.g.

  (set-eshell-alias!
    \"hi\"  \"echo hello world\"
    \"bye\" \"echo goodbye world\")

(fn &rest ALIASES)" nil nil)(put 'set-eshell-alias! 'doom-module '(:term . eshell))(autoload '+shell/toggle "~/.doom/modules/term/shell/autoload" "Toggle a persistent terminal popup window.

If popup is visible but unselected, selected it.
If popup is focused, kill it.

(fn &optional COMMAND)" t nil)(autoload '+shell/here "~/.doom/modules/term/shell/autoload" "Open a terminal buffer in the current window.

If already in a shell buffer, clear it and cd into the current directory.

(fn &optional COMMAND)" t nil)(autoload '+term/toggle "~/.doom/modules/term/term/autoload" "Toggle a persistent terminal popup window.

If popup is visible but unselected, select it.
If prefix ARG, recreate the term buffer.

(fn ARG)" t nil)(defalias '+term/here #'multi-term)(autoload '+vterm/toggle "~/.doom/modules/term/vterm/autoload" "Toggles a terminal popup window at project root.

If prefix ARG is non-nil, recreate vterm buffer in the current project's root.

Returns the vterm buffer.

(fn ARG)" t nil)(autoload '+vterm/here "~/.doom/modules/term/vterm/autoload" "Open a terminal buffer in the current window at project root.

If prefix ARG is non-nil, cd into `default-directory' instead of project root.

Returns the vterm buffer.

(fn ARG)" t nil)(autoload '+syntax-init-popups-h "~/.doom/modules/checkers/syntax/autoload" "Activate `flycheck-posframe-mode' if available and in GUI Emacs.
Activate `flycheck-popup-tip-mode' otherwise.
Do nothing if `lsp-ui-mode' is active and `lsp-ui-sideline-enable' is non-nil." nil nil)(autoload 'set-next-checker! "~/.doom/modules/checkers/syntax/autoload.el" "TODO

(fn MODE CHECKER NEXT &optional APPEND)" nil nil)(put 'set-next-checker! 'doom-module '(:checkers . syntax))(autoload '+spell-init-flyspell-predicate-h "~/.doom/modules/checkers/spell/autoload/+flyspell" "TODO" nil nil)(autoload '+spell-correction-at-point-p "~/.doom/modules/checkers/spell/autoload/+flyspell" "TODO

(fn &optional POINT)" nil nil)(autoload '+spell/add-word "~/.doom/modules/checkers/spell/autoload/+flyspell" "Add WORD to your personal dictionary, within SCOPE.

SCOPE can be `buffer' or `session' to exclude words only from the current buffer
or session. Otherwise, the addition is permanent.

(fn WORD &optional SCOPE)" t nil)(autoload '+spell/remove-word "~/.doom/modules/checkers/spell/autoload/+flyspell" "Remove WORD from your personal dictionary.

(fn WORD &optional SCOPE)" t nil)(autoload '+spell/next-error "~/.doom/modules/checkers/spell/autoload/+flyspell" "Jump to next flyspell error." t nil)(autoload '+spell/previous-error "~/.doom/modules/checkers/spell/autoload/+flyspell" "Jump to previous flyspell error." t nil)(put 'flyspell-mode! 'doom-module '(:checkers . spell))(defalias 'flyspell-mode! #'flyspell-mode nil)(progn (autoload 'set-flyspell-predicate! "~/.doom/modules/checkers/spell/autoload/+flyspell.el" "TODO

(fn MODES PREDICATE)" nil nil) (function-put 'set-flyspell-predicate! 'lisp-indent-function 'defun))(put 'set-flyspell-predicate! 'doom-module '(:checkers . spell))(autoload 'set-editorconfig-indent-var! "~/.doom/modules/tools/editorconfig/autoload.el" "Add (MODE VARS...) to `editorconfig-indentation-alist'.

(fn MODE &rest VARS)" nil nil)(put 'set-editorconfig-indent-var! 'doom-module '(:tools . editorconfig))(autoload '+eval-display-results-in-popup "~/.doom/modules/tools/eval/autoload/eval" "Display OUTPUT in a popup buffer.

(fn OUTPUT &optional SOURCE-BUFFER)" nil nil)(autoload '+eval-display-results-in-overlay "~/.doom/modules/tools/eval/autoload/eval" "Display OUTPUT in a floating overlay next to the cursor.

(fn OUTPUT &optional SOURCE-BUFFER)" nil nil)(autoload '+eval-display-results "~/.doom/modules/tools/eval/autoload/eval" "Display OUTPUT in an overlay or a popup buffer.

(fn OUTPUT &optional SOURCE-BUFFER)" nil nil)(autoload '+eval/buffer "~/.doom/modules/tools/eval/autoload/eval" "Evaluate the whole buffer." t nil)(autoload '+eval/region "~/.doom/modules/tools/eval/autoload/eval" "Evaluate a region between BEG and END and display the output.

(fn BEG END)" t nil)(autoload '+eval/line-or-region "~/.doom/modules/tools/eval/autoload/eval" "Evaluate the current line or selected region." t nil)(autoload '+eval/buffer-or-region "~/.doom/modules/tools/eval/autoload/eval" "Evaluate the region if it's active, otherwise evaluate the whole buffer.

If a REPL is open the code will be evaluated in it, otherwise a quickrun
runner will be used." t nil)(autoload '+eval/region-and-replace "~/.doom/modules/tools/eval/autoload/eval" "Evaluation a region between BEG and END, and replace it with the result.

(fn BEG END)" t nil)(autoload '+eval:region "~/.doom/modules/tools/eval/autoload/evil" nil t)(autoload '+eval:replace-region "~/.doom/modules/tools/eval/autoload/evil" nil t)(autoload '+eval:repl "~/.doom/modules/tools/eval/autoload/evil" nil t)(autoload '+eval/open-repl-same-window "~/.doom/modules/tools/eval/autoload/repl" "Opens (or reopens) the REPL associated with the current major-mode and place
the cursor at the prompt.

If ARG (universal argument), prompt for a specific REPL to open.

(fn &optional ARG)" t nil)(autoload '+eval/open-repl-other-window "~/.doom/modules/tools/eval/autoload/repl" "Does `+eval/open-repl', but in a popup window.

If ARG (universal argument), prompt for a specific REPL to open.

(fn &optional ARG)" t nil)(autoload '+eval/send-region-to-repl "~/.doom/modules/tools/eval/autoload/repl" "Execute the selected region in the REPL.
Opens a REPL if one isn't already open. If AUTO-EXECUTE-P, then execute it
immediately after.

(fn BEG END &optional INHIBIT-AUTO-EXECUTE-P)" t nil)(defvar +eval-runners nil "Alist mapping major modes to interactive runner functions.")(progn (autoload 'set-repl-handler! "~/.doom/modules/tools/eval/autoload/settings.el" "Defines a REPL for MODES.

MODES is either a single major mode symbol or a list of them. COMMAND is a
function that creates and returns the REPL buffer.

COMMAND can either be a function that takes no arguments, or an interactive
command that will be called interactively. COMMANDS must return either the repl
buffer or a function that takes no arguments and returns the repl buffer.

PLIST is a property list that map special attributes to this repl. These are
recognized:

  :persist BOOL
    If non-nil, this REPL won't be killed when its window is closed.
  :send-region FUNC
    A function that accepts a BEG and END, and sends the contents of the region
    to the REPL. Defaults to `+eval/send-region-to-repl'.
  :send-buffer FUNC
    A function of no arguments that sends the contents of the buffer to the REPL.
    Defaults to `+eval/region', which will run the :send-region specified function
    or `+eval/send-region-to-repl'.

(fn MODES COMMAND &rest PLIST)" nil nil) (function-put 'set-repl-handler! 'lisp-indent-function 'defun))(put 'set-repl-handler! 'doom-module '(:tools . eval))(progn (autoload 'set-eval-handler! "~/.doom/modules/tools/eval/autoload/settings.el" "Define a code evaluator for major mode MODES with `quickrun'.

MODES can be list of major mode symbols, or a single one.

1. If MODE is a string and COMMAND is the string, MODE is a file regexp and
   COMMAND is a string key for an entry in `quickrun-file-alist'.
2. If MODE is not a string and COMMAND is a string, MODE is a major-mode symbol
   and COMMAND is a key (for `quickrun--language-alist'), and will be registered
   in `quickrun--major-mode-alist'.
3. If MODE is not a string and COMMAND is an alist, see `quickrun-add-command':
   (quickrun-add-command MODE COMMAND :mode MODE).
4. If MODE is not a string and COMMANd is a symbol, add it to
   `+eval-runners', which is used by `+eval/region'.

(fn MODES COMMAND)" nil nil) (function-put 'set-eval-handler! 'lisp-indent-function 'defun))(put 'set-eval-handler! 'doom-module '(:tools . eval))(autoload '+gist:send "~/.doom/modules/tools/gist/autoload/evil" nil t)(autoload '+gist:list "~/.doom/modules/tools/gist/autoload/evil" nil t)(defmacro set-docsets! (modes &rest docsets) "THIS FUNCTION DOES NOTHING BECAUSE (:tools . lookup) IS DISABLED

Registers a list of DOCSETS for MODES.

MODES can be one major mode, or a list thereof.

DOCSETS can be strings, each representing a dash docset, or a vector with the
structure [DOCSET FORM]. If FORM evaluates to nil, the DOCSET is omitted. If it
is non-nil, (format DOCSET FORM) is used as the docset.

The first element in DOCSETS can be :add or :remove, making it easy for users to
add to or remove default docsets from modes.

DOCSETS can also contain sublists, which will be flattened.

Example:

  (set-docsets! '(js2-mode rjsx-mode) \"JavaScript\"
    [\"React\" (eq major-mode 'rjsx-mode)]
    [\"TypeScript\" (bound-and-true-p tide-mode)])

Used by `+lookup/in-docsets' and `+lookup/documentation'." (ignore modes docsets))(put 'set-docsets! 'doom-module '(:tools . lookup))(autoload '+lookup:online "~/.doom/modules/tools/lookup/autoload/evil" nil t)(autoload '+lookup:dash "~/.doom/modules/tools/lookup/autoload/evil" nil t)(autoload '+lookup/definition "~/.doom/modules/tools/lookup/autoload/lookup" "Jump to the definition of IDENTIFIER (defaults to the symbol at point).

Each function in `+lookup-definition-functions' is tried until one changes the
point or current buffer. Falls back to dumb-jump, naive
ripgrep/the_silver_searcher text search, then `evil-goto-definition' if
evil-mode is active.

(fn IDENTIFIER &optional ARG)" t nil)(autoload '+lookup/implementations "~/.doom/modules/tools/lookup/autoload/lookup" "Jump to the implementations of IDENTIFIER (defaults to the symbol at point).

Each function in `+lookup-implementations-functions' is tried until one changes
the point or current buffer.

(fn IDENTIFIER &optional ARG)" t nil)(autoload '+lookup/type-definition "~/.doom/modules/tools/lookup/autoload/lookup" "Jump to the type definition of IDENTIFIER (defaults to the symbol at point).

Each function in `+lookup-type-definition-functions' is tried until one changes
the point or current buffer.

(fn IDENTIFIER &optional ARG)" t nil)(autoload '+lookup/references "~/.doom/modules/tools/lookup/autoload/lookup" "Show a list of usages of IDENTIFIER (defaults to the symbol at point)

Tries each function in `+lookup-references-functions' until one changes the
point and/or current buffer. Falls back to a naive ripgrep/the_silver_searcher
search otherwise.

(fn IDENTIFIER &optional ARG)" t nil)(autoload '+lookup/documentation "~/.doom/modules/tools/lookup/autoload/lookup" "Show documentation for IDENTIFIER (defaults to symbol at point or selection.

First attempts the :documentation handler specified with `set-lookup-handlers!'
for the current mode/buffer (if any), then falls back to the backends in
`+lookup-documentation-functions'.

(fn IDENTIFIER &optional ARG)" t nil)(autoload '+lookup/file "~/.doom/modules/tools/lookup/autoload/lookup" "Figure out PATH from whatever is at point and open it.

Each function in `+lookup-file-functions' is tried until one changes the point
or the current buffer.

Otherwise, falls back on `find-file-at-point'.

(fn &optional PATH)" t nil)(autoload '+lookup/dictionary-definition "~/.doom/modules/tools/lookup/autoload/lookup" "Look up the definition of the word at point (or selection).

(fn IDENTIFIER &optional ARG)" t nil)(autoload '+lookup/synonyms "~/.doom/modules/tools/lookup/autoload/lookup" "Look up and insert a synonym for the word at point (or selection).

(fn IDENTIFIER &optional ARG)" t nil)(progn (autoload 'set-lookup-handlers! "~/.doom/modules/tools/lookup/autoload/lookup.el" "Define jump handlers for major or minor MODES.

A handler is either an interactive command that changes the current buffer
and/or location of the cursor, or a function that takes one argument: the
identifier being looked up, and returns either nil (failed to find it), t
(succeeded at changing the buffer/moving the cursor), or 'deferred (assume this
handler has succeeded, but expect changes not to be visible yet).

There are several kinds of handlers, which can be defined with the following
properties:

:definition FN
  Run when jumping to a symbol's definition. Used by `+lookup/definition'.
:implementations FN
  Run when looking for implementations of a symbol in the current project. Used
  by `+lookup/implementations'.
:type-definition FN
  Run when jumping to a symbol's type definition. Used by
  `+lookup/type-definition'.
:references FN
  Run when looking for usage references of a symbol in the current project. Used
  by `+lookup/references'.
:documentation FN
  Run when looking up documentation for a symbol. Used by
  `+lookup/documentation'.
:file FN
  Run when looking up the file for a symbol/string. Typically a file path. Used
  by `+lookup/file'.
:xref-backend FN
  Defines an xref backend for a major-mode. A :definition and :references
  handler isn't necessary with a :xref-backend, but will have higher precedence
  if they exist.
:async BOOL
  Indicates that *all* supplied FNs are asynchronous. Note: lookups will not try
  any handlers after async ones, due to their nature. To get around this, you
  must write a specialized wrapper to await the async response, or use a
  different heuristic to determine, ahead of time, whether the async call will
  succeed or not.

  If you only want to specify one FN is async, declare it inline instead:

    (set-lookup-handlers! 'rust-mode
      :definition '(racer-find-definition :async t))

Handlers can either be interactive or non-interactive. Non-interactive handlers
must take one argument: the identifier being looked up. This function must
change the current buffer or window or return non-nil when it succeeds.

If it doesn't change the current buffer, or it returns nil, the lookup module
will fall back to the next handler in `+lookup-definition-functions',
`+lookup-implementations-functions', `+lookup-type-definition-functions',
`+lookup-references-functions', `+lookup-file-functions' or
`+lookup-documentation-functions'.

Consecutive `set-lookup-handlers!' calls will overwrite previously defined
handlers for MODES. If used on minor modes, they are stacked onto handlers
defined for other minor modes or the major mode it's activated in.

This can be passed nil as its second argument to unset handlers for MODES. e.g.

  (set-lookup-handlers! 'python-mode nil)

(fn MODES &key DEFINITION IMPLEMENTATIONS TYPE-DEFINITION REFERENCES DOCUMENTATION FILE XREF-BACKEND ASYNC)" nil nil) (function-put 'set-lookup-handlers! 'lisp-indent-function 'defun))(put 'set-lookup-handlers! 'doom-module '(:tools . lookup))(autoload '+lookup-online-backend-fn "~/.doom/modules/tools/lookup/autoload/online" "Open the browser and search for IDENTIFIER online.
When called for the first time, or with a non-nil prefix argument, prompt for
the search engine to use.

(fn IDENTIFIER)" nil nil)(autoload '+lookup/online "~/.doom/modules/tools/lookup/autoload/online" "Look up QUERY in the browser using PROVIDER.
When called interactively, prompt for a query and, when called for the first
time, the provider from `+lookup-provider-url-alist'. In subsequent calls, reuse
the previous provider. With a non-nil prefix argument, always prompt for the
provider.

QUERY must be a string, and PROVIDER must be a key of
`+lookup-provider-url-alist'.

(fn QUERY PROVIDER)" t nil)(autoload '+lookup/online-select "~/.doom/modules/tools/lookup/autoload/online" "Run `+lookup/online', but always prompt for the provider to use." t nil)(autoload '+lookup--online-backend-google "~/.doom/modules/tools/lookup/autoload/online" "Search Google, starting with QUERY, with live autocompletion.

(fn QUERY)" nil nil)(autoload '+lookup--online-backend-duckduckgo "~/.doom/modules/tools/lookup/autoload/online" "Search DuckDuckGo, starting with QUERY, with live autocompletion.

(fn QUERY)" nil nil)(autoload '+lookup-xwidget-webkit-open-url-fn "~/.doom/modules/tools/lookup/autoload/xwidget" "

(fn URL &optional NEW-SESSION)" nil nil)(defadvice! +magit--ignore-version-a (fn &rest args) :around #'magit-version (let ((inhibit-message (not (called-interactively-p 'any)))) (apply fn args)))(autoload '+magit-display-buffer-fn "~/.doom/modules/tools/magit/autoload" "Same as `magit-display-buffer-traditional', except...

- If opened from a commit window, it will open below it.
- Magit process windows are always opened in small windows below the current.
- Everything else will reuse the same window.

(fn BUFFER)" nil nil)(autoload '+magit-mark-stale-buffers-h "~/.doom/modules/tools/magit/autoload" "Revert all visible buffers and mark buried buffers as stale.

Stale buffers are reverted when they are switched to, assuming they haven't been
modified." nil nil)(autoload '+magit-revert-buffer-maybe-h "~/.doom/modules/tools/magit/autoload" "Update `vc' and `git-gutter' if out of date." nil nil)(autoload '+magit/quit "~/.doom/modules/tools/magit/autoload" "Bury the current magit buffer.

If KILL-BUFFER, kill this buffer instead of burying it.
If the buried/killed magit buffer was the last magit buffer open for this repo,
kill all magit buffers for this repo.

(fn &optional KILL-BUFFER)" t nil)(autoload '+magit/quit-all "~/.doom/modules/tools/magit/autoload" "Kill all magit buffers for the current repository." t nil)(autoload '+magit/start-code-review "~/.doom/modules/tools/magit/autoload" "

(fn ARG)" t nil)(autoload '+make/run "~/.doom/modules/tools/make/autoload" "Run a make task in the current project. If multiple makefiles are available,
you'll be prompted to select one." t nil)(autoload '+make/run-last "~/.doom/modules/tools/make/autoload" "TODO" t nil)(autoload '+tree-sitter-get-textobj "~/.doom/modules/tools/tree-sitter/autoload" "A wrapper around `evil-textobj-tree-sitter-get-textobj' to
prevent eager expansion.

(fn GROUP &optional QUERY)" nil nil)(autoload '+tree-sitter-goto-textobj "~/.doom/modules/tools/tree-sitter/autoload" "Thin wrapper that returns the symbol of a named function, used in keybindings.

(fn GROUP &optional PREVIOUS END QUERY)" nil nil)(autoload 'tree-sitter! "~/.doom/modules/tools/tree-sitter/autoload.el" "Dispatch to turn on tree sitter.

Used as a hook function which turns on `tree-sitter-mode'
and selectively turn on `tree-sitter-hl-mode'.
according to `+tree-sitter-hl-enabled-modes'" nil nil)(put 'tree-sitter! 'doom-module '(:tools . tree-sitter))(autoload 'set-tree-sitter-lang! "~/.doom/modules/tools/tree-sitter/autoload.el" "Associate LANG with major MODE.

(fn MODE LANG)" nil nil)(put 'set-tree-sitter-lang! 'doom-module '(:tools . tree-sitter))(autoload '+emacs-lisp-eval "~/.doom/modules/lang/emacs-lisp/autoload" "Evaluate a region and print it to the echo area (if one line long), otherwise
to a pop up buffer.

(fn BEG END)" nil nil)(autoload '+emacs-lisp-outline-level "~/.doom/modules/lang/emacs-lisp/autoload" "Return outline level for comment at point.
Intended to replace `lisp-outline-level'." nil nil)(autoload '+emacs-lisp-lookup-definition "~/.doom/modules/lang/emacs-lisp/autoload" "Lookup definition of THING.

(fn THING)" nil nil)(autoload '+emacs-lisp-lookup-documentation "~/.doom/modules/lang/emacs-lisp/autoload" "Lookup THING with `helpful-variable' if it's a variable, `helpful-callable'
if it's callable, `apropos' otherwise.

(fn THING)" nil nil)(autoload '+emacs-lisp-indent-function "~/.doom/modules/lang/emacs-lisp/autoload" "A replacement for `lisp-indent-function'.

Indents plists more sensibly. Adapted from
https://emacs.stackexchange.com/questions/10230/how-to-indent-keywords-aligned

(fn INDENT-POINT STATE)" nil nil)(autoload '+emacs-lisp/open-repl "~/.doom/modules/lang/emacs-lisp/autoload" "Open the Emacs Lisp REPL (`ielm')." t nil)(autoload '+emacs-lisp/buttercup-run-file "~/.doom/modules/lang/emacs-lisp/autoload" "Run all buttercup tests in the focused buffer." t nil)(autoload '+emacs-lisp/buttercup-run-project "~/.doom/modules/lang/emacs-lisp/autoload" "Run all buttercup tests in the project." t nil)(autoload '+emacs-lisp/edebug-instrument-defun-on "~/.doom/modules/lang/emacs-lisp/autoload" "Toggle on instrumentalisation for the function under `defun'." t nil)(autoload '+emacs-lisp/edebug-instrument-defun-off "~/.doom/modules/lang/emacs-lisp/autoload" "Toggle off instrumentalisation for the function under `defun'." t nil)(autoload '+emacs-lisp-init-straight-maybe-h "~/.doom/modules/lang/emacs-lisp/autoload" "Make sure straight sees modifications to installed packages." nil nil)(autoload '+emacs-lisp-extend-imenu-h "~/.doom/modules/lang/emacs-lisp/autoload" "Improve imenu support in `emacs-lisp-mode' for Doom's APIs." nil nil)(autoload '+emacs-lisp-non-package-mode "~/.doom/modules/lang/emacs-lisp/autoload" "Reduce flycheck verbosity where it is appropriate.

This is a minor mode.  If called interactively, toggle the
`+Emacs-Lisp-Non-Package mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `+emacs-lisp-non-package-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

Essentially, this means in any elisp file that either:
- Is not a theme in `custom-theme-load-path',
- Lacks a `provide' statement,
- Lives in a project with a .doommodule file,
- Is a dotfile (like .dir-locals.el or .doomrc).

This generally applies to your private config (`doom-user-dir') or Doom's source
(`doom-emacs-dir').

(fn &optional ARG)" t nil)(autoload '+emacs-lisp-truncate-pin "~/.doom/modules/lang/emacs-lisp/autoload" "Truncates long SHA1 hashes in `package!' :pin's." nil nil)(autoload '+emacs-lisp-highlight-vars-and-faces "~/.doom/modules/lang/emacs-lisp/autoload" "Match defined variables and functions.

Functions are differentiated into special forms, built-in functions and
library/userland functions

(fn END)" nil nil)(autoload '+emacs-lisp--add-doom-elisp-demos-a "~/.doom/modules/lang/emacs-lisp/autoload" "Add Doom's own demos to `elisp-demos'.

Intended as :around advice for `elisp-demos--search'.

(fn FN SYMBOL)" nil nil)(put 'map! 'indent-plists-as-data t)(autoload '+emacs-lisp--calculate-lisp-indent-a "~/.doom/modules/lang/emacs-lisp/autoload" "Add better indentation for quoted and backquoted lists.

Intended as :override advice for `calculate-lisp-indent'.

Adapted from 'https://www.reddit.com/r/emacs/comments/d7x7x8/finally_fixing_indentation_of_quoted_lists/'.

(fn &optional PARSE-START)" nil nil)(autoload '+lua-love-project-root "~/.doom/modules/lang/lua/autoload/lua" "Returns the directory where a main.lua or main.moon exists.

Returns nil if 'love' executable can't be found." nil nil)(autoload '+lua/open-repl "~/.doom/modules/lang/lua/autoload/lua" "Open Lua REPL." t nil)(autoload '+lua/run-love-game "~/.doom/modules/lang/lua/autoload/lua" "Run the current project with Love2D." t nil)(autoload '+markdown-flyspell-word-p "~/.doom/modules/lang/markdown/autoload" "Return t if `flyspell' should check word before point.

Used for `flyspell-generic-check-word-predicate'. Like
`markdown-flyspell-check-word-p', but also:

a) Performs spell check in code comments and
b) Inhibits spell check in html markup" nil nil)(autoload '+markdown-compile "~/.doom/modules/lang/markdown/autoload" "Compile markdown into html.

Runs `+markdown-compile-functions' until the first function to return non-nil,
otherwise throws an error.

(fn BEG END OUTPUT-BUFFER)" nil nil)(autoload '+markdown-compile-marked "~/.doom/modules/lang/markdown/autoload" "Compiles markdown with the marked program, if available.
Returns its exit code.

(fn BEG END OUTPUT-BUFFER)" nil nil)(autoload '+markdown-compile-pandoc "~/.doom/modules/lang/markdown/autoload" "Compiles markdown with the pandoc program, if available.
Returns its exit code.

(fn BEG END OUTPUT-BUFFER)" nil nil)(autoload '+markdown-compile-multimarkdown "~/.doom/modules/lang/markdown/autoload" "Compiles markdown with the multimarkdown program, if available. Returns its
exit code.

(fn BEG END OUTPUT-BUFFER)" nil nil)(autoload '+markdown-compile-markdown "~/.doom/modules/lang/markdown/autoload" "Compiles markdown using the Markdown.pl script (or markdown executable), if
available. Returns its exit code.

(fn BEG END OUTPUT-BUFFER)" nil nil)(autoload '+markdown/insert-del "~/.doom/modules/lang/markdown/autoload" "Surround region in github strike-through delimiters." t nil)(autoload '+org-attach-icon-for "~/.doom/modules/lang/org/autoload/org-attach" "

(fn PATH)" nil nil)(autoload '+org/open-gallery-from-attachments "~/.doom/modules/lang/org/autoload/org-attach" "TODO" t nil)(autoload '+org/find-file-in-attachments "~/.doom/modules/lang/org/autoload/org-attach" "Open a file from `org-attach-id-dir'." t nil)(autoload '+org/attach-file-and-insert-link "~/.doom/modules/lang/org/autoload/org-attach" "Downloads the file at PATH and insert an org link at point.
PATH (a string) can be an url, a local file path, or a base64 encoded datauri.

(fn PATH)" t nil)(autoload '+org-headline-avy "~/.doom/modules/lang/org/autoload/org-avy" "TODO" nil nil)(autoload '+org/goto-visible "~/.doom/modules/lang/org/autoload/org-avy" "TODO" t nil)(autoload '+org-eval-handler "~/.doom/modules/lang/org/autoload/org-babel" "TODO

(fn BEG END)" nil nil)(autoload '+org-lookup-definition-handler "~/.doom/modules/lang/org/autoload/org-babel" "TODO

(fn IDENTIFIER)" nil nil)(autoload '+org-lookup-references-handler "~/.doom/modules/lang/org/autoload/org-babel" "TODO

(fn IDENTIFIER)" nil nil)(autoload '+org-lookup-documentation-handler "~/.doom/modules/lang/org/autoload/org-babel" "TODO

(fn IDENTIFIER)" nil nil)(autoload '+org/remove-result-blocks "~/.doom/modules/lang/org/autoload/org-babel" "Remove all result blocks located after current point.

(fn REMOVE-ALL)" t nil)(autoload '+org-clear-babel-results-h "~/.doom/modules/lang/org/autoload/org-babel" "Remove the results block for the org babel block at point." nil nil)(defvar +org-capture-frame-parameters `((name . "doom-capture") (width . 70) (height . 25) (transient . t) ,@(when IS-LINUX `((window-system \, (if (boundp 'pgtk-initialized) 'pgtk 'x)) (display \, (or (getenv "WAYLAND_DISPLAY") (getenv "DISPLAY") ":0")))) ,(if IS-MAC '(menu-bar-lines . 1))) "TODO")(autoload '+org-capture-cleanup-frame-h "~/.doom/modules/lang/org/autoload/org-capture" "Closes the org-capture frame once done adding an entry." nil nil)(autoload '+org-capture-frame-p "~/.doom/modules/lang/org/autoload/org-capture" "Return t if the current frame is an org-capture frame opened by
`+org-capture/open-frame'.

(fn &rest _)" nil nil)(autoload '+org-capture/open-frame "~/.doom/modules/lang/org/autoload/org-capture" "Opens the org-capture window in a floating frame that cleans itself up once
you're done. This can be called from an external shell script.

(fn &optional INITIAL-INPUT KEY)" t nil)(autoload '+org-capture-available-keys "~/.doom/modules/lang/org/autoload/org-capture" "TODO" nil nil)(autoload '+org-capture-todo-file "~/.doom/modules/lang/org/autoload/org-capture" "Expand `+org-capture-todo-file' from `org-directory'.
If it is an absolute path return `+org-capture-todo-file' verbatim." nil nil)(autoload '+org-capture-notes-file "~/.doom/modules/lang/org/autoload/org-capture" "Expand `+org-capture-notes-file' from `org-directory'.
If it is an absolute path return `+org-capture-todo-file' verbatim." nil nil)(autoload '+org-capture-project-todo-file "~/.doom/modules/lang/org/autoload/org-capture" "Find the nearest `+org-capture-todo-file' in a parent directory, otherwise,
opens a blank one at the project root. Throws an error if not in a project." nil nil)(autoload '+org-capture-project-notes-file "~/.doom/modules/lang/org/autoload/org-capture" "Find the nearest `+org-capture-notes-file' in a parent directory, otherwise,
opens a blank one at the project root. Throws an error if not in a project." nil nil)(autoload '+org-capture-project-changelog-file "~/.doom/modules/lang/org/autoload/org-capture" "Find the nearest `+org-capture-changelog-file' in a parent directory,
otherwise, opens a blank one at the project root. Throws an error if not in a
project." nil nil)(autoload '+org-capture-central-project-todo-file "~/.doom/modules/lang/org/autoload/org-capture" "TODO" nil nil)(autoload '+org-capture-central-project-notes-file "~/.doom/modules/lang/org/autoload/org-capture" "TODO" nil nil)(autoload '+org-capture-central-project-changelog-file "~/.doom/modules/lang/org/autoload/org-capture" "TODO" nil nil)(autoload '+org/export-to-clipboard "~/.doom/modules/lang/org/autoload/org-export" "Exports the current buffer/selection to the clipboard.

Prompts for what BACKEND to use. See `org-export-backends' for options.

(fn BACKEND)" t nil)(autoload '+org/export-to-clipboard-as-rich-text "~/.doom/modules/lang/org/autoload/org-export" "Export the current buffer to HTML then copies it to clipboard as rich text.

Supports org-mode, markdown-mode, and gfm-mode buffers. In any other mode,
htmlize is used (takes what you see in Emacs and converts it to html, text
properties and font-locking et all).

(fn BEG END)" t nil)(autoload '+org-define-basic-link "~/.doom/modules/lang/org/autoload/org-link" "Define a link with some basic completion & fontification.

KEY is the name of the link type. DIR-VAR is the directory variable to resolve
links relative to. PLIST is passed to `org-link-set-parameters' verbatim.

Links defined with this will be rendered in the `error' face if the file doesn't
exist, and `org-link' otherwise.

(fn KEY DIR-VAR &rest PLIST)" nil nil)(function-put '+org-define-basic-link 'lisp-indent-function '2)(autoload '+org-link-read-desc-at-point "~/.doom/modules/lang/org/autoload/org-link" "TODO

(fn &optional DEFAULT CONTEXT)" nil nil)(autoload '+org-link-read-kbd-at-point "~/.doom/modules/lang/org/autoload/org-link" "TODO

(fn &optional DEFAULT CONTEXT)" nil nil)(autoload '+org-link--doom-module-link-face-fn "~/.doom/modules/lang/org/autoload/org-link" "

(fn MODULE-PATH)" nil nil)(autoload '+org-link-follow-doom-module-fn "~/.doom/modules/lang/org/autoload/org-link" "TODO

(fn MODULE-PATH PREFIXARG)" nil nil)(autoload '+org-link-follow-doom-package-fn "~/.doom/modules/lang/org/autoload/org-link" "TODO

(fn PKG PREFIXARG)" nil nil)(autoload '+org-image-file-data-fn "~/.doom/modules/lang/org/autoload/org-link" "Intepret LINK as an image file path and return its data.

(fn PROTOCOL LINK DESCRIPTION)" nil nil)(autoload '+org-inline-image-data-fn "~/.doom/modules/lang/org/autoload/org-link" "Interpret LINK as base64-encoded image data.

(fn PROTOCOL LINK DESCRIPTION)" nil nil)(autoload '+org-http-image-data-fn "~/.doom/modules/lang/org/autoload/org-link" "Interpret LINK as an URL to an image file.

(fn PROTOCOL LINK DESCRIPTION)" nil nil)(autoload '+org-play-gif-at-point-h "~/.doom/modules/lang/org/autoload/org-link" "Play the gif at point, while the cursor remains there (looping)." nil nil)(autoload '+org-play-all-gifs-h "~/.doom/modules/lang/org/autoload/org-link" "Continuously play all gifs in the visible buffer." nil nil)(autoload '+org/remove-link "~/.doom/modules/lang/org/autoload/org-link" "Unlink the text at point." t nil)(autoload '+org/play-gif-at-point "~/.doom/modules/lang/org/autoload/org-link" "TODO" t nil)(autoload '+org/refile-to-current-file "~/.doom/modules/lang/org/autoload/org-refile" "Refile current heading to elsewhere in the current buffer.
If prefix ARG, copy instead of move.

(fn ARG &optional FILE)" t nil)(autoload '+org/refile-to-file "~/.doom/modules/lang/org/autoload/org-refile" "Refile current heading to a particular org file.
If prefix ARG, copy instead of move.

(fn ARG FILE)" t nil)(autoload '+org/refile-to-other-window "~/.doom/modules/lang/org/autoload/org-refile" "Refile current heading to an org buffer visible in another window.
If prefix ARG, copy instead of move.

(fn ARG)" t nil)(autoload '+org/refile-to-other-buffer "~/.doom/modules/lang/org/autoload/org-refile" "Refile current heading to another, living org buffer.
If prefix ARG, copy instead of move.

(fn ARG)" t nil)(autoload '+org/refile-to-running-clock "~/.doom/modules/lang/org/autoload/org-refile" "Refile current heading to the currently clocked in task.
If prefix ARG, copy instead of move.

(fn ARG)" t nil)(autoload '+org/refile-to-last-location "~/.doom/modules/lang/org/autoload/org-refile" "Refile current heading to the last node you refiled to.
If prefix ARG, copy instead of move.

(fn ARG)" t nil)(autoload '+org/refile-to-visible "~/.doom/modules/lang/org/autoload/org-refile" "Refile current heading as first child of visible heading selected with Avy." t nil)(autoload '+org/table-previous-row "~/.doom/modules/lang/org/autoload/org-tables" "Go to the previous row (same column) in the current table. Before doing so,
re-align the table if necessary. (Necessary because org-mode has a
`org-table-next-row', but not `org-table-previous-row')" t nil)(autoload '+org/table-insert-column-left "~/.doom/modules/lang/org/autoload/org-tables" "Insert a new column left of the current column." t nil)(autoload '+org/table-insert-row-below "~/.doom/modules/lang/org/autoload/org-tables" "Insert a new row below the current row." t nil)(autoload '+org-realign-table-maybe-h "~/.doom/modules/lang/org/autoload/org-tables" "Auto-align table under cursor." nil nil)(autoload '+org-enable-auto-reformat-tables-h "~/.doom/modules/lang/org/autoload/org-tables" "Realign tables & update formulas when exiting insert mode (`evil-mode').
Meant for `org-mode-hook'." nil nil)(autoload '+org-delete-backward-char-and-realign-table-maybe-h "~/.doom/modules/lang/org/autoload/org-tables" "Ensure deleting characters with backspace doesn't deform the table cell." nil nil)(autoload '+org-realign-table-maybe-a "~/.doom/modules/lang/org/autoload/org-tables" "Auto-align table under cursor and re-calculate formulas.

(fn &rest _)" nil nil)(autoload '+org-get-todo-keywords-for "~/.doom/modules/lang/org/autoload/org" "Returns the list of todo keywords that KEYWORD belongs to.

(fn &optional KEYWORD)" nil nil)(autoload '+org-pretty-mode "~/.doom/modules/lang/org/autoload/org" "Hides emphasis markers and toggles pretty entities.

This is a minor mode.  If called interactively, toggle the
`+Org-Pretty mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `+org-pretty-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t nil)(autoload '+org/return "~/.doom/modules/lang/org/autoload/org" "Call `org-return' then indent (if `electric-indent-mode' is on)." t nil)(autoload '+org/dwim-at-point "~/.doom/modules/lang/org/autoload/org" "Do-what-I-mean at point.

If on a:
- checkbox list item or todo heading: toggle it.
- citation: follow it
- headline: cycle ARCHIVE subtrees, toggle latex fragments and inline images in
  subtree; update statistics cookies/checkboxes and ToCs.
- clock: update its time.
- footnote reference: jump to the footnote's definition
- footnote definition: jump to the first reference of this footnote
- timestamp: open an agenda view for the time-stamp date/range at point.
- table-row or a TBLFM: recalculate the table's formulas
- table-cell: clear it and go into insert mode. If this is a formula cell,
  recaluclate it instead.
- babel-call: execute the source block
- statistics-cookie: update it.
- src block: execute it
- latex fragment: toggle it.
- link: follow it
- otherwise, refresh all inline images in current tree.

(fn &optional ARG)" t nil)(autoload '+org/shift-return "~/.doom/modules/lang/org/autoload/org" "Insert a literal newline, or dwim in tables.
Executes `org-table-copy-down' if in table.

(fn &optional ARG)" t nil)(autoload '+org/insert-item-below "~/.doom/modules/lang/org/autoload/org" "Inserts a new heading, table cell or item below the current one.

(fn COUNT)" t nil)(autoload '+org/insert-item-above "~/.doom/modules/lang/org/autoload/org" "Inserts a new heading, table cell or item above the current one.

(fn COUNT)" t nil)(autoload '+org/toggle-last-clock "~/.doom/modules/lang/org/autoload/org" "Toggles last clocked item.

Clock out if an active clock is running (or cancel it if prefix ARG is non-nil).

If no clock is active, then clock into the last item. See `org-clock-in-last' to
see how ARG affects this command.

(fn ARG)" t nil)(defalias #'+org/toggle-fold #'+org-cycle-only-current-subtree-h)(autoload '+org/open-fold "~/.doom/modules/lang/org/autoload/org" "Open the current fold (not but its children)." t nil)(defalias #'+org/close-fold #'outline-hide-subtree)(autoload '+org/close-all-folds "~/.doom/modules/lang/org/autoload/org" "Close all folds in the buffer (or below LEVEL).

(fn &optional LEVEL)" t nil)(autoload '+org/open-all-folds "~/.doom/modules/lang/org/autoload/org" "Open all folds in the buffer (or up to LEVEL).

(fn &optional LEVEL)" t nil)(autoload '+org/show-next-fold-level "~/.doom/modules/lang/org/autoload/org" "Decrease the fold-level of the visible area of the buffer. This unfolds
another level of headings on each invocation.

(fn &optional COUNT)" t nil)(autoload '+org/hide-next-fold-level "~/.doom/modules/lang/org/autoload/org" "Increase the global fold-level of the visible area of the buffer. This folds
another level of headings on each invocation.

(fn &optional COUNT)" t nil)(autoload '+org-indent-maybe-h "~/.doom/modules/lang/org/autoload/org" "Indent the current item (header or item), if possible.
Made for `org-tab-first-hook' in evil-mode." t nil)(autoload '+org-yas-expand-maybe-h "~/.doom/modules/lang/org/autoload/org" "Expand a yasnippet snippet, if trigger exists at point or region is active.
Made for `org-tab-first-hook'." nil nil)(autoload '+org-cycle-only-current-subtree-h "~/.doom/modules/lang/org/autoload/org" "Toggle the local fold at the point, and no deeper.
`org-cycle's standard behavior is to cycle between three levels: collapsed,
subtree and whole document. This is slow, especially in larger org buffer. Most
of the time I just want to peek into the current subtree -- at most, expand
*only* the current subtree.

All my (performant) foldings needs are met between this and `org-show-subtree'
(on zO for evil users), and `org-cycle' on shift-TAB if I need it.

(fn &optional ARG)" t nil)(autoload '+org-make-last-point-visible-h "~/.doom/modules/lang/org/autoload/org" "Unfold subtree around point if saveplace places us in a folded region." nil nil)(autoload '+org-remove-occur-highlights-h "~/.doom/modules/lang/org/autoload/org" "Remove org occur highlights on ESC in normal mode." nil nil)(autoload '+org-enable-auto-update-cookies-h "~/.doom/modules/lang/org/autoload/org" "Update statistics cookies when saving or exiting insert mode (`evil-mode')." nil nil)(defadvice! +python--font-lock-assignment-matcher-a (regexp) :override #'python-font-lock-assignment-matcher (lambda (limit) (cl-loop while (re-search-forward regexp limit t) unless (or (python-syntax-context 'paren) (equal (char-after) 61)) return t)))(defadvice! +python--rx-a (&rest regexps) :override #'python-rx `(rx-let ((block-start (seq symbol-start (or "def" "class" "if" "elif" "else" "try" "except" "finally" "for" "while" "with" (and "async" (+ space) (or "def" "for" "with"))) symbol-end)) (dedenter (seq symbol-start (or "elif" "else" "except" "finally") symbol-end)) (block-ender (seq symbol-start (or "break" "continue" "pass" "raise" "return") symbol-end)) (decorator (seq line-start (* space) 64 (any letter 95) (* (any word 95)))) (defun (seq symbol-start (or "def" "class" (and "async" (+ space) "def")) symbol-end)) (if-name-main (seq line-start "if" (+ space) "__name__" (+ space) "==" (+ space) (any 39 34) "__main__" (any 39 34) (* space) 58)) (symbol-name (seq (any letter 95) (* (any word 95)))) (assignment-target (seq (32 42) (* symbol-name 46) symbol-name (32 91 (+ (not 93)) 93))) (grouped-assignment-target (seq (32 42) (* symbol-name 46) (group symbol-name) (32 91 (+ (not 93)) 93))) (open-paren (or "{" "[" "(")) (close-paren (or "}" "]" ")")) (simple-operator (any 43 45 47 38 94 126 124 42 60 62 61 37)) (not-simple-operator (not (or simple-operator 10))) (operator (or "==" ">=" "is" "not" "**" "//" "<<" ">>" "<=" "!=" "+" "-" "/" "&" "^" "~" "|" "*" "<" ">" "=" "%")) (assignment-operator (or "+=" "-=" "*=" "/=" "//=" "%=" "**=" ">>=" "<<=" "&=" "^=" "|=" "=")) (string-delimiter (seq (or (not (any 92 39 34)) point (and (or (not (any 92)) point) 92 (* 92 92) (any 39 34))) (* 92 92) (group (or "\"\"\"" "\"" "'''" "'")))) (coding-cookie (seq line-start 35 (* space) (or (: "coding" (or 58 61) (* space) (group-n 1 (+ (or word 45)))) (: "-*-" (* space) "coding:" (* space) (group-n 1 (+ (or word 45))) (* space) "-*-") (: "vim:" (* space) "set" (+ space) "fileencoding" (* space) 61 (* space) (group-n 1 (+ (or word 45))) (* space) ":"))))) (rx ,@regexps)))(autoload '+python-executable-find "~/.doom/modules/lang/python/autoload/python" "Resolve the path to the EXE executable.
Tries to be aware of your active conda/pipenv/virtualenv environment, before
falling back on searching your PATH.

(fn EXE)" nil nil)(autoload '+python/open-repl "~/.doom/modules/lang/python/autoload/python" "Open the Python REPL." t nil)(autoload '+python/open-ipython-repl "~/.doom/modules/lang/python/autoload/python" "Open an IPython REPL." t nil)(autoload '+python/open-jupyter-repl "~/.doom/modules/lang/python/autoload/python" "Open a Jupyter console." t nil)(autoload '+python/optimize-imports "~/.doom/modules/lang/python/autoload/python" "organize imports" t nil)(autoload '+rust-cargo-project-p "~/.doom/modules/lang/rust/autoload" "Return t if this is a cargo project." nil nil)(autoload '+rust/cargo-audit "~/.doom/modules/lang/rust/autoload" "Run 'cargo audit' for the current project." t nil)(autoload '+sh--match-variables-in-quotes "~/.doom/modules/lang/sh/autoload" "Search for variables in double-quoted strings bounded by LIMIT.

(fn LIMIT)" nil nil)(autoload '+sh--match-command-subst-in-quotes "~/.doom/modules/lang/sh/autoload" "Search for variables in double-quoted strings bounded by LIMIT.

(fn LIMIT)" nil nil)(autoload '+sh/open-repl "~/.doom/modules/lang/sh/autoload" "Open a shell REPL." t nil)(autoload '+sh-lookup-documentation-handler "~/.doom/modules/lang/sh/autoload" "Look up documentation in `man' or `woman'." t nil)(autoload '+mu4e~main-action-str-prettier-a "~/.doom/modules/email/mu4e/autoload/advice" "Highlight the first occurrence of [.] in STR.
If FUNC-OR-SHORTCUT is non-nil and if it is a function, call it
when STR is clicked (using RET or mouse-2); if FUNC-OR-SHORTCUT is
a string, execute the corresponding keyboard action when it is
clicked.

(fn STR &optional FUNC-OR-SHORTCUT)" nil nil)(autoload '+mu4e~main-keyval-str-prettier-a "~/.doom/modules/email/mu4e/autoload/advice" "Replace '*' with `+mu4e-main-bullet' in STR.

(fn STR)" nil nil)(autoload '+org-msg-img-scale-css "~/.doom/modules/email/mu4e/autoload/advice" "For a given IMG-URI, use imagemagick to find its width.

(fn IMG-URI)" nil nil)(autoload '+org-html-latex-fragment-scaled-a "~/.doom/modules/email/mu4e/autoload/advice" "Transcode a LATEX-FRAGMENT object from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual information.

This differs from `org-html-latex-fragment' in that it uses the LaTeX fragment
as a meaningful alt value, applies a class to indicate what sort of fragment it is
(latex-fragment-inline or latex-fragment-block), and (on Linux) scales the image to
account for the value of :scale in `org-format-latex-options'.

(fn LATEX-FRAGMENT CONTENTS INFO)" nil nil)(autoload '+org-html-latex-environment-scaled-a "~/.doom/modules/email/mu4e/autoload/advice" "Transcode a LATEX-ENVIRONMENT element from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual information.

This differs from `org-html-latex-environment' in that (on Linux) it
scales the image to account for the value of :scale in `org-format-latex-options'.

(fn LATEX-ENVIRONMENT CONTENTS INFO)" nil nil)(autoload '=mu4e "~/.doom/modules/email/mu4e/autoload/email" "Start email client." t nil)(autoload '+mu4e/compose "~/.doom/modules/email/mu4e/autoload/email" "Compose a new email." t nil)(autoload '+mu4e-initialise-icons "~/.doom/modules/email/mu4e/autoload/email" nil nil nil)(autoload '+mu4e/capture-msg-to-agenda "~/.doom/modules/email/mu4e/autoload/email" "Refile a message and add a entry in `+org-capture-emails-file' with a
deadline.  Default deadline is today.  With one prefix, deadline
is tomorrow.  With two prefixes, select the deadline.

(fn ARG)" t nil)(autoload '+mu4e/attach-files "~/.doom/modules/email/mu4e/autoload/email" "When called in a dired buffer, ask for a message to attach the marked files to.
When called in a mu4e:compose or org-msg buffer, `read-file-name'to either
attach a file, or select a folder to open dired in and select file attachments
(using `dired-mu4e-attach-ctrl-c-ctrl-c').

When otherwise called, open a dired buffer and enable `dired-mu4e-attach-ctrl-c-ctrl-c'.

(fn &optional FILES-TO-ATTACH)" t nil)(autoload '+mu4e-set-from-address-h "~/.doom/modules/email/mu4e/autoload/email" "If the user defines multiple `+mu4e-personal-addresses' for email aliases
within a context, set `user-mail-address' to an alias found in the 'To' or
'From' headers of the parent message if present, or prompt the user for a
preferred alias" nil nil)(autoload 'set-email-account! "~/.doom/modules/email/mu4e/autoload/email.el" "Registers an email address for mu4e. The LABEL is a string. LETVARS are a
list of cons cells (VARIABLE . VALUE) -- you may want to modify:

 + `user-full-name' (used to populate the FROM field when composing mail)
 + `user-mail-address' (required in mu4e < 1.4)
 + `smtpmail-smtp-user' (required for sending mail from Emacs)

OPTIONAL:
 + `mu4e-sent-folder'
 + `mu4e-drafts-folder'
 + `mu4e-trash-folder'
 + `mu4e-refile-folder'
 + `mu4e-compose-signature'
 + `+mu4e-personal-addresses'

DEFAULT-P is a boolean. If non-nil, it marks that email account as the
default/fallback account.

(fn LABEL LETVARS &optional DEFAULT-P)" nil nil)(put 'set-email-account! 'doom-module '(:email . mu4e))(autoload '+mu4e/mark "~/.doom/modules/email/mu4e/autoload/evil" "Mark all messages within the current selection in mu4e's header view. Uses
`this-command-keys' to see what flag you mean.

(fn &optional BEG END)" t nil)(autoload '+mu4e-lock-available "~/.doom/modules/email/mu4e/autoload/mu-lock" "If the `+mu4e-lock-file' is available (unset or owned by this emacs) return t.
If STRICT only accept an unset lock file.

(fn &optional STRICT)" nil nil)(autoload '+mu4e-lock-file-delete-maybe "~/.doom/modules/email/mu4e/autoload/mu-lock" "Check `+mu4e-lock-file', and delete it if this process is responsible for it." nil nil)(autoload '+mu4e-lock-start "~/.doom/modules/email/mu4e/autoload/mu-lock" "Check `+mu4e-lock-file', and if another process is responsible for it, abort starting.
Else, write to this process' PID to the lock file

(fn ORIG-FUN &optional CALLBACK)" nil nil)(autoload '+default/compile "~/.doom/modules/config/default/autoload/default" "Runs `compile' from the root of the current project.

If a compilation window is already open, recompile that instead.

If ARG (universal argument), runs `compile' from the current directory.

(fn ARG)" t nil)(autoload '+default/man-or-woman "~/.doom/modules/config/default/autoload/default" "Invoke `man' if man is installed and the platform is not MacOS, otherwise use `woman'.

`man -k \"^\"` is very slow on MacOS, which is what `Man-completion-table' uses to
generate `completing-read' candidates." t nil)(autoload '+default/new-buffer "~/.doom/modules/config/default/autoload/default" "TODO" t nil)(autoload '+default/restart-server "~/.doom/modules/config/default/autoload/default" "Restart the Emacs server." t nil)(autoload '+default/diagnostics "~/.doom/modules/config/default/autoload/default" "List diagnostics for the current buffer/project.
If the the vertico and lsp modules are active, list lsp diagnostics for the
current project. Otherwise list them for the current buffer

(fn &rest ARG)" t nil)(autoload '+default/lsp-command-map "~/.doom/modules/config/default/autoload/deferred" "Lazily invoke `lsp-command-map'." t nil)(autoload '+default/browse-project "~/.doom/modules/config/default/autoload/files" "Browse files from the current project's root." t nil)(autoload '+default/browse-templates "~/.doom/modules/config/default/autoload/files" "Browse files from `+file-templates-dir'." t nil)(autoload '+default/find-in-templates "~/.doom/modules/config/default/autoload/files" "Find a file under `+file-templates-dir', recursively." t nil)(autoload '+default/browse-notes "~/.doom/modules/config/default/autoload/files" "Browse files from `org-directory'." t nil)(autoload '+default/find-in-notes "~/.doom/modules/config/default/autoload/files" "Find a file under `org-directory', recursively." t nil)(autoload '+default/find-file-under-here "~/.doom/modules/config/default/autoload/files" "Perform a recursive file search from the current directory." t nil)(autoload '+default/discover-projects "~/.doom/modules/config/default/autoload/files" "Discover projects in `projectile-project-search-path'.
If prefix ARG is non-nil, prompt for the search path.

(fn ARG)" t nil)(autoload '+default/dired "~/.doom/modules/config/default/autoload/files" "Open a directory in dired.
If prefix ARG is non-nil, prompt for a known project to open in dired.

(fn ARG)" t nil)(autoload '+default/search-cwd "~/.doom/modules/config/default/autoload/search" "Conduct a text search in files under the current folder.
If prefix ARG is set, prompt for a directory to search from.

(fn &optional ARG)" t nil)(autoload '+default/search-other-cwd "~/.doom/modules/config/default/autoload/search" "Conduct a text search in another directory." t nil)(autoload '+default/search-emacsd "~/.doom/modules/config/default/autoload/search" "Conduct a text search in files under `doom-emacs-dir'." t nil)(autoload '+default/search-buffer "~/.doom/modules/config/default/autoload/search" "Conduct a text search on the current buffer.

If a selection is active and multi-line, perform a search restricted to that
region.

If a selection is active and not multi-line, use the selection as the initial
input and search the whole buffer for it." t nil)(autoload '+default/search-project "~/.doom/modules/config/default/autoload/search" "Conduct a text search in the current project root.
If prefix ARG is set, include ignored/hidden files.

(fn &optional ARG)" t nil)(autoload '+default/search-other-project "~/.doom/modules/config/default/autoload/search" "Conduct a text search in a known project." t nil)(autoload '+default/search-project-for-symbol-at-point "~/.doom/modules/config/default/autoload/search" "Search current project for symbol at point.
If prefix ARG is set, prompt for a known project to search from.

(fn SYMBOL DIR)" t nil)(autoload '+default/search-notes-for-symbol-at-point "~/.doom/modules/config/default/autoload/search" "Conduct a text search in the current project for symbol at point. If prefix
ARG is set, prompt for a known project to search from.

(fn SYMBOL)" t nil)(autoload '+default/org-notes-search "~/.doom/modules/config/default/autoload/search" "Perform a text search on `org-directory'.

(fn QUERY)" t nil)(autoload '+default/org-notes-headlines "~/.doom/modules/config/default/autoload/search" "Jump to an Org headline in `org-agenda-files'." t nil)(defalias '+default/newline #'electric-indent-just-newline)(autoload '+default/newline-above "~/.doom/modules/config/default/autoload/text" "Insert an indented new line before the current one." t nil)(autoload '+default/newline-below "~/.doom/modules/config/default/autoload/text" "Insert an indented new line after the current one." t nil)(autoload '+default/yank-pop "~/.doom/modules/config/default/autoload/text" "Interactively select what text to insert from the kill ring." t nil)(autoload '+default/yank-buffer-contents "~/.doom/modules/config/default/autoload/text" "Copy entire buffer into kill ring." t nil)(autoload '+default/yank-buffer-path "~/.doom/modules/config/default/autoload/text" "Copy the current buffer's path to the kill ring.

(fn &optional ROOT)" t nil)(autoload '+default/yank-buffer-path-relative-to-project "~/.doom/modules/config/default/autoload/text" "Copy the current buffer's path to the kill ring.
With non-nil prefix INCLUDE-ROOT, also include the project's root.

(fn &optional INCLUDE-ROOT)" t nil)(autoload '+default/insert-file-path "~/.doom/modules/config/default/autoload/text" "Insert the file name (absolute path if prefix ARG).
If `buffer-file-name' isn't set, uses `default-directory'.

(fn ARG)" t nil)(autoload 'doom/backward-delete-whitespace-to-column "~/.doom/modules/config/default/autoload/text" "Delete back to the previous column of whitespace, or as much whitespace as
possible, or just one char if that's not possible." t nil)(autoload '+default--delete-backward-char-a "~/.doom/modules/config/default/autoload/text" "Same as `delete-backward-char', but preforms these additional checks:

+ If point is surrounded by (balanced) whitespace and a brace delimiter ({} []
  ()), delete a space on either side of the cursor.
+ If point is at BOL and surrounded by braces on adjacent lines, collapse
  newlines:
  {
  |
  } => {|}
+ Otherwise, resort to `doom/backward-delete-whitespace-to-column'.
+ Resorts to `delete-char' if n > 1

(fn N &optional KILLFLAG)" t nil)(fset 'lsp! #'ignore)(defmacro set-eglot-client! (mode server-call) "THIS FUNCTION DOES NOTHING BECAUSE (:tools . lsp) IS DISABLED

Add SERVER-CALL list as a possible lsp server for given major MODE.

Example : (set-eglot-client! 'python-mode `(,(concat doom-data-dir \"lsp/mspyls/Microsoft.Python.LanguageServer\")))" (ignore mode server-call))(put 'set-eglot-client! 'doom-module '(:tools . lsp))(defmacro set-lsp-priority! (client priority) "THIS FUNCTION DOES NOTHING BECAUSE (:tools . lsp) IS DISABLED

Change the PRIORITY of lsp CLIENT." (ignore client priority))(put 'set-lsp-priority! 'doom-module '(:tools . lsp))(cl-defmacro set-rotate-patterns! (modes &key symbols words patterns) "THIS FUNCTION DOES NOTHING BECAUSE (:editor . rotate-text) IS DISABLED

Declare :symbols, :words or :patterns (all lists of strings) that
`rotate-text' will cycle through." (ignore modes symbols words patterns))(put 'set-rotate-patterns! 'doom-module '(:editor . rotate-text))(cl-defmacro set-formatter! (name formatter &key modes filter ok-statuses error-regexp) "THIS FUNCTION DOES NOTHING BECAUSE (:editor . format) IS DISABLED

Define (or modify) a formatter named NAME.

Supported keywords: :modes :filter :ok-statuses :error-regexp

NAME is a symbol that identifies this formatter.

FORMATTER can be a symbol referring to another formatter, a function, string or
nested list.

  If a function, it should be a formatter function that
    `format-all--buffer-thunk' will accept.
  If a string, it is assumed to be a shell command that the buffer's text will
    be piped to (through stdin).
  If a list, it should represent a shell command as a list of arguments. Each
    element is either a string or list (STRING ARG) where STRING is a format
    string and ARG is both a predicate and argument for STRING. If ARG is nil,
    STRING will be omitted from the vector.

MODES is a major mode, a list thereof, or a list of two-element sublists with
the structure: (MAJOR-MODE FORM). FORM is evaluated when the buffer is formatted
and its return value serves two purposes:

  1. It is a predicate for this formatter. Assuming the MAJOR-MODE matches the
     current mode, if FORM evaluates to nil, the formatter is skipped.
  2. It's return value is made available to FORMATTER if it is a function or
     list of shell arguments via the `mode-result' variable.

FILTER is a function that takes three arguments: the formatted output, any error
output and the position of the first change. This function must return these
three after making whatever changes you like to them. This might be useful if
the output contains ANSI color codes that need to be stripped out (as is the
case with elm-format).

OK-STATUSES and ERROR-REGEXP are ignored if FORMATTER is not a shell command.

OK-STATUSES is a list of integer exit codes that should be treated as success
codes. However, if ERROR-REGEXP is given, and the program's stderr contains that
regexp, then the formatting is considered failed even if the exit status is in
OK-STATUSES.

Basic examples:

  (set-formatter! 'asmfmt \"asmfmt\" :modes '(asm-mode nasm-mode))
  (set-formatter! 'black \"black -q -\")
  (set-formatter! 'html-tidy \"tidy -q -indent\" :modes '(html-mode web-mode))

Advanced examples:

  (set-formatter!
    'clang-format
    '(\"clang-format\"
      (\"-assume-filename=%S\" (or buffer-file-name mode-result \"\")))
    :modes
    '((c-mode \".c\")
      (c++-mode \".cpp\")
      (java-mode \".java\")
      (objc-mode \".m\")
      (protobuf-mode \".proto\")))

  (set-formatter! 'html-tidy
    '(\"tidy\" \"-q\" \"-indent\"
      (\"-xml\" (memq major-mode '(nxml-mode xml-mode))))
    :modes
    '(html-mode
      (web-mode (and (equal \"none\" web-mode-engine)
                     (car (member web-mode-content-type '(\"xml\" \"html\"))))))
    :ok-statuses '(0 1)
    :executable \"tidy\")

  (set-formatter! 'html-tidy  ; overwrite predefined html-tidy formatter
    '(\"tidy\" \"-q\" \"-indent\"
      \"--tidy-mark\" \"no\"
      \"--drop-empty-elements\" \"no\"
      \"--show-body-only\" \"auto\"
      (\"--indent-spaces\" \"%d\" tab-width)
      (\"--indent-with-tabs\" \"%s\" (if indent-tabs-mode \"yes\" \"no\"))
      (\"-xml\" (memq major-mode '(nxml-mode xml-mode))))
    :ok-statuses '(0 1)))

  (set-formatter! 'elm-format
    \"elm-format --yes --stdin\"
    :filter
    (lambda (output errput first-diff)
      (list output
            (format-all--remove-ansi-color errput)
            first-diff)))" (ignore name formatter modes filter ok-statuses error-regexp))(put 'set-formatter! 'doom-module '(:editor . format))(defmacro set-irc-server! (server plist) "THIS FUNCTION DOES NOTHING BECAUSE (:app . irc) IS DISABLED

Registers an irc SERVER for circe.

SERVER can either be a name for the network (in which case you must specify a
:host), or it may be the hostname itself, in which case it will be used as the
:host.

See `circe-network-options' for details." (ignore server plist))(put 'set-irc-server! 'doom-module '(:app . irc))