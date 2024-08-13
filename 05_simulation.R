# Simulation script: Perform simulations for quantities of interest
source("01_setup.R")  # Load required packages and settings
load("prepared_data.RData")  # Load prepared data
load("regression_models.RData")  # Load fitted models

# Extract coefficients and variance-covariance matrix from model3
beta_hat_4 <- coef(model3)
V_hat_4 <- vcov(model3)

# Set number of simulations
nsim <- 1000

# Draw from multivariate normal distribution
S_4 <- mvrnorm(n = nsim, mu = beta_hat_4, Sigma = V_hat_4)

# Set up scenarios for simulation
auth_values <- seq(min(data$al_scaleW14, na.rm = TRUE), max(data$al_scaleW14, na.rm = TRUE), length.out = 100)
Pro_Immig <- quantile(data$immig_att, probs = 0.25, na.rm = TRUE)
Anti_immig <- quantile(data$immig_att, probs = 0.75, na.rm = TRUE)

# Create scenarios
scenario_low <- cbind(1, Pro_Immig, auth_values, mean(data$eth_wBrit, na.rm = TRUE), 
                      mean(data$age, na.rm = TRUE), 1, 0, Pro_Immig*auth_values)
scenario_high <- cbind(1, Anti_immig, auth_values, mean(data$eth_wBrit, na.rm = TRUE), 
                       mean(data$age, na.rm = TRUE), 1, 0, Anti_immig*auth_values)

# Calculate expected values
Xbeta_low <- S_4 %*% t(scenario_low)
Xbeta_high <- S_4 %*% t(scenario_high)

# Calculate predicted probabilities
pred_prob_low <- (exp(Xbeta_low)) / (1 + exp(Xbeta_low))
pred_prob_high <- (exp(Xbeta_high)) / (1 + exp(Xbeta_high))

# Calculate first differences
FD <- pred_prob_high - pred_prob_low

# Save simulation results
save(pred_prob_low, pred_prob_high, FD, auth_values, file = "simulation_results.RData")
