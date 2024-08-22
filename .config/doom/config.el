;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Alessio Banzato"
       user-mail-address "alessiobanzato@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
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

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

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

;; Set general font

(setq doom-font (font-spec :family "Ubuntu mono"  :size 18 :weight 'regular))

;; org mode config

(setq org-hide-emphasis-markers t)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(font-lock-add-keywords
 'org-mode
 '(("^[[:space:]]*\\(-\\) "
        (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(add-hook 'org-mode-hook
          (lambda ()
            (let* ((variable-tuple
                    (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
                          ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                          ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                          ((x-list-fonts "Verdana")         '(:font "Verdana"))
                          ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                          (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
                   (base-font-color     (face-foreground 'default nil 'default))
                   (headline            `(:inherit default :weight bold :foreground ,base-font-color))
                   (level-colors        '("#FF5733" ; org-level-1 color
                                          "#33FF57" ; org-level-2 color
                                          "#3357FF" ; org-level-3 color
                                          "#FF33A8" ; org-level-4 color
                                          "#FFBD33" ; org-level-5 color
                                          "#33FFF0" ; org-level-6 color
                                          "#FF5733" ; org-level-7 color
                                          "#33FFBD"))) ; org-level-8 color

              (custom-theme-set-faces
               'user
               `(org-level-8 ((t (,@headline ,@variable-tuple :foreground ,(nth 7 level-colors)))))
               `(org-level-7 ((t (,@headline ,@variable-tuple :foreground ,(nth 6 level-colors)))))
               `(org-level-6 ((t (,@headline ,@variable-tuple :foreground ,(nth 5 level-colors)))))
               `(org-level-5 ((t (,@headline ,@variable-tuple :foreground ,(nth 4 level-colors)))))
               `(org-level-4 ((t (,@headline ,@variable-tuple :foreground ,(nth 3 level-colors) :height 1.1))))
               `(org-level-3 ((t (,@headline ,@variable-tuple :foreground ,(nth 2 level-colors) :height 1.25))))
               `(org-level-2 ((t (,@headline ,@variable-tuple :foreground ,(nth 1 level-colors) :height 1.5))))
               `(org-level-1 ((t (,@headline ,@variable-tuple :foreground ,(nth 0 level-colors) :height 1.75))))
               `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))))
