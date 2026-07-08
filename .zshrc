. "$HOME/.env"
eval "$(/opt/homebrew/bin/brew shellenv)"
git config --global alias.cem "commit --allow-empty-message --no-edit"
PROMPT="%~ %F{green}$%f "

alphabetize() {
	printf %s "$1" | grep -o . | sort | tr -d "\n"
	printf "\n"
}

command_not_found_handler() {
	[ "${1#.}" != "$1" ] || return 127
	gh repo clone "$(gh api user -q .login)/${1#.}"
}

decache() {
	brew cleanup --prune=all
	npm cache clean --force
	uv cache clean
}

meta() {
	if [ -d "$1" ]; then
		exiftool -r "$1"
		return
	fi
	exiftool "$1"
}

resource() {
	source ~/.zshrc
}

size() {
	du -sm "$1" | cut -f 1 | sed "s/$/ MB/"
}

targz() {
	tar -czf - "$1" | pv -s "$(du -sk "$1" | cut -f 1)k" > "$1.tar.gz"
}

untargz() {
	tar -xf "$1"
}

vault() {
	case "$1" in
		enter)
			age -d vault | tar -xf -
			read -q "x?rm? " || return
			print "\n"
			rm vault
			;;
		exit)
			tar --exclude-vcs -cf - . | age -p -o vault
			read -q "x?rm -rf? " || return
			print "\n"
			setopt local_options extended_glob
			rm -rf -- ^vault(DN)
			;;
	esac
}
