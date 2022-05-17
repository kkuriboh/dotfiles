source ~/.config/antigen.zsh

# antigen use oh-my-zsh
# antigen bundle heroku
# antigen bundle thefuck
antigen bundle colored-man-pages
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

export SSH_AUTH_SOCK
export _JAVA_AWT_WM_NONREPARENTING=1
export ANDROID_HOME=$HOME/Android/Sdk

alias sudo=doas
alias ls='exa'
alias l='exa -lah'
alias wget='curl -LO'
alias vi=nvim

X=$(pidof Xorg)
if not [ ${#X} -gt 0 ]; then
	startx
else
	echo "let's all love lain" | lolcat
	echo ""
	rsPanes -h 4
	echo ""
fi

# opam configuration
[[ ! -r /home/augusto/.opam/opam-init/init.zsh ]] || source /home/augusto/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
