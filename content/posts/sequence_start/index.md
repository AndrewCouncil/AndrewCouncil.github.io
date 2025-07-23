+++
date = '2025-07-22T09:44:48-04:00'
draft = true
title = 'Sequence Start'
+++

{{< spotify type="track" id="2Kg42rmivHQggcXxvAoeyX" width="100%" height="200" >}}

My first post! I've been meaning to set up a site for a while, and I have finally had the time to do it.

My primary motivation is to have a better option that GitHub Gists to pass around guides and resources. However, I'm hoping this will also be a good place for me to share what I'm up to regarding my personal projects and discuss new technologies I come accross.

In keeping with this theme, I figured I'd document the process of getting this site operational.

# Creating This Website

## Hosting

When starting this project, I was already pretty sure I would be using [GitHub Pages](https://pages.github.com/) to handle hosting the static site. It's free, and I'm already familiar with the GitHub Actions tooling, for better or (often) worse.[^1]

It's free and everyone uses it, so the documentation for DNS setup, deployment, and integration with all the site generators is excellent. What's not to love? ☺️

## Hugo

To handle my static site generation, I chose [Hugo](https://github.com/gohugoio/hugo).

### Why not X?

> I'm scared of javascript.

In all seriousness, I chose Hugo because I am very comfortable with Go, which Hugo is written in. This means that I know how to patch in features I want if needed.

![Image alt](foreshadowing.webp)

\[^1\]: This is likely a blog post incoming, as GitHub actions can be very messy at times. See [fasterthanlime's excellent overview of the mess we are in](https://www.youtube.com/watch?v=9qljpi5jiMQ).
