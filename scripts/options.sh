unset MAILCHECK                           # disable "you have mail" warning
bind "set completion-ignore-case on"      # ignore case on bash completion
bind "set mark-symlinked-directories on"  # add trailing slash to symlinked directories
stty stop ^.                              # rebind freezing terminal to C-. and now C-s should work as i-search
shopt -s histappend                       # append history instead of overwriting it
shopt -s cmdhist                          # force commands that entered on more than one line to be adjusted to fit on only one
