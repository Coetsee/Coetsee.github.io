# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal blog/portfolio site for Hannes Coetsee, hosted on GitHub Pages at https://coetsee.github.io/. Built with Jekyll 4.4.1 using the Minima theme.

## Common Commands

```bash
# Install Ruby dependencies
bundle install

# Local development server (live reload at http://localhost:4000)
bundle exec jekyll serve

# Build static site to _site/
bundle exec jekyll build

# Clear build cache and output
bundle exec jekyll clean
```

## Architecture

- **Content**: Markdown files in `_posts/` (named `YYYY-MM-DD-title.markdown`) and root-level pages (`about.markdown`, `index.markdown`)
- **Configuration**: `_config.yml` controls site metadata, theme, and plugins
- **Output**: Jekyll builds everything into `_site/` — this is what GitHub Pages serves
- **Theme**: Minima (~2.5) provides all layouts and styles; customizing appearance means overriding theme files locally
- **Feed**: `jekyll-feed` auto-generates `/feed.xml` (RSS/Atom)

## Content Authoring

Blog posts require Jekyll front matter:

```yaml
---
layout: post
title: "Post Title"
date: YYYY-MM-DD HH:MM:SS +0200
categories: category1 category2
---
```

Pages listed in `_config.yml` under `header_pages` appear in the site navigation.

## Deployment

Pushing to the `main` branch on GitHub automatically triggers GitHub Pages to rebuild and deploy the site. The `_site/` directory is excluded from version control (`.gitignore`) — GitHub Pages runs its own Jekyll build.
