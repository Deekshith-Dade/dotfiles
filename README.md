# dotfiles

Personal config for shell, vim/neovim, and tmux.

## Layout

| Repo path             | Symlinked to                |
| --------------------- | --------------------------- |
| `zshrc`               | `~/.zshrc`                  |
| `zprofile`            | `~/.zprofile`               |
| `bashrc`              | `~/.bashrc`                 |
| `profile`             | `~/.profile`                |
| `vimrc`               | `~/.vimrc`                  |
| `tmux.conf.local`     | `~/.tmux.conf.local`        |
| `config/nvim/`        | `~/.config/nvim/`           |

## Install on a new machine

```sh
git clone git@github.com:<you>/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

`install.sh` backs up any existing files to `~/.dotfiles-backup/<timestamp>/` before symlinking.

## Notes

- `tmux.conf.local` belongs with [gpakosz/.tmux](https://github.com/gpakosz/.tmux). On a new machine:
  ```sh
  git clone https://github.com/gpakosz/.tmux.git ~/.tmux
  ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
  ```
  then run `install.sh` to symlink `tmux.conf.local`.
- Neovim uses [lazy.nvim](https://github.com/folke/lazy.nvim); plugins install on first launch.
