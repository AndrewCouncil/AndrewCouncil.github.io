+++
date = '2025-07-22T09:44:48-04:00'
draft = true
title = 'Sequence Start'
+++

This is my first post. I am primarily testing out the look and feel of the blog and all the elements. 🥳

## Code

```python
import click
click.echo("test")
```

```nu
let lfs_file_data = (
  git lfs ls-files --size |
    detect columns -n |
    reject column1 |
    rename hash file size |
    update size {|row| $row.size | str substring 1..-2 | into filesize} |
    sort-by size
)

print $lfs_file_data

let total_size = ($lfs_file_data | get size | math sum)
print $"Total size: ($total_size)"
```

## Lists

1. First
1. Second
1. etc.

- heyo

- another one

- [x] Write the press release

- [ ] Update the website

- [ ] Contact the media

## Table

| Syntax | Description |
| ----------- | ----------- |
| Header | Title |
| Paragraph | Text |
