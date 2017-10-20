# Vim Configuration

This is my personal vim configuration, geared toward web development with
Haskell and Elm.

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
git clone https://github.com/livcarman/vimrc.git ~/.vim
cmd /c mklink /h $HOME\_vimrc $HOME\.vim\vimrc
```

### Plugin Installation

The plugins are managed by [vim-plug](https://github.com/junegunn/vim-plug/),
by they are already included in the `bundle` folder (just in case they're ever
removed from GitHub). You can update them at any time by opening vim and
running the `:PlugInstall` command.

### Systen-Level Dependencies 

This configuration will attempt to set [Hack](https://sourcefoundry.org/hack/)
as vim's font, falling back to the system's default fonts if Hack is not
available. You can download Hack for free from its homepage (linked above),
but it's not a hard dependency -- this is purely cosmetic.

The Elm plugin has some system-level dependencies and will yell at you if
they're missing. Install a recent version of [Node.js](https://nodejs.org) and
run:

```bash
npm install -g elm elm-test elm-oracle elm-format
```

Of course, if you're an Elm developer, you probably had those installed
already.

## Custom Commands & Keybindings

These are all of the extra commands and keybindings that are available when
this vim configuration is in use. Some of these are language-specific.

### General

| Keybinding        | Description                                             |
| ----------------- | ------------------------------------------------------- |
| W                 | Save the current buffer with sudo.                      |
| jk                | Equivalent to <Esc>                                     | 
| :ToggleWhitespace | Turn trailing whitespace highlighting on/off.           |
| :StripWhitespace  | Delete all trailing whitepsace in the current buffer.   |

### Elm

| Keybinding     | Description                                                |
| -------------- | ---------------------------------------------------------- |
| \<Leader>m     | Compile the current buffer.                                |
| \<Leader>b     | Compile the Main.elm file in the project.                  |
| \<Leader>t     | Run the tests of the current buffer or 'tests/TestRunner'. |
| \<Leader>r     | Open an elm repl in a subprocess.                          |
| \<Leader>e     | Show the detail of the current error or warning.           |
| \<Leader>d     | Show the type and docs for the word under the cursor.      |
| \<Leader>w     | Open the docs web page for the word under the cursor.      |

