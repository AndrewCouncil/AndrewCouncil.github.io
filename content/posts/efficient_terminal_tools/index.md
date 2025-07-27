+++
date = '2025-07-26T15:06:55-04:00'
draft = true
title = 'efficient terminal tools'
+++

In this post, I hope to give the best, most useful, and most practical terminal-based tools that I regularly use. These are the tools I wish someone had forced me to try years ago, so I hope to convince you to try them here.

> This post was originally written for a presentation I gave to coworkers. I plan to update it over time with any new discoveries I make.

<!-- mdformat-toc start --slug=github --no-anchors --maxlevel=6 --minlevel=1 -->

- [prerequisite: you need a good tty](#prerequisite-you-need-a-good-tty)
- [cli](#cli)
  - [cht.sh](#chtsh)
  - [gh-copilot](#gh-copilot)
  - [ripgrep and fd](#ripgrep-and-fd)
  - [gh](#gh)
  - [imagemagick, ffmpeg](#imagemagick-ffmpeg)
  - [nushell](#nushell)
- [tui](#tui)
  - [dive](#dive)
  - [lazygit](#lazygit)
    - [lazydocker](#lazydocker)
  - [atuin](#atuin)
  - [vim](#vim)

<!-- mdformat-toc end -->

---

As I progressed in my education and experience as a software engineer, I received a lot of guidance as to how to improve how my software was structured. However, I was never really instructed on how to improve at the process of _creating_ that software. I moved between Eclipse, JetBrains, and VS Code without ever really learning how to navigate a codebase quickly, script programs together, or work with `git` beyond the dreaded:

```bash
git add . && git commit -m "changes" && git push
```

<figcaption>still a classic, but there is so much more</figcaption>

Later, I saw online what certain engineers and [bash wizards](https://www.youtube.com/watch?v=L967hYylZuc) were capable of. Certain things feel intractable, like knowledge of every `awk` and `bash` intricacy. However, as I used the tools (as with everything), I got more comfortable and began to move quicker.

Additionally, there's been an influx of usability improvements. As the developer interest is growing with languages like Rust and Zig, the chance to start fresh and redesign has let to a new wave of excellent and easy to use tools.

---

## prerequisite: you need a good tty

> I will cry if you run these in Command Prompt.

Terminal applications can only do so much if the surrounding terminal interface is poor.

**For Linux and Mac**, I highly reccomend both [kitty](https://sw.kovidgoyal.net/kitty/) and [ghostty](https://ghostty.org/). Both have excellent performance and support all the fancy terminal features. Namely, they work with the [kitty terminal graphics protocol](https://sw.kovidgoyal.net/kitty/graphics-protocol/) that lets you display images in the terminal!

**For Windows**, the best I have tried is [alacritty](https://alacritty.org/index.html). Not _quite_ as feature-rich in my experience, but the only tty of this class that is windows-native (that I have found).

**Also important:** install a [nerdfont](https://www.nerdfonts.com/)! A lot of programs depend on this to display helpful icons and indicators.

---

## cli

### cht.sh

When the maze of arguments and options are starting to slow you down, **[cht.sh](https://cht.sh/) is your best friend**. At any terminal with internet access, you can use it to search for command-line tools and their usage.

Lets say you are trying to do a simple tar operation.

[![hugo](images/tar.webp#large "Obligatory xkcd.")](https://xkcd.com/1168/)

First, you can use it directly from your browser _or through curl_: `curl cht.sh/tar`

Or, you can install their [command line client](https://github.com/chubin/cheat.sh#command-line-client-chtsh). I prefer this, as you don't need to use URL syntax to search. I'll run `cht.sh tar`:

{{< include-html "content/posts/efficient_terminal_tools/html/cht_sh.html" >}}

### gh-copilot

For the more complicated tasks, or for when you're not even sure which _command_ you need, I will often reach for the [`gh-copilot` extension for `gh`](https://github.com/github/gh-copilot).

{{< asciicast src="/casts/gh-copilot.demo" poster="npt:0:04" >}}

I have this aliased to `??` in my terminal so I can quickly search for commands. I find this to be a lot more ergonomic than switching to something like [Warp Terminal](https://www.warp.dev/) when I need to search how to use a single command. [^warp]

### ripgrep and fd

When I speak of older tools getting a modern redesign, these are probably the prime examples.

`fd` and `ripgrep` are fantastic alternatives to `find` and `grep`, and are multithreaded by default. [^multithread] They have become my default for scripting operations to find certain regex patterns and file names quickly.

{{< asciicast src="/casts/rg_fd.demo" poster="npt:0:04" >}}

### gh

This section is basically here to say: **stop trying to script GitHub with `curl`!**

`gh` provides a helpful wrapper over many GitHub APIs and `git` operations. This integration allows for commands like `gh repo clone bizmythy/nixconf`, which clones based on the GitHub repo name using your preference setting for SSH/HTTP. It also lets you make queries like `gh repo list --visibility=public`:

```
NAME                     DESCRIPTION              INFO              UPDATED
bizmythy/nixconf         Nix Configuration Files  public            about 1 hour ago
bizmythy/bizmythy.gi...                           public            about 2 hours ago
bizmythy/nixpkgs         Nix Packages collect...  public, fork      about 19 hours ago
bizmythy/masklint        Lint your mask targets   public, fork      about 2 days ago
bizmythy/typo            A simple Hugo theme      public, fork      about 3 days ago
bizmythy/typeracer-FPGA                           public, archived  about 4 days ago
bizmythy/hugo            The world’s fastest ...  public, fork      about 4 days ago
bizmythy/chroma          A general purpose sy...  public, fork      about 4 days ago
bizmythy/zed             configuration for ze...  public            about 5 days ago
bizmythy/nix-project...  Basic project templa...  public            about 5 days ago
bizmythy/placeparse      extracting google ma...  public            about 28 days ago
bizmythy/hugo-PaperModX  A fast, clean, respo...  public, fork      about 4 months ago
bizmythy/nixnvim         Neovim configuration...  public            about 5 months ago
bizmythy/resume          LaTeX code for my pe...  public            about 1 year ago
bizmythy/adventofcod...                           public            about 1 year ago
bizmythy/dotfiles        dotfiles for linux i...  public            about 2 years ago
bizmythy/aelevate-co...  ProjectIO Arduino co...  public            about 2 years ago
bizmythy/RADS-code                                public, fork      about 4 years ago
bizmythy/TowerTakeov...                           public            about 5 years ago
bizmythy/TurningPoint    All code and digitiz...  public, fork      about 6 years ago
```

These can be output as `json` and used in scripting quite easily.

### imagemagick, ffmpeg

### nushell

[Nushell](https://www.nushell.sh/) is perhaps my favorite CLI tool.

It is probably wrong to even call it a _tool_, as `nu` is a fully-fledged _shell_ which can be in lieu of `bash`/`zsh`/`fish`. [^posix]

Nushell provides new versions of `ls`, `du`,

{{< asciicast src="/casts/nushell.demo" poster="npt:0:04" >}}

## tui

### dive

### lazygit

#### lazydocker

### atuin

### vim

[^warp]: Warp Terminal is pretty cool, but it lacks a lot of the rendering features I have come to expect from my TTY and can have some compatibility issues with some TUI applications.

[^multithread]: A capable user of [GNU Parallel](https://www.gnu.org/software/parallel/) can make `grep` and `find` operations parallelized, which is useful in scripting. However, for most use cases, having these optimizations compiled in is very beneficial.

[^posix]:
    Similar to `fish`, `nu` is _extremely_ not POSIX compliant, so copy-pasting or running scripts with `nu` as the interpreter are bound to fail often.

    Never set a non-POSIX shell as your sytsem's default shell. I set `nu` as the default program that launches when I start my TTY.
