# new_post.R
# Creates a new post scaffold. Run from the project root.
# Usage: source("new_post.R") then call new_post("my-post-slug", "My Post Title")

new_post <- function(slug, title, categories = c("")) {
  date   <- format(Sys.Date(), "%Y-%m-%d")
  folder <- file.path("posts", paste0(date, "-", slug))
  fpath  <- file.path(folder, "index.qmd")

  if (dir.exists(folder)) stop("Post already exists: ", folder)
  dir.create(folder, recursive = TRUE)

  cats <- paste0("[", paste(categories, collapse = ", "), "]")

  writeLines(c(
    "---",
    paste0('title: "', title, '"'),
    paste0("date: ", date),
    paste0('description: "One sentence shown on the home listing."'),
    paste0("categories: ", cats),
    "execute:",
    "  echo: false",
    "  warning: false",
    "  message: false",
    "---",
    "",
    "## Introduction",
    ""
  ), fpath)

  message("Created: ", fpath)

  if (interactive() && requireNamespace("rstudioapi", quietly = TRUE)) {
    rstudioapi::navigateToFile(fpath)
  }
}
