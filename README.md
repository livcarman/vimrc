# Vim Configuration

This is my personal vim configuration.

I personally don't like to work with IDEs and that's reflected in how
minimal this configuration is.

## Installation

Clone this repository to `~/.vim` and create a symbolic link between the
included `vimrc` file and `~/.vimrc`.

On Linux/OS X:

```bash
git clone https://github.com/livcarman/vimrc.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
```

On Windows 10 (using PowerShell):

```PowerShell
git clone https://github.com/livcarman/vimrc.git $HOME\.vim
cmd /c mklink /h $HOME\_vimrc $HOME\.vim\vimrc
```

The plugins are managed by [vim-plug](https://github.com/junegunn/vim-plug/).
Run `:PlugInstall` inside vim to install them. You can update them at any
time with `:PlugUpdate`.

### Font Installation 

This configuration will attempt to set [Hack](https://sourcefoundry.org/hack/)
as vim's font, falling back to the system's default fonts if Hack is not
available. You should use a version of Hack that's been patched for Powerline,
available [here](https://github.com/powerline/fonts/tree/master/Hack).

Hack is not a hard dependency -- this is purely cosmetic.

## Windows Compatibility

Things more or less just work on Windows, but getting color schemes to work
properly is a bit of a nightmare. I highly suggest that you use Git Bash to
run vim, which is part of [Git for Windows](https://git-for-windows.github.io).

Colors will display properly in Git Bash, but will not in PowerShell, cmder,
the standard command prompt, and all the other usual suspects..

## Custom Commands & Keybindings

| Keybinding        | Description                                             |
| ----------------- | ------------------------------------------------------- |
| W                 | Save the current buffer with sudo.                      |
| jk                | Equivalent to \<Esc>                                    | 
| :ToggleWhitespace | Turn trailing whitespace highlighting on/off.           |
| :StripWhitespace  | Delete all trailing whitepsace in the current buffer.   |

