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
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 16))
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/notes/")


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

;; separate emacs from the clipboard
(setq select-enable-clipboard nil)

;; CUT-COPY-PASTE system
;; Copy and Cut -> Clipboard + Emacs
;; Copy while deleting with C or M keys -> saves only into Emacs

(global-set-key (kbd "C-c y") 'x-clipboard-yank) ;; Specific keybinding to paste from clipboard
(global-set-key (kbd "M-w") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-w") 'clipboard-kill-region)

;; LaTeX configuration
(after! tex
  ;; Set pdf-tools as default pdf viewer
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-source-correlate-start-server t)  ;; sync server activation
  ;; tex-pdf sync
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer))

;; pdf-tools
(use-package pdf-tools
  :defer t
  :commands (pdf-loader-install)
  :mode "\\.pdf\\'"
  :init (pdf-loader-install)
  :config (add-to-list 'revert-without-query ".pdf"))

;; org-mode

(setq org-hide-emphasis-markers t)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(font-lock-add-keywords
 'org-mode
 '(("^[[:space:]]*\\(-\\) "
        (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(after! org
  (setq org-roam-directory (file-truename "~/notes/")
        org-roam-graphic-viewer "/usr/bin/brave"))

(let* ((font-name "JetBrainsMono Nerd Font")
       (variable-tuple `(:font ,font-name))
       (headline `(:inherit default :weight bold)))
    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline ,@variable-tuple :foreground "#33FFBD"))))
     `(org-level-7 ((t (,@headline ,@variable-tuple :foreground "#F1FA8C"))))
     `(org-level-6 ((t (,@headline ,@variable-tuple :foreground "#FFB86C"))))
     `(org-level-5 ((t (,@headline ,@variable-tuple :foreground "#FF5555"))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :foreground "#8BE9FD" :height 1.1))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :foreground "#50FA7B" :height 1.25))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :foreground "#FF79C6" :height 1.5))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :foreground "#BD93F9" :height 1.75))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

(use-package olivetti
  :hook (org-mode . olivetti-mode))

(add-hook 'org-mode-hook (lambda () (display-line-numbers-mode 0)))

;; DENOTE

(use-package denote
  :bind
  ( :map global-map
         ("C-c n d" . denote)
         ("C-c C-d" . denote-dired)
         ("C-c n h" . denote-subdirectory)
         ("C-c n r" . denote-rename-file)
         ("C-c n i" . denote-link))
  :config
  (setq denote-directory "~/notes/")
  (setq denote-save-buffers nil)
  (setq denote-known-keywords '("personal" "uni" "cons")))
