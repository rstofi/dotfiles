# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for setting up a reproducible terminal-based development environment on Ubuntu systems (tested on Ubuntu 24.04 LTS). The repository manages configuration files for vim, tmux, bash, and provides bootstrap scripts for fresh Ubuntu installations.

## Repository Structure

- `vim/` - Vim configuration and vimrc file
- `tmux/` - Tmux configuration file (tmux.conf)
- `bash/` - Bash configuration (bashrc with aliases)
- `scripts/` - Utility scripts for environment setup
- `ubuntu_bootstrap/` - Bootstrap script and documentation for fresh Ubuntu installations

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

### Bootstrap New Ubuntu Installation

The bootstrap script installs all required packages:
```bash
chmod +x ubuntu_bootstrap/bootstrap_new_ubuntu_installation.sh
./ubuntu_bootstrap/bootstrap_new_ubuntu_installation.sh --dry-run  # Preview changes
./ubuntu_bootstrap/bootstrap_new_ubuntu_installation.sh --run      # Execute installation
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

`ubuntu_bootstrap/bootstrap_new_ubuntu_installation.sh`:
- Uses arrays for packages and PPAs, making it easy to add/remove items
- Supports `--dry-run` to preview changes without execution
- Validates installed packages and PPAs after execution
- Installs both apt packages and third-party packages from source (fzf, zen browser)

### Color Scheme

The entire environment uses the gruvbox color scheme (terminal, vim, and system icons). Terminal color scheme is installed via the [Gogh installer](https://github.com/Gogh-Co/Gogh).

## WSL Compatibility

The setup includes WSL-specific packages (`xauth`, `dbus-x11`, `gnome-shell`) in the bootstrap script to support WSL environments on Windows.

## LaTeX Workflow

A custom LaTeX compiler script exists at `scripts/latex_compiler.sh`. The intended usage is to add an alias `latex_compiler` in `.bashrc` pointing to this script (the alias is defined in `bash/bashrc`).
