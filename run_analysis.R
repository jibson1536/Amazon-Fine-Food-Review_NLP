#!/usr/bin/env Rscript
# ============================================================
# SETUP & KNIT SCRIPT — Amazon Reviews NLP Analysis
# Run this script ONCE before knitting the .Rmd, or just
# knit the .Rmd directly in RStudio.
# ============================================================

cat("=== Amazon Reviews NLP Analysis — Setup ===\n\n")

# 1. Check R version
cat("R version:", R.version$major, ".", R.version$minor, "\n")

# 2. Install all required packages
pkgs <- c(
  "tidyverse", "tidytext", "tm", "SnowballC", "wordcloud", "wordcloud2",
  "RColorBrewer", "ggplot2", "igraph", "ggraph", "widyr", "scales",
  "topicmodels", "LDAvis", "textdata", "sentimentr", "word2vec",
  "reshape2", "knitr", "kableExtra", "viridis", "ggwordcloud",
  "gridExtra", "cowplot", "plotly", "DT", "rmarkdown", "slam"
)

missing <- pkgs[!pkgs %in% installed.packages()[, "Package"]]
if (length(missing) > 0) {
  cat("Installing", length(missing), "missing packages...\n")
  install.packages(missing, repos = "https://cloud.r-project.org", dependencies = TRUE)
} else {
  cat("All packages already installed.\n")
}

# 3. Pre-download sentiment lexicons (requires internet on first run)
library(textdata)
cat("\nDownloading sentiment lexicons (first-time only)...\n")
lexicon_afinn()
lexicon_bing()
cat("Lexicons ready.\n")

# 4. Knit the report
cat("\nKnitting report...\n")
rmarkdown::render(
  "amazon_reviews_analysis.Rmd",
  output_file = "Amazon_Reviews_NLP_Report.html",
  envir       = new.env()
)
cat("\nDone! Open Amazon_Reviews_NLP_Report.html in your browser.\n")
