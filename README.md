# dotfiles

## Brave

```sh
sudo mkdir -p "/Library/Managed Preferences"
sudo tee "/Library/Managed Preferences/com.brave.Browser.plist" >/dev/null <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>BraveNewsDisabled</key><true/>
	<key>BraveRewardsDisabled</key><true/>
	<key>BraveTalkDisabled</key><true/>
	<key>BraveVPNDisabled</key><true/>
	<key>BraveWalletDisabled</key><true/>
	<key>TorDisabled</key><true/>
</dict>
</plist>
EOF
sudo chown root:wheel "/Library/Managed Preferences/com.brave.Browser.plist"
sudo chmod 644 "/Library/Managed Preferences/com.brave.Browser.plist"
```

## Git

```sh
git config --global alias.cem "commit --allow-empty-message --no-edit"
git config --global url."https://github.com/".insteadOf "gh:"
```

## LibreWolf

```sh
sudo xattr -rd com.apple.quarantine /Applications/LibreWolf.app
open -e "$HOME/Library/Application Support/librewolf/Profiles/default/chrome/userChrome.css"
```
