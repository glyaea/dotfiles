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

unvault() {
	age -d .tar.age | tar -xf -
	read -q "x?rm? " || return
	rm .tar.age
}

vault() {
	tar --exclude-vcs -cf - . | age -p -o .tar.age
	read -q "x?rm? " || return
	setopt local_options extended_glob
	rm -rf -- ^.tar.age(N)
}
