# dotvim

Vim configuration for Alan Jones. Compatible with Vim 8+ and Neovim.

## Prerequisites

This configuration requires Vim 8.0+ or Neovim 0.5+.

### Check your version

```bash
vim --version | head -1
```

### macOS (Homebrew)

The system Vim on macOS is outdated. Install a modern version with Homebrew:

```bash
brew install vim
```

Or for Neovim:

```bash
brew install neovim
```

After installation, ensure Homebrew's Vim is used (should be automatic if `/opt/homebrew/bin` or `/usr/local/bin` is in your PATH):

```bash
which vim   # should show /opt/homebrew/bin/vim or /usr/local/bin/vim
```

### Ubuntu

Ubuntu 20.04+ includes Vim 8 by default. Install or update with:

```bash
sudo apt update
sudo apt install vim
```

For the latest Vim version on older Ubuntu releases, use the PPA:

```bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

Or for Neovim:

```bash
sudo apt install neovim
```

## Installation

Clone the repository:

```bash
git clone git@github.com:alanjones/dotvim.git ~/.vim
```

Create symlinks:

```bash
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc  # optional, for GUI Vim
```

For Neovim, create this symlink instead:

```bash
mkdir -p ~/.config/nvim
ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
```

Launch vim - plugins will be installed automatically on first run via vim-plug.

To manually install/update plugins:

```vim
:PlugInstall    " Install plugins
:PlugUpdate     " Update plugins
:PlugClean      " Remove unused plugins
```

## Dependencies

For best experience, install these system tools:

- **ripgrep** (`rg`) - Fast grep for `:Rg` command
- **fzf** - Fuzzy finder (auto-installed by vim-plug, but system install recommended)
- A **Nerd Font** - For powerline symbols in airline

### macOS (Homebrew)

```bash
brew install ripgrep fzf
```

### Ubuntu

```bash
sudo apt install ripgrep fzf
```

## Key Mappings

Leader key: `\`

### File Navigation

| Mapping | Action | Notes |
|---------|--------|-------|
| `Ctrl+P` | Fuzzy file finder | fzf :Files |
| `\e` | Toggle file explorer | NERDTree |
| `\E` | Find current file in explorer | NERDTree |
| `\b` | Buffer list | fzf :Buffers |
| `\h` | Recent files history | fzf :History |
| `\f` | Grep in files | fzf :Rg (requires ripgrep) |
| `\c` | Command history | fzf :History: |

### Git (vim-fugitive)

| Mapping | Action |
|---------|--------|
| `\gs` | Git status |
| `\gb` | Git blame |
| `\gd` | Git diff |
| `\gl` | Git log |

### Linting (ALE)

| Mapping | Action |
|---------|--------|
| `]e` | Next error/warning |
| `[e` | Previous error/warning |
| `\af` | Run ALEFix |

### Tabs

| Mapping | Action |
|---------|--------|
| `\]` | Next tab |
| `\[` | Previous tab |
| `\t` | New tab |

### Other

| Mapping | Action |
|---------|--------|
| `\l` | Toggle line numbers |
| `\p` | Toggle paste mode |

## Plugins

- **fzf.vim** - Fuzzy finder
- **NERDTree** - File explorer
- **vim-fugitive** - Git integration
- **vim-gitgutter** - Git diff in gutter
- **vim-surround** - Surround text objects
- **vim-commentary** - Comment toggling (gc)
- **ALE** - Async linting and LSP
- **editorconfig-vim** - EditorConfig support
- **vim-airline** - Status line
- **gruvbox** - Color scheme
- **rainbow** - Rainbow brackets
