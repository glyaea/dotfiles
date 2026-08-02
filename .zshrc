. "$HOME/.env"
eval "$(/opt/homebrew/bin/brew shellenv)"
git config --global alias.cem "commit --allow-empty-message --no-edit"

compress() {
	tar -czf - "$1" | pv -s "$(du -sk "$1" | cut -f 1)k" > "$1.tar.gz"
}

extract() {
	tar -xf "$1"
}

order() {
	printf %s "$1" | grep -o . | sort | tr -d "\n"
	printf "\n"
}

sizeof() {
	du -sm "$1" | cut -f 1 | sed "s/$/ MB/"
}

date
