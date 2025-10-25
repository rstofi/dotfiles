## bootstrapping Ubuntu after a minimal installation

In this folder, I try to collect all the steps needed to set up my working environment, and I provide a bootsrapping script to automatically install all the necessary packages. Detailed instructions are provided in this README file.

#### Run bootstrapping script

Download the `bootstrap_new_ubuntu_installation.sh` from this git repo by hand and make it executable via `chmod +x bootstrap_new_ubuntu_installation.sh`.

Run the script first with the `--dry-run` switch to see, which packages will be installed.

To actually install all the packages, run the cript again, with the `--run` flag.

#### Configure [Github](https://github.com/) access

Follow [these instructions](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) to configure access to GitHub via adding a new ssh key.

#### Download and configure the [dotfiles](https://github.com/rstofi/dotfiles) repo

`git clone` this repo to local.

Delete the `bootstrap_new_ubuntu_installation.sh` script downloaded before.

Run the `scripts/setup_dotfiles_symlink.sh` script to create symlinks for `vim` and `tmux` configuration scripts. You also need to make it executable via `chmod +x`.

#### Install [fzf](https://github.com/junegunn/fzf) manually

>[!NOTE]
> You might not need to run the `git clone` command, as it is already cloned in the bootstrap step.

Install `fzf` via the following commands:

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo "[ -f ~/.fzf.bash ] && source ~/.fzf.bash" >> ~/.bashrc
```

see the [official page]((https://github.com/junegunn/fzf) for more details.

#### Configure [gruvbox](https://github.com/morhetz/gruvbox) color scheme for terminal

Use the [gogh installer](https://github.com/Gogh-Co/Gogh). Follow the instructions and this automatically, configures the gruvbox color palette for the terminal.

The instructions:

```
bash -c "$(wget -qO- https://git.io/vQgMr)"
#Select the gruvbox theme
```

Download and set up the icon theme via:

```
git clone https://github.com/jmattheis/gruvbox-dark-icons-gtk.git
sudo mv gruvbox-dark-icons-gtk /usr/share/icons/
```

Then, the icon theme is available from `gnome-tweaks`

#### Install [vim-plug](https://github.com/junegunn/vim-plug) plugs

I configured `vim-plug` to be part of my `.vimrc` file, so only need to run

```
:PlugInstall
```

in `vim`, to install the plugins `vim` uses.

#### Install [tmux-plug](https://github.com/tmux-plugins/tpm) plugs

Install `tmux-plug` via:

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

The configuration is set in my `.tmux.conf` file.

Source the downloaded package via:

```
tmux source ~/.tmux.conf
```

Then, to install plugs run `prefix + I` in a tmux session to install the plugs defined. My prefix is set to `C+space`.


#### Configure LaTeX compiler script

To more easily work with LaTeX when needed, set up an alias (`latex_compiler`) for running the `scripts/latex_compiler.sh` script in the `.bashrc` file. The alias is included in this repo in `bash/bashrc`.
