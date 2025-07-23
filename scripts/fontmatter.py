from pathlib import Path
import click
import frontmatter
from frontmatter.default_handlers import TOMLHandler
from datetime import datetime


def load_file(file: Path) -> frontmatter.Post:
    if not file.suffix == ".md":
        raise click.UsageError("File must be a markdown file")
    with file.open("r") as f:
        post = frontmatter.load(f, handler=TOMLHandler())
    return post


@click.group()
def fontmatter():
    """Commands to manipulate the TOML fontmatter of .md files."""


@fontmatter.command()
@click.argument(
    "file",
    type=click.Path(exists=True, dir_okay=False, path_type=Path),
)
def update_date(file: Path) -> None:
    post = load_file(file)

    post["date"] = datetime.now().strftime("%Y-%m-%dT%H:%M:%S%z")

    with file.open("w", encoding="utf-8") as f:
        frontmatter.dump(post, f, handler=TOMLHandler())


if __name__ == "__main__":
    fontmatter()
