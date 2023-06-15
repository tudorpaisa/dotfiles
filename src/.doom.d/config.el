;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Tudor Paisa"
      user-mail-address "tudor.paisa@friss.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

(setq doom-font (font-spec :family "Roboto Mono" :size 16 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "Roboto Mono" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tomorrow-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package! nyan-mode)
(nyan-mode)
(parrot-mode)
(parrot-set-parrot-type 'nyan)
;; (setq parrot-rotate-dict
;;       '(
;;         (:rot ("alpha" "beta") :caps t :lower nil)
;;         ;; => rotations are "Alpha" "Beta"

;;         (:rot ("snek" "snake" "stawp"))
;;         ;; => rotations are "snek" "snake" "stawp"

;;         (:rot ("yes" "no") :caps t :upcase t)
;;         ;; => rotations are "yes" "no", "Yes" "No", "YES" "NO"

;;         (:rot ("&" "|"))
;;         ;; => rotations are "&" "|"

;;         ;; default dictionary starts here ('v')
;;         (:rot ("begin" "end") :caps t :upcase t)
;;         (:rot ("enable" "disable") :caps t :upcase t)
;;         (:rot ("enter" "exit") :caps t :upcase t)
;;         (:rot ("forward" "backward") :caps t :upcase t)
;;         (:rot ("front" "rear" "back") :caps t :upcase t)
;;         (:rot ("get" "set") :caps t :upcase t)
;;         (:rot ("high" "low") :caps t :upcase t)
;;         (:rot ("in" "out") :caps t :upcase t)
;;         (:rot ("left" "right") :caps t :upcase t)
;;         (:rot ("min" "max") :caps t :upcase t)
;;         (:rot ("on" "off") :caps t :upcase t)
;;         (:rot ("prev" "next"))
;;         (:rot ("start" "stop") :caps t :upcase t)
;;         (:rot ("true" "false") :caps t :upcase t)
;;         (:rot ("&&" "||"))
;;         (:rot ("==" "!="))
;;         (:rot ("." "->"))
;;         (:rot ("if" "else" "elif"))
;;         (:rot ("ifdef" "ifndef"))
;;         (:rot ("int8_t" "int16_t" "int32_t" "int64_t"))
;;         (:rot ("uint8_t" "uint16_t" "uint32_t" "uint64_t"))
;;         (:rot ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10"))
;;         (:rot ("1st" "2nd" "3rd" "4th" "5th" "6th" "7th" "8th" "9th" "10th"))
;;         (:rot ("class" "def" "return"))
;;         (:rot ("__init__" "self"))
;;         (:rot ("==" ">" "<"))
;;         (:rot ("and" "or"))
;; ))
;; (parrot-rotate-next-word-at-point)

; PYTHON CONFIG
(use-package! python-black
  :demand t
  :after python
  :config
  (add-hook! 'python-mode-hook #'python-black-on-save-mode)
  ;; Feel free to throw your own personal keybindings here
  (map! :leader :desc "Blacken Buffer" "m b b" #'python-black-buffer)
  (map! :leader :desc "Blacken Region" "m b r" #'python-black-region)
  (map! :leader :desc "Blacken Statement" "m b s" #'python-black-statement)
  (setq! python-black-extra-args '("--line-length" "88"))
)

(use-package! pyvenv
  :ensure t
  :init
  (setenv "WORKON_HOME" "~/.pyenv/versions")
)

(setq projectile-project-search-path '(("~/projects/" . 3), "~/cruft"))

(defun projectile-pyenv-mode-set ()
  "Set pyenv version matching project name."
  (let ((project (projectile-project-name)))
    (pyvenv-workon project)
    (if (file-directory-p pyvenv-virtual-env)
        pyvenv-virtual-env
        (pyvenv-deactivate)
)))

(add-hook 'projectile-after-switch-project-hook 'projectile-pyenv-mode-set)
