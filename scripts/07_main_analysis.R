# Main analysis script: Run all parts of the analysis
# Load and prepare data
source("scripts/02_data_preparation.R")

# Generate descriptive statistics
source("scripts/03_descriptive_statistics.R")

# Fit regression models
source("scripts/04_regression_models.R")

# Perform simulations
source("scripts/05_simulation.R")

# Generate plots
source("scripts/06_plots.R")

