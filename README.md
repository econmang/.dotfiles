# Dotfiles

Portable Linux shell, terminal, editor, and developer configuration managed with GNU Stow. The default profile avoids desktop state and account/session data so it can be reused across distros.

## Bootstrap

```sh
git clone https://github.com/econmang/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap --dry-run
./bootstrap
```

`./install` remains an alias for `./bootstrap`. The bootstrap supports Fedora (`dnf`), Debian/Ubuntu (`apt`), Arch (`pacman`), and openSUSE (`zypper`). It installs the core package set plus prerequisites for C/C++, C#, Go, Java, JavaScript/TypeScript/MDX, Python, and Rust; then it installs the user-local language servers and links configuration into `$HOME`.

```sh
./bootstrap --profile desktop  # also link Hyprland, Waybar, Wofi, and MPD
./bootstrap --stow-only        # link config only; do not install packages
./bootstrap --setup-doom       # install and synchronize Doom after linking config
./bootstrap --replace-conflicts # back up conflicting local files, then link repo versions
./bootstrap --check            # validate links and core commands
```

It never changes the login shell, authenticates services, or adds external repositories. By default it stops before making link changes when local files conflict. Pass `--replace-conflicts` to move only conflicting files into `~/.dotfiles-backups/<timestamp>/` and replace them with the repository versions. This is recoverable; directories that collide with a file are intentionally refused because moving them could include unrelated data.

## Profiles

`core` installs and configures Git/GitHub CLI, Zsh, Fish, Neovim, Emacs, Ghostty, Graphviz, fzf, ripgrep, fd, bat, eza, zoxide, direnv, jq/yq, btop, LazyGit, tmux, and common build/download/clipboard tools. Zellij is optional and intentionally outside the default native package list because it is not published consistently across supported distro repositories. Ghostty is requested from the selected distro's enabled repositories; if it is unavailable, install it through the distro's documented method and rerun with `--stow-only`.

`desktop` adds the existing Hyprland, Waybar, Wofi, and MPD configuration. It is intentionally optional because compositor and media setup vary by machine.

## Local and private configuration

Set Git identity in the untracked `~/.config/git/user.local` file. Start from [`templates/git-user.local.example`](templates/git-user.local.example). GitHub authentication belongs to `gh auth login`, not this repository; `gh/hosts.yml` is intentionally ignored.

Browser profiles, Codex/OpenCode state, Vesktop sessions, desktop initialization markers, dconf/GTK/KDE state, caches, logs, and application databases are not dotfiles and should not be added here.

## Doom Emacs and knowledge notes

The `doom` Stow package provides Evil-powered Doom Emacs, Org-roam, and Graphviz/DOT diagram support. Run `./bootstrap --setup-doom` once after linking the core profile; it refuses to replace a non-Doom `~/.config/emacs` installation.

After Doom starts, run `M-x nerd-icons-install-fonts` once and refresh the desktop font cache if prompted. CMake, SQLite, and ShellCheck are included in the core profile for Doom's terminal, lookup, and shell tooling. The normal bootstrap also installs native language toolchains and the Go, Python, TypeScript, and C# language servers. If a distro does not offer a development package (most commonly `jdtls`), bootstrap reports the skipped package instead of failing; install that distro's Eclipse JDT Language Server package and rerun `./bootstrap --check`. When a native .NET SDK package is unavailable, the language-server installer uses Microsoft's official .NET 10 installer under `~/.dotnet`.

Create a private Git repository and clone it at `~/knowledge`. It is the source of truth for Org-roam notes. Copy [`templates/doom-local.el.example`](templates/doom-local.el.example) to `~/.config/doom/local.el` to use another local path. The Org-roam database is cached locally and deliberately never belongs in that repository. In an Org file, evaluate a `dot` source block to render a diagram into its tracked `assets/` directory. If an existing `~/.config/doom` conflicts with Stow, back it up or merge its changes before bootstrapping; the installer will not overwrite it.
