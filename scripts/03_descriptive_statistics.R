# Descriptive statistics script: Generate summary statistics

source("scripts/01_setup.R")  # Load required packages and settings
load("data/prepared_data.RData")  # Load prepared data

# Generate descriptive statistics table using stargazer
stargazer(data, 
          covariate.labels = c("Leave Vote in EU Ref", "Attitude towards Immigration", 
                               "Preferred level of Migration", "Authoritarianism Scale", 
                               "Ethnically White British", "Age", "Gross Household Income"),
          summary.stat = c("n", "mean", "sd", "min", "p25", "median", "p75", "max"),
          type = stargazer_opt,
          title = "Descriptive Statistics",
          float = TRUE,
          table.placement = "H",
          header = FALSE,
          out = "output/descriptive_stats.html")  # Output to HTML file