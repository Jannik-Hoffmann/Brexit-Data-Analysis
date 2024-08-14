# Regression models script: Fit logistic regression models

source("scripts/01_setup.R")  # Load required packages and settings
load("data/prepared_data.RData")  # Load prepared data

# Fit logistic regression models
model1 <- glm(p_eurefvote ~ immig_att + al_scaleW14, data = data, family = binomial(link = logit))
model2 <- glm(p_eurefvote ~ immig_att + al_scaleW14 + immig_att*al_scaleW14, data = data, family = binomial(link = logit))
model3 <- glm(p_eurefvote ~ immig_att + al_scaleW14 + eth_wBrit + age + gross_household_grouped + immig_att*al_scaleW14, data = data, family = binomial(link = logit))
model4 <- glm(p_eurefvote ~ immigSelf + al_scaleW14 + eth_wBrit + age + gross_household_grouped + immigSelf*al_scaleW14, data = data, family = binomial(link = logit))

# Generate regression results table using stargazer
stargazer(model1, model2, model3, model4,
          dep.var.labels = c("Leave vote in EU-Referendum"),
          covariate.labels = c("Attitude towards Immigration", "Preferred level of Migration", 
                               "Authoritarianism Scale", "Ethnically White British", "Age", 
                               "Medium Household Income(25\\% to 75\\% quantile)", 
                               "High Household Income (>75\\% quantile)", 
                               "Attitude towards Immigration*Authoritarianism Scale", 
                               "Preferred level of Migration*Authoritarianism Scale"),
          type = stargazer_opt,
          title = "Logit Analyses of Determinants of Brexit Vote",
          float = TRUE,
          table.placement = "H",
          header = FALSE,
          out = "output/regression_results.html")  # Output to HTML file

# Save models for later use
save(model1, model2, model3, model4, file = "data/regression_models.RData")