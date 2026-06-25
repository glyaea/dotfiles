# Git

```sh
git config --global alias.cem "commit --allow-empty-message --no-edit"
```

# LibreWolf

To install, run:
```sh
brew install --cask librewolf
sudo xattr -rd com.apple.quarantine /Applications/LibreWolf.app
```

To list profiles, run:
```sh
cat "$HOME/Library/Application Support/LibreWolf/profiles.ini"
```

To style profile `default`, run:
```sh
open "$HOME/Library/Application Support/librewolf/Profiles/default/chrome/userChrome.css"
```
