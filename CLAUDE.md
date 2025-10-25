# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for setting up a reproducible terminal-based development environment on Debian systems (tested on Debian 13.01). The repository manages configuration files for vim, tmux, bash, and provides bootstrap scripts for fresh Debian installations.

## Repository Structure

- `vim/` - Vim configuration and vimrc file
- `tmux/` - Tmux configuration file (tmux.conf)
- `bash/` - Bash configuration (bashrc with aliases)
- `scripts/` - Utility scripts for environment setup
- `debian_bootstrap/` - Bootstrap script and documentation for fresh Debian installations

## Key Setup Commands

### Initial Environment Setup

After cloning the repository, run the dotfiles setup script to create symlinks:
```bash
chmod +x scripts/setup_dotfiles_symlink.sh
./scripts/setup_dotfiles_symlink.sh
```

This creates symlinks:
- `~/dotfiles/vim/vimrc` → `~/.vimrc`
- `~/dotfiles/tmux/tmux.conf` → `~/.tmux.conf`

### Bootstrap New Debian Installation

The bootstrap script installs all required packages:
```bash
chmod +x debian_bootstrap/bootstrap_new_debian_installation.sh
./debian_bootstrap/bootstrap_new_debian_installation.sh --dry-run  # Preview changes
./debian_bootstrap/bootstrap_new_debian_installation.sh --run      # Execute installation
```

## Important Configuration Details

### Vim Setup

- **Plugin Manager**: Uses [vim-plug](https://github.com/junegunn/vim-plug)
- **Leader Key**: `space` (NOT the default `\`)
- **Session Management**: Sessions saved to `~/.vim/sessions/default.vim`
- **Clipboard Support**: Requires `vim-gtk3` package
- **Key Plugins**: gruvbox (colors), fzf (fuzzy finder), jedi-vim (Python), vim-tmux-navigator

Install vim plugins after setup:
```
:PlugInstall
```

### Tmux Setup

- **Leader Key**: `Ctrl+space` (NOT the default `Ctrl+b`)
- **Mouse Support**: Requires `xclip` package
- **Plugin Manager**: Uses [tpm](https://github.com/tmux-plugins/tpm)

Install tmux plugins after cloning tpm:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
# Then in tmux: Ctrl+space followed by I (capital i)
```

Custom keybindings:
- Horizontal split: `Ctrl+space` + `-`
- Vertical split: `Ctrl+space` + `|`
- Vim-style navigation between panes: `Ctrl+h/j/k/l`

### Vim-Tmux Integration

Both vim and tmux are configured with [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) allowing seamless navigation between vim splits and tmux panes using `Ctrl+h/j/k/l`.

## Architecture Notes

### Symlink-Based Configuration

The repository uses symlinks rather than copying files. This allows the git repository to be the single source of truth for configurations. Any edits to `~/.vimrc` or `~/.tmux.conf` are automatically tracked in the repo after running the setup script.

### Bootstrap Script Design

`debian_bootstrap/bootstrap_new_debian_installation.sh`:
- Uses arrays for packages, making it easy to add/remove items
- Supports `--dry-run` to preview changes without execution
- Validates installed packages after execution
- Installs apt packages and third-party packages from source (fzf)
- **No PPA support**: Unlike Ubuntu, Debian doesn't use PPAs - packages come from official Debian repos only
- **Manual installations required**: Some packages (`lf`, `tldr`) are commented out and need manual installation
- **Debian-specific packages**: Uses `libfuse2` instead of Ubuntu's `libfuse2t64`, includes `firefox` explicitly (no snap)

### Packages Requiring Manual Installation

The following packages are commented out in the bootstrap script and require manual installation:

- **`lf`**: Terminal file manager - not available in Debian repos, install from [GitHub releases](https://github.com/gokcehan/lf/releases) or use alternative like `ranger`
- **`tldr`**: Simplified man pages - install via `npm install -g tldr` or `pip install tldr`
- **`gdu`**: Disk usage analyzer - may only be available in Debian testing/unstable. If using Debian stable, use `ncdu` as alternative or install from [GitHub releases](https://github.com/dundee/gdu/releases)

### Color Scheme

The entire environment uses the gruvbox color scheme (terminal, vim, and system icons). Terminal color scheme is installed via the [Gogh installer](https://github.com/Gogh-Co/Gogh).

## WSL Compatibility

The setup includes WSL-specific packages (`xauth`, `dbus-x11`, `gnome-shell`) in the bootstrap script to support WSL environments on Windows.

## JavaScript/Node.js Setup

- **Node.js**: Installed via NodeSource repository (provides LTS version)
- **npm**: Included with Node.js, available system-wide
- **Corepack**: Enabled for Yarn support (per-project package manager versions)
- **Global npm packages**: Managed via `npm_global_packages` array in bootstrap script
  - Currently: `@anthropic-ai/claude-code`
- **Philosophy**: Minimize global installs; most packages should be per-project

## LaTeX Workflow

A custom LaTeX compiler script exists at `scripts/latex_compiler.sh`. The intended usage is to add an alias `latex_compiler` in `.bashrc` pointing to this script (the alias is defined in `bash/bashrc`).
