+++
date = '2025-07-22T09:44:48-04:00'
draft = false
title = 'sequence start'
+++

{{< spotify type="track" id="2Kg42rmivHQggcXxvAoeyX" width="100%" height="200" >}}

**My first post!** I've been meaning to set up a little personal blog for a while, and I have finally had the time to do it.

My primary motivation is to have a better option that GitHub Gists to pass around guides and resources. However, I'm hoping this will also be a good place for me to share what I'm up to regarding my personal projects and discuss new technologies I come accross.

In keeping with this theme, I figured I'd document the process of getting this site operational.

---

# creating this website

## hosting

When starting this project, I was already pretty sure I would be using [GitHub Pages](https://pages.github.com/) to handle hosting the static site. It's free, and I'm already familiar with the GitHub Actions tooling, for better or (often) worse.[^gha]

It's free and everyone uses it, so the documentation for DNS setup, deployment, and integration with all the site generators is excellent. What's not to love? ☺️

## hugo

To handle my static site generation, I chose [Hugo](https://github.com/gohugoio/hugo).

![hugo](images/hugo-logo-wide.svg#small)

### why not xyz other framework?

> I'm scared of javascript.

In all seriousness, I chose Hugo because I am very comfortable with Go, which Hugo is written in. This means that I know how to patch in features I want if needed.

![foreshadowing](images/foreshadowing.webp#medium)

Additionally, it is [available in nixpkgs](https://search.nixos.org/packages?channel=unstable&show=hugo), which means someone else has done the work of making it build nicely in the nix ecosystem for me.

Ultimately, I'm pretty happy with this choice. The website builds super quickly (the `hugo server` command works exellently), and even if I need to recompile Hugo from source, it only takes a couple of minutes at most on my old laptop.

### theme

I ended up settling on [typo](https://tomfran.github.io/typo-wiki/features/homepage/), which I find to be pretty stylish. I really like the structure of the default layout.

The only change I made from the default behavior is changing the monospace/code font to [`JetBrains Mono`](https://www.jetbrains.com/lp/mono/). It was my favorite part of JetBrains when I used it in school, and I use it practially everywhere. I also added a slightly tweaked version of the included [catppuccin theme](https://catppuccin.com/)

---

Great! I have my website set up and deploying nicely using the [Hugo docs for working with GitHub Pages](https://gohugo.io/host-and-deploy/host-on-github-pages/). It should be smooth sailing from here...

# one tiny issue

Syntax highlighting isn't working for [`nu`](https://www.nushell.sh/)...

```
ls ~/Documents
```

<figcaption>dang it.</figcaption>

Well, let me see if I can figure out why that is.

![rabbithole](images/looney-tunes-swim-in-rabbit-hole.gif#small)

## down the rabbit hole

Turns out, Hugo uses [chroma](https://github.com/alecthomas/chroma) to do syntax highlighting. Any language with syntax highlighting support is automatically supported in Hugo, but chroma does not have any Nu/Nushell support to speak of.

That's ok, chroma is effectively a port of the patterns from the Python package [pygments](https://pygments.org/) and includes some helpful scripting to convert a pygment lexer to a chroma lexer. Pygments has no official nushell lexer, but there is the [pygments-nushell](https://pypi.org/project/pygments-nushell) package for just that purpose.

So, I apply the script to the package and get a chroma `nu.xml` file defining the lexer patterns. Then, I manually patch it a bit to fix issues with syntax highlighting for `$var` patterns and [upstream the final product](https://github.com/alecthomas/chroma/pull/1110).

## getting the fix into hugo

To add this syntax highlighting to Hugo, I needed to [fork Hugo]()

[^gha]: This is likely a blog post incoming, as GitHub actions can be very messy at times. See [fasterthanlime's excellent overview of the mess we are in](https://www.youtube.com/watch?v=9qljpi5jiMQ).
