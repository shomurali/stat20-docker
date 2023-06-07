#!/usr/bin/env Rscript

source("/tmp/set-libs.r")

set_name <- "Stat 20"

set_libs <- c(
  "rmarkdown", "2.20",
  "plotly", "4.10.1",
  "patchwork", "1.1.2",
  "reshape2", "1.4.4"
)

set_libs_install_version(set_name, set_libs)

remotes::install_github("stat20/stat20data")

print(paste("Done installing packages for", set_name))
