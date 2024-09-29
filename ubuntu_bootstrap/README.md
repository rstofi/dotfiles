## bootstrapping Ubuntu after a minimal installation

In this folder, I try to collect all the steps needed to set up my working environment, and I provide a bootsrapping script to automatically install all the necessary packages. Detailed instructions are provided in this README file.

### Manual steps

#### Fix [fzf](https://github.com/junegunn/fzf) install if it is broken

Not sure if my bootstrap script's `fzf` installation is correct or not, and so if `fzf` is not working, run the following commands by hand:

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo "[ -f ~/.fzf.bash ] && source ~/.fzf.bash" >> ~/.bashrc
```

#### Configure [gruvbox](https://github.com/morhetz/gruvbox) color scheme

Use the [gogh installer](https://github.com/Gogh-Co/Gogh). Follow the instructions and this automatically, configures the gruvbox color palette for the terminal.

The instructions:

```
bash -c \"\$(wget -qO- https://git.io/vQgMr)\" 
#Select the gruvbox theme (108)
```

Download and set up the icon theme via:

```
git clone https://github.com/jmattheis/gruvbox-dark-icons-gtk.git
sudo mv gruvbox-dark-icons-gtk /usr/share/icons/
```

Then, the icon theme is available from `gnome-tweaks`

#### Install [vim-plug](https://github.com/junegunn/vim-plug)

I configured `vim-plug` to be part of my `.vimrc` file, so only need to run

```
:PlugInstall
```

in vim, to install the plugins `vim` uses.

#### Install [tmux-plug](https://github.com/tmux-plugins/tpm)

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


