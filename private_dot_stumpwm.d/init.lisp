;; -*-lisp-*-
(in-package :stumpwm)

;; Calling the autostart file
(run-shell-command "sh /home/ralldi/.stumpwm.d/autostart.sh")

;; Connect to sly SBCL so that I can see changes to the config in real time.
(ql:quickload :slynk)
(defcommand slynk (port) ((:string "Port number: "))
  (sb-thread:make-thread
   (lambda ()
     (slynk:create-server :port (parse-integer port) :dont-close t))
   :name "slynk-manual"))

(load-module "swm-gaps")

;; Head gaps run along the 4 borders of the monitor(s)
(setf swm-gaps:*head-gaps-size* 0)

;; Inner gaps run along all the 4 borders of a window
(setf swm-gaps:*inner-gaps-size* 3)

;; Outer gaps add more padding to the outermost borders of a window (touching
;; the screen border)
(setf swm-gaps:*outer-gaps-size* 18)

(swm-gaps::toggle-gaps)
;; Call command
;; toggle-gaps
;;
;;; (ql:quickload “xembed”)

;;Theme
;; Setting general appearance variables for menus and windows that are floating or not
(setf *message-window-gravity* :center
      *input-window-gravity* :center
      *window-border-style* :tight
      *message-window-padding* 1
      *maxsize-border-width* 3
      *normal-border-width* 3
      *transient-border-width* 3
      stumpwm::*float-window-border* 3
      stumpwm::*float-window-title-height* 0
      *mouse-focus-policy* :sloppy)

;; 0 black
;; 1 red
;; 2 green
;; 3 yellow
;; 4 blue
;; 5 magenta
;; 6 cyan
;; 7 white

;; Set up the modifiers that I want to use
(run-shell-command "xmodmap -e 'clear mod4'" t)
(run-shell-command "xmodmap -e 'add mod4 = Super_L'" t)

;; Set the prefix key
(set-prefix-key (kbd "s-SPC"))


(defvar *ce/workspaces* (list "" "" "龎" "󰖟" "" ""))
(stumpwm:grename (nth 0 *ce/workspaces*))
(dolist (workspace (cdr *ce/workspaces*))
  (stumpwm:gnewbg workspace))

(defvar *move-to-keybinds* (list "!" "@" "#" "$" "%" "^" "&" "*" "("))
(dotimes (y (length *ce/workspaces*))
  (let ((workspace (write-to-string (+ y 1))))
    (define-key *top-map* (kbd (concat "s-" workspace)) (concat "gselect " workspace))
    (define-key *top-map* (kbd (concat "s-" (nth y *move-to-keybinds*))) (concat "gmove " workspace))))

;; ROOT-MAP - these are the keys that you can press after you press your prefix key

(define-key *root-map* (kbd "RET") "exec kitty")
(define-key *root-map* (kbd "b") "exec librewolf")
(define-key *root-map* (kbd "d") "exec emacsclient -c -n")

;; TOP-MAP - these are the commands that do not need to be prefaced with the prefix key
(define-key *top-map* (kbd "s-h") "move-focus left")
(define-key *top-map* (kbd "s-j") "move-focus down")
(define-key *top-map* (kbd "s-k") "move-focus up")
(define-key *top-map* (kbd "s-l") "move-focus right")
(define-key *top-map* (kbd "s-H") "move-window left")
(define-key *top-map* (kbd "s-J") "move-window down")
(define-key *top-map* (kbd "s-K") "move-window up")
(define-key *top-map* (kbd "s-L") "move-window right")
(define-key *top-map* (kbd "s-w") "delete")
(define-key *top-map* (kbd "s-s") "vsplit")
(define-key *top-map* (kbd "s-v") "hsplit")
(define-key *top-map* (kbd "s-x") "remove")
(define-key *top-map* (kbd "C-s-q") "quit")
(define-key *top-map* (kbd "C-s-r") "restart-hard")
(define-key *top-map* (kbd "C-s-M-x") "exec /home/ralldi/.config/scripts/betterlock.sh")
