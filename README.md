# tmux-dark-notify - Make tmux's theme follow macOS dark/light mode 
[![SLOC](https://img.shields.io/tokei/lines/github/erikw/tmux-dark-notify?logo=codefactor&logoColor=lightgrey)](#)
[![License](https://img.shields.io/github/license/erikw/tmux-dark-notify?color=informational)](LICENSE.txt)
[![OSS Lifecycle](https://img.shields.io/osslifecycle/erikw/tmux-dark-notify)](https://github.com/Netflix/osstracker)

This tmux plugin will change the tmux theme automatically when the system changes the light/dark mode. Configure a light and a dark theme and the plugin will take care of the rest!

![Demo of changing system theme](demo.gif)


For example I use a Solarized in all my programs and for tmux I use [seebi/tmux-colors-solarized](https://github.com/seebi/tmux-colors-solarized). I have a local clone of this repo (in my dotfiles as a submodule). This repo provides a light theme `tmuxcolors-light.conf` and a dark theme `tmuxcolors-dark.conf`. With this tmux plugin, I have configured so that when the system appearance mode changes, the corresponding tmux theme will be used.

# Setup
## Requirements
* macOS - [dark-notify](https://github.com/cormacrelf/dark-notify) is only for mac
* Bash
* Homebrew
* [dark-notify](https://github.com/cormacrelf/dark-notify): `$ brew install dark-notify`
* tmux
* [tpm](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager

## Setup steps
1. Make sure all requirements above are installed and working already.
2. Configure tmux-dark-notify in `tmux.conf`
   * To install the plugin, add a line 
     ```conf
      set -g @plugin 'erikw/tmux-dark-notify'
     ```
   * Now you must configure the paths for the light/dark themes you want to use. I personally have [seebi/tmux-colors-solarized](https://github.com/seebi/tmux-colors-solarized) cloned to `~/.repos/tmux-colors-solarized/`. Change the paths below to your themes.
     ```conf
     set -g @dark-notify-theme-path-light '$HOME/.repos/tmux-colors-solarized/tmuxcolors-light.conf'
     set -g @dark-notify-theme-path-dark '$HOME/.repos/tmux-colors-solarized/tmuxcolors-dark.conf'
     ```
   * To cover some corner cases e.g. if you use the plugin [tmux-reset](https://github.com/hallazzang/tmux-reset), I recommend adding this as well as a fallback in case this plugin is not run in all scenarios. **Remove any other** `source-file` for theme you have of course!
     ```conf
     source-file ~/.local/state/tmux/tmux-dark-notify-theme.conf
     ```
   * Thus in total, the relevant section of you `tmux.conf` could look like:
     ```conf
     set -g @plugin 'erikw/tmux-dark-notify'
     set -g @dark-notify-theme-path-light '$HOME/.repos/tmux-colors-solarized/tmuxcolors-light.conf'
     set -g @dark-notify-theme-path-dark '$HOME/.repos/tmux-colors-solarized/tmuxcolors-dark.conf'
     source-file ~/.local/state/tmux/tmux-dark-notify-theme.conf
     ```
* Install the plugin with `<prefix>I`, unless you changed [TPM's keybindings](https://github.com/tmux-plugins/tpm#key-bindings).
* Try toggle the system's appearance mode from System Settings and see that the tmux theme is changing
  * To verify, you can `ls -l ~/.local/state/tmux/tmux-dark-notify-theme.conf` to see that it is linked to the light or dark theme you configured.



# Tips on more light/dark configuration
* NeoVim: set up [dark-notify](https://github.com/cormacrelf/dark-notify) to change our nvim theme as well!
* Use [iTerm](https://iterm2.com/downloads.html) >=3.5 (currently in beta) as it as support for automatically change the whole terminal theme when the system appearance mode changes. This is what I have in the demo GIF at the top of this file.
* Create a global keyboard shortcut to toggle mode in macOS
  * Open Automator.app
    * Create a new `Quick Action`.
    * Drag from the list to the left the  "Change System Appearace" to the areaon the rnage, and set "Change Appearance" to "Toggle Light/Dark".
    * Save it e.g. as `apperance_toggle`.
  * Open System Settings > Keyboard > Keyboard shortcuts (button) > Services
    * Find the `apperance_toggle` service we just created under the General category
    * Bind it to a shortcut e.g.  CTRL+OPT+CMD+t (this shortcut was used when feature was first introduced in the OS in beta).


# TODOs
* git tag
* Add plugin to https://github.com/tmux-plugins/list
* Mention to dark-notify
