My dotfiles for consistent cross-platform experience, managed by GNU stow.

## Bootstrapping

Execute:
```bash
git clone https://github.com/ShelpAm/dotfiles ~/.dotfiles
cd ~/.dotfiles
stow DIR_NAME...
```
where `DIR_NAME...` is target directory(es) to be extractd from the stow package directory.

To extract all configurations, use:
```bash
stow clangd git kitty neovim tmux wget zsh
```

## Refs:

- [stow documentation](https://www.gnu.org/software/stow/manual/html_node/index.html#SEC_Contents), by GNU stow
