# Build slides.qmd (the deck the website and schedule link to) from slides2026.qmd.
#
# The compact deck is the teaching deck with the worked answers stripped out:
#   * every "## Answers N: ..." slide is dropped, and
#   * fragment blocks inside a "## Question(s) ..." slide are dropped.
# Everything else, including the questions themselves, is left untouched.
#
# slides.qmd is generated: edit slides2026.qmd, never slides.qmd directly.
#
# Re-run this from inside this folder after editing slides2026.qmd:
#   Rscript make-compact.R

src <- "slides2026.qmd"
out <- "slides.qmd"

x <- readLines(src)

# --- slide boundaries -------------------------------------------------------
# Skip the YAML header so its "---" fences are not mistaken for slide breaks.
yaml_end <- which(x == "---")[2]
is_break <- rep(FALSE, length(x))
body     <- (yaml_end + 1):length(x)
is_break[body] <- grepl("^#{1,2} ", x[body]) | x[body] == "---"

starts <- which(is_break)
ends   <- c(starts[-1] - 1, length(x))

keep <- rep(TRUE, length(x))
for (i in seq_along(starts)) {

  head_line <- x[starts[i]]
  block     <- starts[i]:ends[i]

  # 1. drop whole "Answers" slides
  if (grepl("^## Answers", head_line)) {
    keep[block] <- FALSE
    next
  }

  # 2. inside a question slide, drop the ::: fragment blocks (the answers)
  if (grepl("^## Questions? ", head_line)) {
    depth <- 0L
    open  <- integer(0)   # start line of the fragment opened at each depth
    for (j in block) {
      if (grepl("^::: *\\{", x[j])) {
        depth <- depth + 1L
        open[depth] <- if (grepl("fragment", x[j])) j else NA_integer_
      } else if (grepl("^:::\\s*$", x[j])) {
        if (depth >= 1L && !is.na(open[depth])) keep[open[depth]:j] <- FALSE
        if (depth >= 1L) open[depth] <- NA_integer_
        depth <- depth - 1L
      }
    }
  }
}

y <- x[keep]

# --- squeeze runs of blank lines left behind by the deletions ---------------
blank <- y == ""
y <- y[!(blank & c(FALSE, head(blank, -1)))]

writeLines(y, out)

message(sprintf("%s: %d lines -> %s: %d lines (%d slides removed)",
                src, length(x), out, length(y),
                sum(grepl("^## Answers", x))))
