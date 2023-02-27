# install
linux install notes

- https://github.com/CristianHenzel/ClipIt

- xfce terminal

## TODO

- [ ] list all `xfce` packages to install
- [ ] list all applications to install (e.g. `clipit`)
- [ ] list all `xfce` settings to set up

- xfce date widget format: `%A | %Y-%m-%d | ` 
- xfce clock widget format: `<span foreground="#468C0A" size="x-large"><b>%H:%M</b></span> : <span foreground="#33C2FF"><b>%S</b></span>` 


# .bashrc

```shell
# ----------------
# -- PANOS EDIT --
# ----------------

# reset COMMAND_PROMPT
#PROMPT_COMMAND=""

#export GREP_OPTIONS='--color=auto'

# TODO move  .bash_aliases to somewhere else
if [ -f /home/panos/.bash_aliases ]; then
  . /home/panos/.bash_aliases
fi

if [ -f /home/panos/bin/.bashrc_history.sh ]; then
  source /home/panos/bin/.bashrc_history.sh
fi


# Autocomplete with up-arrow
# Autocomplete with up-arrow
bind '"\e[5~":history-search-backward'
bind '"\e[6~":history-search-forward'
#see: http://aplawrence.com/Linux/bash_history.html
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=erasedups
# … and don't clobber the history when closing multiple shells
shopt -s histappend
# … and keep multi line commands together
shopt -s cmdhist

#Real-time history export amongst bash terminal windows (stackoverflow)
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
#source /home/panas/custom_prompt.sh
#source /home/panos/bin/custom_prompt_simple.sh
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PATH=$PATH:$HOME/.local/bin
```

# .bashrc.pre-oh-my-bash

```shell
# ----------------
# -- PANOS EDIT --
# ----------------

# reset COMMAND_PROMPT
PROMPT_COMMAND=""

#export GREP_OPTIONS='--color=auto'

# TODO move  .bash_aliases to somewhere else
if [ -f /home/panos/.bash_aliases ]; then
  . /home/panos/.bash_aliases
fi

if [ -f /home/panos/bin/.bashrc_history.sh ]; then
  source /home/panos/bin/.bashrc_history.sh
fi


# Autocomplete with up-arrow
# Autocomplete with up-arrow
bind '"\e[5~":history-search-backward'
bind '"\e[6~":history-search-forward'
#see: http://aplawrence.com/Linux/bash_history.html
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=erasedups
# … and don't clobber the history when closing multiple shells
shopt -s histappend
# … and keep multi line commands together
shopt -s cmdhist

#Real-time history export amongst bash terminal windows (stackoverflow)
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
#source /home/panas/custom_prompt.sh
source /home/panos/bin/custom_prompt_simple.sh
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

```