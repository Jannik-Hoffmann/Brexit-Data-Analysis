# Setup script: Install and load required packages

# List of required packages
p_needed <- c("viridis", "stargazer", "MASS", "optimx", "haven", "separationplot", "dplyr", "ggeffects","ggplot2")

# Check which packages are already installed
packages <- rownames(installed.packages())
p_to_install <- p_needed[!(p_needed %in% packages)]

# Install missing packages
if (length(p_to_install) > 0) {
  install.packages(p_to_install)
}

# Load all required packages
sapply(p_needed, require, character.only = TRUE)

# Set stargazer options for output formatting
# This will output in LaTeX format for PDF documents and HTML for other formats
stargazer_opt <- ifelse(knitr::is_latex_output(), "latex", "html")
