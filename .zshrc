. "$HOME/.env"
PROMPT="%~ %F{green}$%f "
alias sizevid="ffprobe -v 0 -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0"
eval "$(/opt/homebrew/bin/brew shellenv)"
