# How-to setup environment

## Terminal
Xfce terminal
```bash
mkdir -p $HOME/.config/xfce/terminal
cp .config/xfce/terminal/terminalrc $HOME/.config/xfce/terminal
```

Bash git-completion
```bash
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
mv git-completion.bash $HOME/.config/
```

Linux bashrc
```bash
ln -s $(pwd)/.bashrc $HOME/.bashrc
```

gitconfig
```bash
cp .gitconfig $HOME/.gitconfig
```

## Search utils
### ripgrep
Install *ripgrep* before
```bash
mkdir -p $HOME/.config/ripgrep
ln -s $(pwd)/.config/ripgrep/rc $HOME/.config/ripgrep/rc
```

## Vim
```bash
cp -r .vim $HOME/.vim
ln -s $(pwd)/.vimrc $HOME/.vimrc
```

### vim-pathogen
```bash
mkdir $HOME/.vim/{autoload,bundle}
git clone https://github.com/tpope/vim-pathogen.git
cp vim-pathogen/autoload/pathogen.vim $HOME/.vim/autoload
```

### vim-fugitive
```bash
git clone git://github.com/tpope/vim-fugitive.git $HOME/.vim/bundle/vim-fugitive
```

### lightline
```bash
git clone https://github.com/itchyny/lightline.vim $HOME/.vim/bundle/lightline.vim
```

### jedi-vim
```bash
git clone --recursive https://github.com/davidhalter/jedi-vim.git $HOME/.vim/bundle/jedi-vim
```

### vim-surround
```bash
git clone https://github.com/tpope/vim-surround $HOME/.vim/bundle/vim-surround
```

### vim-jinja
```bash
git clone https://github.com/lepture/vim-jinja $HOME/.vim/bundle/vim-jinja
```

### fzf-vim
Install *fzf*
```bash
git clone https://github.com/junegunn/fzf.vim $HOME/.vim/bundle/fzf.vim
```

### vim-polyglot
```bash
git clone https://github.com/sheerun/vim-polyglot.git $HOME/.vim/bundle/vim-polyglot
```
