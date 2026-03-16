# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal blog/portfolio for Hannes Coetsee at https://coetsee.github.io/. Built with Quarto, rendered locally to `docs/`, served by GitHub Pages.

## Commands

```bash
# Preview with live reload (http://localhost:4242)
quarto preview

# Render entire site to docs/
quarto render

# Render a single post
quarto render posts/YYYY-MM-DD-slug/index.qmd
```

## Architecture

- `_quarto.yml` — site config: output dir, navbar, format defaults
- `index.qmd` — home page; auto-generates post listing from `posts/`
- `about.qmd` — about page
- `styles.css` — all visual styling (overrides on top of `theme: cosmo`)
- `posts/` — one subfolder per post (e.g. `posts/2025-06-01-my-post/index.qmd`)
- `docs/` — rendered output, committed to git, served by GitHub Pages

## Writing a Post

1. Create `posts/YYYY-MM-DD-slug/index.qmd`
2. Add front matter:
   ```yaml
   ---
   title: "Post Title"
   date: YYYY-MM-DD
   description: "One-line summary shown on the home page listing."
   categories: [economics, R]
   execute:
     echo: false    # hide code by default; set true to show it
     warning: false
     message: false
   ---
   ```
3. Write in markdown; embed R code chunks with triple backtick + `{r}`
4. Interactive plots: wrap ggplot2 with `ggplotly()`, use `leaflet` maps — they embed automatically
5. Run `quarto preview` to check, then `quarto render`
6. Commit both `posts/your-post/` and `docs/`

## Adding Images to Pages

Put the image file next to the `.qmd` file, then reference it in markdown:

```markdown
![](image.jpg)
![Optional caption](image.jpg){width=400}
```

## Deployment

Push `main` to GitHub. Pages serves `docs/` statically — no build runs on GitHub. GitHub Pages is configured to serve from `/docs` on `main`.

## Dev Setup

Open `Coetsee.github.io.Rproj` in RStudio for the best editing experience. Use `quarto preview --port 8080` (port 4242 may not work on this machine).

## Integrating External Projects

Analysis projects live in sibling directories (e.g. `C:\Users\hanne\Projects\sonification\`).
The blog never imports directly from them. The pattern is:

1. **In the project directory**: produce artifacts in an `exports\` folder
   ```r
   saveRDS(plot, "exports/plot_main.rds")
   htmlwidgets::saveWidget(ggplotly(plot), "exports/widget.html", selfcontained = TRUE)
   ```
2. **Copy** artifacts into the post folder (`posts\YYYY-MM-DD-slug\`)
3. **In the post**: load pre-computed artifacts, write the narrative
   ```r
   p <- readRDS("plot_main.rds")
   ggplotly(p)
   ```

Each project directory should have its own `CLAUDE.md` with an **Exports** section.
Keep project sessions (analysis) and blog sessions (writing) separate.

## Status (as of March 2026)

- Site is live at https://coetsee.github.io
- Three posts published: welcome, Football/Camus (2020), Good Will Hunting/qualia (2021)
- Four incomplete WordPress drafts saved locally — finish and publish when ready
- About page written; no profile image yet
