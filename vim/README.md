## vim setup

For now, I am using simply `vim`, but I plan to update to `neovim` once I am more comfortable in the terminal and I need more configuration options.

I have set my `<leader>` character to `space`.

(Note that my `tmux` `<leader>` is set to `C`+`space`!)

### Notes on Plugs

I try to minimize plugs and only have the ones I am actually using. Below, I have a list of my plugs and what I am using them:

- [jedi-vim](https://github.com/davidhalter/jedi-vim) for python auto completion support

### Useful plug command cheat sheet

**General**

`space` `y` - yank to system clipboard
`space` `p` - paste from system clipboard

**Pyton**

`Tab` - autocomplete python code and variables
`space` `r` - rename variable


### Color scheme setup

Setting up a simple colorscheme:

```bash
mkdir -p ~/.vim/colors
mv /pathr_to_your_downloaded/mycolorscheme.vim ~/.vim/colors/
```

set the colorscheme via: `colorscheme mycolorscheme` in `.vimrc`.

Currently I use the [sublimemonokai](https://github.com/ErichDonGubler/vim-sublime-monokai) colorscheme.
