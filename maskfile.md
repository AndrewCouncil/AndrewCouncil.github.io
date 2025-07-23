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

> Open the local site in chromium

```bash
hyprctl dispatch exec "chromium-browser http://localhost:1313/"
```

## update-date (file)

> Update the date in the header of the site

```bash
uv run scripts/front_matter.py update-date $file
```

## resume

> Use pandoc to make a PDF of the resume doc

```nu
let stripped_resume = uv run scripts/front_matter.py body content/resume.md -s 2

$stripped_resume | (
    pandoc
    -f markdown -t pdf
    -V geometry:margin=0.5in
    -o content/resume.pdf
)
```
