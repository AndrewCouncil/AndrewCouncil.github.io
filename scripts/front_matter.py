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

def dump_file(post: frontmatter.Post, file: Path):
    if not file.suffix == ".md":
        raise click.UsageError("File must be a markdown file")
    with file.open("wb") as f:
        frontmatter.dump(post, f)
        f.write(b"\n")


@click.group()
def fontmatter():
    """Commands to manipulate the TOML fontmatter of .md files."""


@fontmatter.command()
@click.argument(
    "file",
    type=click.Path(exists=True, dir_okay=False, path_type=Path),
)
def update_date(file: Path) -> None:
    """Update the authorship date of a post."""
    post = load_file(file)

    post["date"] = datetime.now().strftime("%Y-%m-%dT%H:%M:%S%z")

    dump_file(post, file)


@fontmatter.command()
@click.argument(
    "file",
    type=click.Path(exists=True, dir_okay=False, path_type=Path),
)
@click.option(
    "-s",
    "--skip",
    help="Number of lines to skip from top of file",
    default=0,
    type=int,
)
def body(file: Path, skip: int) -> None:
    """Get the body contents of a file (without frontmatter)."""
    post = load_file(file)
    content = post.content.splitlines()[skip:]
    click.echo("\n".join(content))

if __name__ == "__main__":
    fontmatter()
