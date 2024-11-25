## vim setup

I am using `vim`, and currently, I am *not* planingn to update to `neovim` as I am happy with my setup.

To support copying to and from the system's  clipboard, I need to install the `vim-gtk3` package.

### Custom key bindings

I have set my `<leader>` character to `space`.

(Note that my `tmux` `<leader>` is set to `ctrl`+`space`!)

### Plugs

I try to minimize plugs and only have the ones I am actually using.

To manage my plugs, I use the [vim plug](https://github.com/junegunn/vim-plug) plugin manager. See the documentation for the installation instructions.

The list of my plugs and what I am using them for:

- [gruvbox](https://github.com/morhetz/gruvbox) color scheme
- [polyglot](https://github.com/sheerun/vim-polyglot) language package collection for syntax highlights 
- [jedi-vim](https://github.com/davidhalter/jedi-vim) for python auto completion support
- [supertab](https://github.com/ervandew/supertab) general autocompletion via `tab`
- [indent-guides](https://github.com/preservim/vim-indent-guides) indent guides for Python
- [gitgutter](https://github.com/airblade/vim-gitgutter) show git diff hunks in the sign column
- [tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) enable navigating between tmux panes from vim
- [fzf](https://github.com/junegunn/fzf.vim) fuzzy finder for vim
- [tagbar](https://github.com/preservim/tagbar) navigation for files based on on-the-fly generated tags
- [markdown-preview](https://github.com/iamcco/markdown-preview.nvim) preview markdown files in the browser 

### Useful plug command cheat sheet

**General**

- `space` `y` - yank to system clipboard
- `space` `p` - paste from system clipboard
- `space` `f` - open new file in new `vim` tab using `fzf`
- `space` `b` - move between opened `vim` tabs via `fzf`
- `space` `s` - search string in *all* opened `vim` tabs via `fzf` 
- `tab` - autocomplete (if possible)
- `F5` - toggle spell checking to HU and back to EN (installs language pack the first time)
- `F6` - toggle spell checking on/off

**Coding general**

- `space` `t` - move in code based on tags (functions mainly)

**Pyton**

- `space` `d` - go to definition
- `space` `r` - rename variable

**Markdown**

- `space` `M` - preview markdown file in the browser

**LaTeX**

- `F7` - toggle the filetype to plain text (helpful if spell checking does not work properly)

### Color scheme setup

Similary to my terminal, I use the gruvbox color scheme.
