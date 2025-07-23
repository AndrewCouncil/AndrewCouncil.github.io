import click
import frontmatter

from pathlib import Path
from frontmatter.default_handlers import TOMLHandler


def load_file(file: Path) -> frontmatter.Post:
    if not file.suffix == ".md":
        raise click.UsageError("File must be a markdown file")
    with file.open("r") as f:
        post = frontmatter.load(f, handler=TOMLHandler())
    return post

def dump_file(post: frontmatter.Post, file: Path):
    if not file.suffix == ".md":
        raise click.UsageError("File must be a markdown file")
    with file.open("wb") as f:
        frontmatter.dump(post, f)
        f.write(b"\n")
