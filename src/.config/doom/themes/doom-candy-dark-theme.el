;;; candy-dark-theme.el
;;
;; Added:
;; Author:
;; Maintainer:
;; Source:
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-candy-dark-theme nil
  "Options for the `doom-candy-dark' theme."
  :group 'doom-themes)

(defcustom doom-candy-dark-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-candy-dark-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-candy-dark
  "An clean 80's synthwave / outrun theme inspired by VS Code candy-dark."

  ;; name        default   256       16
  ((bg         '("#22222A" nil       nil            ))
   (bg-alt     '("#1E1D24" nil       nil            ))
   (base0      '("#222228" "black"   "black"        ))
   (base1      '("#24262D" "#222222" "brightblack"  ))
   (base2      '("#282b33" "#222233" "brightblack"  ))
   (base3      '("#3E3549" "#333344" "brightblack"  ))
   (base4      '("#4E415C" "#444455" "brightblack"  ))
   (base5      '("#544863" "#554466" "brightblack"  ))
   (base6      '("#ED60BA" "#EE66BB" "brightblack"  ))
   (base7      '("#91889B" "#998899" "brightblack"  ))
   (base8      '("#ECEFF4" "#EEEEFF" "white"        ))
   (fg-alt     '("#636D83" "#636D83" "brightwhite"  ))
   (fg         '("#ABB2BF" "#ABB2BF" "white"        ))

   (grey       base4)
   (red        '("#FF0046" "#FF0046" "red"          ))
   (orange     '("#FF6B66" "#FF6B66" "brightred"    ))
   (green      '("#3FC56B" "#74DFC4" "green"        ))
   (teal       '("#9ACC12" "#9ACC12" "brightgreen"   ))
   (yellow     '("#F9C859" "#F9C859" "yellow"       ))
   (blue       '("#10B1FE" "#10B1FE" "brightblue"   ))
   (dark-blue  '("#15C9C5" "#15C9C5" "blue"         ))
   (magenta    '("#F85EB4" "#F85EB4" "brightmagenta"))
   (violet     '("#B58E95" "#B58E95" "magenta"      ))
   (cyan       '("#97BCCD" "#97BCCD" "brightcyan"  ))
   (dark-cyan  '("#01AAFA" "#01AAFA" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      magenta)
   (vertical-bar   (doom-darken base1 0.2))
   (selection      dark-blue)
   (builtin        magenta)
   (comments       base7)
   (doc-comments   (doom-lighten dark-cyan 0.25))
   (constants      violet)
   (functions      magenta)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        cyan)
   (variables      fg)
   (numbers        orange)
   (region         `(,(doom-blend (car bg) (car magenta) 0.8) ,@(doom-lighten (cdr base1) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-pad
    (when doom-candy-dark-padded-modeline
      (if (integerp doom-candy-dark-padded-modeline) doom-candy-dark-padded-modeline 4)))

   (modeline-fg     bg-alt)
   (modeline-fg-alt base6)
   (modeline-bg base6)
   (modeline-bg-inactive (doom-darken bg 0.1)))


  ;;;; Base theme face overrides
  ((lazy-highlight :background (doom-darken magenta 0.4) :foreground fg)
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground bg-alt)
   (mode-line-highlight :background orange :weight 'bold)
   ;;;; centaur-tabs
   (centaur-tabs-active-bar-face :background magenta)
   (centaur-tabs-modified-marker-selected
    :inherit 'centaur-tabs-selected :foreground magenta)
   (centaur-tabs-modified-marker-unselected
    :inherit 'centaur-tabs-unselected :foreground magenta)
   ;;;; company
   (company-box-background :foreground fg :background bg-alt)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background base6)
   (doom-modeline-info :inherit 'mode-line-emphasis)
   (doom-modeline-urgent :inherit 'mode-line-emphasis)
   (doom-modeline-warning :inherit 'mode-line-emphasis)
   (doom-modeline-debug :inherit 'mode-line-emphasis)
   (doom-modeline-buffer-minor-mode :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-project-dir :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-project-parent-dir :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-persp-name :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-file :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-modified :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-lsp-success :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :inherit 'mode-line-emphasis)
   (doom-modeline-evil-visual-state :foreground yellow)
   (doom-modeline-evil-replace-state :foreground orange)
   (doom-modeline-evil-operator-state :foreground teal)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; ivy
   (ivy-current-match :background base2 :distant-foreground nil)
   ;;;; markdown-mode
   (markdown-header-delimiter-face :foreground base7)
   (markdown-metadata-key-face     :foreground base7)
   (markdown-list-face             :foreground base7)
   (markdown-link-face             :foreground cyan)
   (markdown-url-face              :inherit 'link :foreground fg :weight 'normal)
   (markdown-italic-face           :inherit 'italic :foreground magenta)
   (markdown-bold-face             :inherit 'bold :foreground magenta)
   (markdown-markup-face           :foreground base7)
   (markdown-gfm-checkbox-face :foreground cyan)
   ;;;; mic-paren
   (paren-face-match  :foreground yellow   :background (doom-darken bg 0.2) :weight 'ultra-bold)
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground blue)
   ((outline-2 &override) :foreground green)
   ((outline-3 &override) :foreground teal)
   ((outline-4 &override) :foreground (doom-darken blue 0.2))
   ((outline-5 &override) :foreground (doom-darken green 0.2))
   ((outline-6 &override) :foreground (doom-darken teal 0.2))
   ((outline-7 &override) :foreground (doom-darken blue 0.4))
   ((outline-8 &override) :foreground (doom-darken green 0.4))
   ;;;; org <built-in>
   ((org-block &override) :background base2)
   ((org-block-begin-line &override) :background base2)
   (org-hide :foreground hidden)
   ;;;; org-pomodoro
   (org-pomodoro-mode-line :inherit 'mode-line-emphasis :weight 'bold) ; unreadable otherwise
   (org-pomodoro-mode-line-overtime :inherit 'org-pomodoro-mode-line)
   (org-pomodoro-mode-line-break :inherit 'org-pomodoro-mode-line)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))))

;;; doom-candy-dark-theme.el ends here
