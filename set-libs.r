#!/usr/bin/env Rscript

# install2.r (littler) is a simple function for installing packages, but
# it cannot install specific versions which is not great for reproducibility.
# We write our own function below.
# https://rocker-project.org/use/extending.html#install2.r
# https://github.com/eddelbuettel/littler/issues/15

set_libs_install_version <- function(set_name, set_libs) {
  print(paste("Installing packages for", set_name))
  for (i in seq(1, length(set_libs), 2)) {
    installed_packages <- rownames(installed.packages())
    package_name = set_libs[i]
    version = set_libs[i+1]
    # Only install packages if they haven't already been installed!
    # devtools doesn't do that by default
    if (!package_name %in% installed_packages) {
      print(paste("Installing", package_name, version))
      devtools::install_version(package_name, version, quiet=TRUE)
    } else {
      # FIXME: This ignores version incompatibilities :'(
      print(paste("Not installing", package_name, " as it is already installed"))
    }
  }
  print(paste("Done installing packages for", set_name))
}
