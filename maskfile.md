## server

> Start hugo server locally with drafts

```bash
hugo server --buildDrafts --buildFuture
```

## start

> Start zellij session with server running

```bash
set -x

session="personal-site"
zellij kill-session $session || true
zellij delete-session $session || true
zellij --layout layout_file.kdl attach --create $session
```

## open

> Open the local site in a chromium PWA-style window.

```bash
hyprctl dispatch exec "chromium-browser http://localhost:1313/"
```
