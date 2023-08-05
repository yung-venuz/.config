setopt nopromptbang prompt{cr,percent,sp,subst}

zstyle ':zim:duration-info' threshold 0.5
zstyle ':zim:duration-info' format '%.4d s'


# # Do menu-driven completion.
# zstyle ':completion:*' menu select
#
# # Color completion for some things.
# # http://linuxshellaccount.blogspot.com/2008/12/color-completion-using-zsh-modules-on.html
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#
# # formatting and messages
# # http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/
# zstyle ':completion:*' verbose yes
# zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
# zstyle ':completion:*:messages' format '%d'
# zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
# zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
# zstyle ':completion:*' group-name ''
#
# # Completers for my own scripts
# zstyle ':completion:*:*:sstrans*:*' file-patterns '*.(lst|clst)'
# zstyle ':completion:*:*:ssnorm*:*' file-patterns '*.tsv'
#
autoload -Uz add-zsh-hook
add-zsh-hook preexec duration-info-preexec
add-zsh-hook precmd duration-info-precmd

RPS1='${duration_info}%'
