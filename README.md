My dotfiles for consistent cross-platform experience, managed by GNU stow.

## Prerequisites

Before running the script, you should first have `curl`, `git` and
[`stow`](https://www.gnu.org/software/stow/) installed.

*   Debian/Ubuntu: `apt install curl git stow`
*   Fedora: `dnf install curl git stow`

## Bootstrapping

```bash
curl https://raw.githubusercontent.com/ShelpAm/dotfiles/main/bootstrap.sh | bash
```

## Special configuration

*   See [bin README.md](bin/dot-local/bin/README.md)
*   See [tmux README.md](./tmux/dot-config/tmux/README.md)
*   See [zsh README.md](./zsh/dot-config/zsh/README.md)

## See also

*   [stow documentation](https://www.gnu.org/software/stow/manual/html_node/index.html#SEC_Contents),
    by GNU stow
