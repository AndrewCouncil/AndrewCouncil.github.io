+++
date = '2025-07-26T15:06:55-04:00'
draft = true
title = 'efficient terminal tools'
+++

In this post, I hope to give the best, most useful, and most practical terminal-based tools that I regularly use. These are the tools I wish someone had forced me to try years ago, so I hope to convince you to try them here.

> This post was originally written for a presentation I gave to coworkers. I plan to update it over time with any new discoveries I make.

---

As I progressed in my education and experience as a software engineer, I received a lot of guidance as to how to improve how my software was structured. However, I was never really instructed on how to improve at the process of _creating_ that software. I moved between Eclipse, JetBrains, and VS Code without ever really learning how to navigate a codebase quickly, script programs together, or work with `git` beyond the dreaded:

```bash
git add .
git commit -m "changes"
git push
```

<figcaption>still a classic, but there is so much more</figcaption>

Later, I saw online what certain engineers and [bash wizards](https://www.youtube.com/watch?v=L967hYylZuc) were capable of. Certain things feel intractable, like knowledge of every `awk` and `bash` intricacy. However, as I used the tools (as with everything), I got more comfortable and began to move quicker.

Additionally, there's been an influx of usability improvements. As the developer interest is growing with languages like Rust and Zig, the chance to start fresh and redesign has let to a new wave of excellent and easy to use tools.

---

## prerequisite: you need a good tty

> I will cry if you run these in Command Prompt.

Terminal applications can only do so much if the surrounding terminal interface is poor.

For Linux and Mac, I highly reccomend both [kitty](https://sw.kovidgoyal.net/kitty/) and [ghostty](https://ghostty.org/). Both have excellent performance and support all the fancy terminal features. Namely, they work with the [kitty terminal graphics protocol](https://sw.kovidgoyal.net/kitty/graphics-protocol/) that lets you display images in the terminal!

For Windows, the best I have tried is [alacritty](https://alacritty.org/index.html). Not _quite_ as feature-rich in my experience, but the only tty of this class that is windows-native (that I have found).

**Also important:** install a [nerdfont](https://www.nerdfonts.com/)! A lot of programs depend on this to display helpful icons and indicators.

---

## cli

### cht.sh

### ripgrep

### nushell

## tui

### dive

### lazygit

#### lazydocker

### vim
