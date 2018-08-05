Seebrise
========

Introduction
------------

Seebrise is a desktop environment for power users and professionals, and
it is highly customised. It has evolved around the need for a desktop
environment that is not getting in the way when concurrently:
programming on different projects, doing multiple statistical analysis,
reading scientific papers, writing technical reports or articles, and,
well, doing research. It is for people, who like to optimise workflows
(and maybe spending a little too much time in optimising, too), and it
is for people, who take the tautology: "a window manager should manage
my windows" seriously, and for people, who care about *screen real
estate* maybe a little too much, too, if this is at all possible.

It consists basically of a collection of configuration files and scripts
(mostly written in Python) that build on top of the marvellous window
manager [herbustluftwm](http://www.herbstluftwm.org/) yielding a
fruitful touch-typing environment.  It aims to give a smooth transitions
between terminal emulators, editors, web, and document browsers.

It is heavily keyboard driven and key bindings are optimised for the use
with a grid keyboard (i.e., a keyboard that is non-staggered).  Seebrise
also assumes that you are using the Dvorak variant
[Katzenpfote](http://00tau.github.io/katzenpfote/).

It centres around:

* herbstluftwm,
    a tiling window manager
* dzen2,
    messaging and notification panel
* dmenu,
    dynamic menu
* zsh,
    shell
* st,
    terminal emulator
* tmux,
    terminal multiplexer
* gvim,
    editor
* sxiv,
    image viewer
* mupdf,
    pdf viewer

Seebrise follows a common theme for key strokes and short cuts, which
makes it smooth to work with.  It also provides a common colour scheme
for herbstluftwm, vim, gvim, st, tmux, dzen2, and dmenu, which makes it
pleasing for the eye, too.

Some Notes
----------

* Use `W-l` to rename the current tag.  Some default options will be
  listed but you may chose any name which suits you.

* Use `W-d` to jump to a valid tag. A selection will be displayed of all
  available tags. A fuzzy search matches the closest string you enter.
  For example W-dmai would jump to the tag `E-Mail`.

* In the shell: when using a Dvorak keyboard layout, such as
  [Katzenpfote](http://00tau.github.io/katzenpfote/), typing `ls -l` in
  a terminal is awkward. Assuming you are a lot in a terminal, you will
  type this, well, a lot.  For this reason, Seebrise defines the
  zsh-aliases:

    ```
    alias eu="ls -h --time-style=iso --color=auto "
    alias e="eu -l "
    alias ey="eu -la "
    ```

* In the shell: assuming you are browsing through your files and opening
  a lot of them using a shell, too, Seebrise defines a handy script
  named *op*.  Invoking

    ```
    op [SERVERNAME] FILE
    ```

  will open the file `FILE` in gvim.  But gvim will also be run in
  server mode, and the name of the server will be set equal to the
  currently visible tag (a workspace in herbstluftwm).

  If there already exists a vim server which name is equal to the
  visible tag, then the file is opened in this server instead.  If
  SERVERNAME is given and a valid server name, the file will be opened
  in the respected server.

* In vim: use `M<` and `M>` to jump to the end of previously selected
  text.  This is useful if you have just send a selected block of python
  code to the shell and now would like to continue working after this
  block.  Say, you would like to evaluate all code above the cursor and
  continue where you are: `Vgg<cr>M>`.

Installation
------------

If you have a freshly installed vanilla Ubuntu / Debian / MINT Linux on your
system, then install the following packages.

```
# apt-get install xterm git vim-gtk zsh tmux herbstluftwm dmenu dzen2 feh sxiv mupdf xdotool unclutter silversearcher-ag
```

Or, if you prefere aptitude.

```
# aptitude install xterm git vim-gtk zsh tmux herbstluftwm dmenu dzen2 feh sxiv mupdf xdotool unclutter silversearcher-ag
```

I do like the cinnamon screensaver which is why Seebrise sets its default
keybinding to invoke it. If you like it too, then install it.

```
# aptitude install cinnamon-screensaver
```

Clone the files of this repository and create all the necessary links.

```
% git clone https://github.com/00tau/seebrise.git ~/.config/seebrise
% cd ~/.config/seebrise
% ./create-links
% ln -s ~/.config/seebrise/herbstluftwm ~/.config/herbstluftwm
```

Add Seebrise to the list of X sessions
--------------------------------------

```
# cp ~/.config/seebrise/seebrise.desktop /usr/share/xsessions/
```

Make zsh your primary login shell
---------------------------------

If you find yourself in the position that copy and paste into the terminal
window with the middle mouse does not work, pressing SHIFT and the middle mouse
resolves the issue. I forgot why this is or was the case but it has something
to do with tmux.

```
% which zsh
% chsh
```

As you are working in the terminal a lot:

```
# aptitude install dtrx tree htop
```

Get a working python3 environment running
-----------------------------------------

All scripts have been written in python3. So this is kind of obligatory.

Compile st (optional)
---------------------

Seebrise is using [st](http://st.suckless.org/) by default. In contrast
to *st*'s README, I needed to install the following packages in Ubuntu
in order to compile its source code:

* libx11-dev: Xlib header fils
* libxft-dev: freetype-based font drawing
* libxext-dev: X11 miscellaneous extensions

```
# apt-get install libx11-dev libxft-dev libxext-dev
```

Then clone the source code of *st* and compile:

```
% git clone git://git.suckless.org/st
% cd st
% make
% make install
```

Change your default terminal emulator to `st`:

```
% sudo update-alternatives --config x-terminal-emulator
```

Set the wallpaper
-----------------

Use feh to set the background to something you like.

```
feh --bg-fill /usr/share/backgrounds/linuxmint-serena/mstaudenmann_unveiled.jpg
```

This will create a file ~/.fehbg and Seebrise will used it to set the
wallpaper during the next start up.

Trivia
------

Seebrise is German for sea breeze. The default tag names are sailing boats.
