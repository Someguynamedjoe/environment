
# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

function mem {
# Mac OS Version
#	 top -l 1 -s 0 | grep PhysMem | awk '{print $6}'
	free -h | grep Mem | awk '{print $3}'
}


function root {
	df -h / | awk 'FNR ==2 {print $4}'
}

export PS1="----|H: \!|--|C: \#|--|Date: \d|--| Time: \t|--${debian_chroot:+($debian_chroot)}|--|Mem: `mem`|--|root: `root`|--|\u@\h:\w|----\n\`if [ \$? = 0 ]; then echo \[\e[32m\]^_^\[\e[0m\]; else echo \[\e[31m\]\[\e[5m\]O_O \[\e[0m\]; fi\`\`if [ `id -u` -eq 0 ]; then echo \[\e[31m\]\[\e[5m\]PROCEED WITH CAUTION\[\e[0m\]; fi\` \\$ "


#export PS1="\! \# \d \t ${debian_chroot:+($debian_chroot)}\u@\h:\w\n\`if [ \$? = 0 ]; then echo \[\e[32m\]^_^\[\e[0m\]; else echo \[\e[31m\]\[\e[5m\]O_O \[\e[0m\]; fi\`\`if [ `id -u` -eq 0 ]; then echo \[\e[31m\]\[\e[5m\]PROCEED WITH CAUTION\[\e[0m\]; fi\` \\$ " 

export HISTFILESIZE=10000
export HISTSIZE=100000
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_long_history
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
export GREP_OPTIONS='--color=auto'


alias ms='ping -c 1 google.com | grep "bytes from" | cut -d = -f 4'
