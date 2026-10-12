;;; init.el -*- lexical-binding: t; -*-

;; Doom modules selected to mirror the Neovim workflow while adding Org-roam.
(doom!
 :completion
 (corfu +orderless)
 vertico

 :ui
 doom
 dashboard
 hl-todo
 modeline
 (popup +defaults)
 treemacs
 (vc-gutter +pretty)
 vi-tilde-fringe
 workspaces

 :editor
 (evil +everywhere)
 file-templates
 fold
 snippets
 (whitespace +guess +trim)

 :emacs
 dired
 electric
 undo
 vc

 :term
 vterm

 :checkers
 syntax

 :tools
 direnv
 (eval +overlay)
 (lookup +docsets)
  (lsp +eglot)
  magit
  tree-sitter

 :lang
 (cc +lsp)
 (csharp +lsp)
 emacs-lisp
 (elixir +lsp)
 (go +lsp)
 (java +lsp)
 (javascript +lsp +tree-sitter)
 json
 (lua +lsp)
 markdown
 (org +pretty +roam)
 (python +lsp)
 (rust +lsp)
 sh
 (web +lsp)
 yaml

 :config
 (default +bindings +smartparens))
