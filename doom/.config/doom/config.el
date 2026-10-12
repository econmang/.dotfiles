;;; config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-tokyo-night
      display-line-numbers-type 'relative)

;; Local machine preferences (especially the knowledge checkout) never enter Git.
(defvar my/knowledge-directory (expand-file-name "knowledge/" (getenv "HOME")))
(let ((local-config (expand-file-name "local.el" doom-user-dir)))
  (when (file-exists-p local-config) (load local-config nil 'nomessage)))

(after! evil
  (setq evil-split-window-below t
        evil-vsplit-window-right t
        evil-want-C-u-scroll t))

;; Eglot's defaults cover clangd, gopls, rust-analyzer, and jdtls. These
;; explicit entries provide consistent servers for the remaining languages.
(after! eglot
  (dolist (server '(((python-mode python-ts-mode) . ("pyright-langserver" "--stdio"))
                    ((typescript-ts-mode tsx-ts-mode js-ts-mode) . ("typescript-language-server" "--stdio"))
                    ((my/mdx-mode) . ("typescript-language-server" "--stdio"))
                    ((csharp-mode csharp-ts-mode) . ("csharp-ls"))))
    (add-to-list 'eglot-server-programs server)))

;; MDX combines Markdown and JSX. Keep Markdown editing features while using
;; TypeScript's LSP only for files that opt into the .mdx extension.
(after! markdown-mode
  (define-derived-mode my/mdx-mode markdown-mode "MDX")
  (add-to-list 'auto-mode-alist '("\\.mdx\\'" . my/mdx-mode)))

;; Avoid persisting secret values opened from environment files.
(defun my/sensitive-file-p ()
  (string-match-p "/\\.env\\(?:\\..*\\)?\\'" (or buffer-file-name "")))
(add-hook 'find-file-hook
          (lambda () (when (my/sensitive-file-p) (sensitive-mode 1))))

(after! org
  (setq org-directory my/knowledge-directory
        org-agenda-files (list my/knowledge-directory)
        org-confirm-babel-evaluate t
        org-babel-default-header-args:dot '((:results . "file graphics")
                                            (:exports . "both")))
  (org-babel-do-load-languages
   'org-babel-load-languages '((dot . t) (emacs-lisp . t) (shell . t))))

(after! org-roam
  (make-directory my/knowledge-directory t)
  (setq org-roam-directory (file-truename my/knowledge-directory)
        org-roam-db-location
        (expand-file-name "org-roam.db"
                          (or (getenv "XDG_CACHE_HOME")
                              (expand-file-name ".cache/" (getenv "HOME"))))
        org-roam-database-update-on-save t
        org-roam-completion-everywhere t
        org-roam-dailies-directory "daily/")
  (setq org-roam-capture-templates
        '(("d" "default" plain "%?"
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n#+filetags: \n")
           :unnarrowed t)
          ("p" "project" plain "* Goals\n%?\n* Notes\n"
           :if-new (file+head "projects/%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n#+filetags: :project:\n")
           :unnarrowed t)))
  (org-roam-db-autosync-mode 1))

(after! org-roam-ui
  (setq org-roam-ui-open-on-start nil
        org-roam-ui-sync-theme t
        org-roam-ui-update-on-save t))

(map! :leader
      :prefix ("n" . "notes")
      "f" #'org-roam-node-find
      "i" #'org-roam-node-insert
      "c" #'org-roam-capture
      "d" #'org-roam-dailies-capture-today
      "g" #'org-roam-ui-open
      "b" #'org-roam-buffer-toggle
      :prefix ("d" . "diagrams")
      "r" #'org-babel-execute-src-block)
