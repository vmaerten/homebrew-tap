# vmaerten/tap

Homebrew casks for [Diffdesk](https://diffdesk.vmaerten.fr), a local Git review app for macOS on Apple Silicon.

```bash
brew install --cask vmaerten/tap/diffdesk
```

Name the cask in full: Homebrew only loads casks from a third-party tap once trusted, and installing by full name trusts this one. The cask is updated by each Diffdesk release.

## Moving from the ghl cask

Diffdesk was called ghl until 0.4. Homebrew trusts a cask by name, so trust the new one before upgrading, or `brew upgrade` skips it:

```bash
brew update
brew trust --cask vmaerten/tap/diffdesk
brew upgrade --cask diffdesk
rm -rf "$(brew --caskroom)/ghl"
```

The upgrade replaces `ghl.app` with `Diffdesk.app` and links `ghl` beside `diffdesk`. It leaves an empty `ghl` entry that `brew list` shows and `brew doctor` reports; the last line removes it.
