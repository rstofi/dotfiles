# My dotfiles

Once again, I am attempting to move my workflow to the terminal and to text-based as much as I can. Therefore, I need to set up various TUI-based software that runs in the terminal. Since I am working on different machines and on different systems, I attempt to define and collect all my dotfiles, install instructions and util scripts to have a reproducible work environment.

For each package, I use, see the respective sub-directory. For setting up this environment, see pages under [ubuntu_bootstrap](https://github.com/rstofi/dotfiles/tree/main/ubuntu_bootstrap/README.md).

After setting up all software run the `setup_dotfiles_symlink.sh` script to base `vim` and `tmux` configuration of this repo, and use it as a single source of truth.

Ideally, after completing the bootstrap steps, cloning this repo and running the script should produce my working environment.

I am working mostly on Ubuntu, but my setup should work on other Debian-based systems. I have no plan to move to any other distro in the near future. This setup is currently set up tested on Ubuntu 24.04 LTS.

## Index

- [ubuntu_bootstrap](https://github.com/rstofi/dotfiles/tree/main/ubuntu_bootstrap/README.md)
- [vim](https://github.com/rstofi/dotfiles/tree/main/vim/README.md)
- [tmux](https://github.com/rstofi/dotfiles/tree/main/tmux/README.md)
- [fzf](https://github.com/rstofi/dotfiles/tree/fzf/marp/README.md)

## License and usage

This is a personal and experimental repo. However, feel free to yank content from here, no worries.

@2024 Kristof Rozgonyi [kristof.rozgonyi.astro@gmail.com](mailto:kristof.rozgonyi.astro@gmail.com]) 
