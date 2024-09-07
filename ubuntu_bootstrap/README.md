## bootstrapping Ubuntu after a minimal installation

In this folder, I try to collect all the steps needed to set up my working environment, and I provide a bootsrapping script to automatically install all the necessary packages. Detailed instructions are provided in this README file.

### Manual steps

#### Fix  [fzf](https://github.com/junegunn/fzf) install if it is broken

Not sure if my bootstrap script's `fzf` installation is correct or not, and so if `fzf` is not working, run the following commands by hand:

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo "[ -f ~/.fzf.bash ] && source ~/.fzf.bash" >> ~/.bashrc
```

#### Configure [gruvbox](https://github.com/morhetz/gruvbox) color scheme



#### Install the [tmux-plug](https://github.com/tmux-plugins/tpm)

