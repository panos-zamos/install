#!/bin/bash
# Filename:      custom_prompt.sh
# Maintainer:    Dave Vehrs 
# Last Modified: 12 Jul 2005 13:29:40 by Dave Vehrs

# Current Format: USER@HOST [dynamic section] { CURRENT DIRECTORY }$ 
# USER:      (also sets the base color for the prompt)
#   Red       == Root(UID 0) Login shell (i.e. sudo bash)
#   Light Red == Root(UID 0) Login shell (i.e. su -l or direct login)
#   Yellow    == Root(UID 0) priviledges in non-login shell (i.e. su)
#   Brown     == SU to user other than root(UID 0)
#   Green     == Normal user

# @:
#   Light Red == http_proxy environmental variable undefined.
#   Green     == http_proxy environmental variable configured.
# HOST:
#   Red       == Insecure remote connection (unknown type)
#   Yellow    == Insecure remote connection (Telnet)
#   Brown     == Insecure remote connection (RSH)
#   Cyan      == Secure remote connection (i.e. SSH)
#   Green     == Local session

# DYNAMIC SECTION:  
#     (If count is zero for any of the following, it will not appear)
#   [scr:#] ==== Number of detached screen sessions
#     Yellow    == 1-2
#     Red       == 3+
#   [bg:#]  ==== Number of backgrounded but still running jobs
#     Yellow    == 1-10
#     Red       == 11+
#   [stp:#] ==== Number of stopped (backgrounded) jobs
#     Yellow    == 1-2
#     Red       == 3+

# CURRENT DIRECTORY:     (truncated to 1/4 screen width)
#   Red       == Current user does not have write priviledges
#   Green     == Current user does have write priviledges

# NOTE:
#   1.  Displays message on day change at midnight on the line above the
#       prompt (Day changed to...). 
#   2.  Command is added to the history file each time you hit enter so its
#       available to all shells.

# Configure Colors:
COLOR_WHITE='\033[1;37m'
COLOR_LIGHTGRAY='033[0;37m'
COLOR_GRAY='\033[1;30m'
COLOR_BLACK='\033[0;30m'
COLOR_RED='\033[0;31m'
COLOR_LIGHTRED='\033[1;31m'
COLOR_GREEN='\033[0;32m'
COLOR_LIGHTGREEN='\033[1;32m'
COLOR_BROWN='\033[0;33m'
COLOR_YELLOW='\033[1;33m'
COLOR_BLUE='\033[0;34m'
COLOR_LIGHTBLUE='\033[1;34m'
COLOR_PURPLE='\033[0;35m'
COLOR_PINK='\033[1;35m'
COLOR_CYAN='\033[0;36m'
COLOR_LIGHTCYAN='\033[1;36m'
COLOR_DEFAULT='\033[0m'

SSH_FLAG=0
PS1="${debian_chroot:+($debian_chroot)}"
if [ ${UID} -eq 0 ] ; then
	if [ "${USER}" == "${LOGNAME}" ]; then
		if [[ ${SUDO_USER} ]]; then
			PS1="${PS1}\[${COLOR_RED}\]\u"
		else
			PS1="${PS1}\[${COLOR_LIGHTRED}\]\u"
		fi
	else                               
		PS1="${PS1}\[${COLOR_YELLOW}\]\u"
	fi
else
	if [ ${USER} == ${LOGNAME} ] ; then     
		PS1="${PS1}\[${COLOR_BLUE}\]\u"
	else                               
		PS1="${PS1}\[${COLOR_BROWN}\]\u"
	fi
fi

PS1="${PS1}\[${COLOR_LIGHTRED}\]@"

# Host

if [[ ${SSH_CLIENT} ]] || [[ ${SSH2_CLIENT} ]]; then 
	SSH_FLAG=1
fi
if [ ${SSH_FLAG} -eq 1 ] ; then 
  PS1="${PS1}\[${COLOR_CYAN}\]\h "
elif [[ "${SESS_SRC}" == "" ]]; then
	PS1="${PS1}\[${COLOR_GREEN}\]\h "
else                                 
	PS1="${PS1}\[${COLOR_RED}\]\h " 
fi

PS1="${PS1}\[${COLOR_YELLOW}\]{"
# Working directory
if [ ${UID} -eq 0 ] ; then 
	PS1="${PS1}\[${COLOR_RED}\] \w "
else                                 
	PS1="${PS1}\[${COLOR_GREEN}\] \w "
fi

PS1="${PS1}\[${COLOR_YELLOW}\]}"

if [ ${UID} -eq 0 ] ; then 
	PS1="${PS1}\[${COLOR_RED}\]#"
else                                 
	PS1="${PS1}\[${COLOR_GREEN}\]\$"
fi

PS1="${PS1}\[${COLOR_DEFAULT}\] "
export PS1
