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

```python
import os
from datetime import datetime
from pathlib import Path
from scripts.front_matter import load_file, dump_file

file = Path(os.getenv("file", "."))

post = load_file(file)
post["date"] = datetime.now().strftime("%Y-%m-%dT%H:%M:%S%z")
dump_file(post, file)
```

## resume

> Use pandoc to make a PDF of the resume doc

```python
import os
import pypandoc
from pathlib import Path
from scripts.front_matter import load_file

file = Path("content/resume/index.md")
post = load_file(file)
content = "\n".join(post.content.splitlines()[2:])

pypandoc.convert_text(
    source=content,
    format="md",
    to="pdf",
    outputfile=file.parent / "resume.pdf",
    extra_args=["-V", "geometry:margin=0.5in"],
)
```
