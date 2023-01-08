source ~/.config/antigen.zsh

antigen use oh-my-zsh
# antigen bundle heroku
# antigen bundle thefuck
antigen bundle colored-man-pages
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# export SSH_AUTH_SOCK
export _JAVA_AWT_WM_NONREPARENTING=1
# export ANDROID_HOME=$HOME/Android/Sdk

# alias sudo=doas
alias ls='exa'
alias l='exa -lah'
alias wget='curl -LO'

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.builds/flutter/bin:$PATH"

X=$(pidof Xorg)
if [ ${#X} -gt 0 ]; then
	# panes
	echo "let's all love lain" | lolcat
else
	startx
fi
