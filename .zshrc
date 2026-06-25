. "$HOME/.env.sh"

PROMPT="%~ %F{green}$%f "

eval "$(/opt/homebrew/bin/brew shellenv)"

preexec() {
	print
}

precmd() {
	print
}
