# Plots script: Generate visualizations
source("01_setup.R")  # Load required packages and settings
load("prepared_data.RData")  # Load prepared data
load("regression_models.RData")  # Load fitted models
load("simulation_results.RData")  # Load simulation results

# Predicted probabilities plot
ggplot() +
  geom_line(aes(x = auth_values, y = apply(pred_prob_low, 2, mean), color = "Pro-Immigration")) +
  geom_ribbon(aes(x = auth_values, 
                  ymin = apply(pred_prob_low, 2, quantile, probs = 0.025),
                  ymax = apply(pred_prob_low, 2, quantile, probs = 0.975),
                  fill = "Pro-Immigration"), alpha = 0.2) +
  geom_line(aes(x = auth_values, y = apply(pred_prob_high, 2, mean), color = "Anti-Immigration")) +
  geom_ribbon(aes(x = auth_values, 
                  ymin = apply(pred_prob_high, 2, quantile, probs = 0.025),
                  ymax = apply(pred_prob_high, 2, quantile, probs = 0.975),
                  fill = "Anti-Immigration"), alpha = 0.2) +
  scale_color_viridis(discrete = TRUE, begin = 0.3, end = 0.7) +
  scale_fill_viridis(discrete = TRUE, begin = 0.3, end = 0.7) +
  labs(title = "Predicted Probabilities for voting Leave",
       subtitle = "Interacting immigration attitude and authoritarianism",
       x = "Authoritarianism",
       y = "Predicted Probability of voting for Leave",
       color = "Immigration Attitude",
       fill = "Immigration Attitude") +
  theme_minimal()

# First differences plot
ggplot() +
  geom_line(aes(x = auth_values, y = apply(FD, 2, mean)), color = viridis(1)) +
  geom_ribbon(aes(x = auth_values, 
                  ymin = apply(FD, 2, quantile, probs = 0.025),
                  ymax = apply(FD, 2, quantile, probs = 0.975)),
              fill = viridis(1), alpha = 0.2) +
  labs(title = "First Differences in Predicted Probabilities",
       subtitle = "Effect of changing from Pro- to Anti-Immigration attitudes",
       x = "Authoritarianism",
       y = "First Difference in Predicted Probability") +
  theme_minimal()

# Separation plots
library(separationplot)

# Separation plot for Model 1
separationplot(
  pred = model1$fitted,
  actual = as.vector(model2$model$p_eurefvote),
  line = TRUE,
  heading = "Model 1",
  show.expected = TRUE,
  height = 1,
  col0 = viridis(2)[2],
  col1 = viridis(2)[1],
  lwd2 = 2,
  newplot = FALSE
)

# Separation plot for Model 3
separationplot(
  pred = model3$fitted,
  actual = as.vector(model3$model$p_eurefvote),
  line = TRUE,
  heading = "Model 3",
  show.expected = TRUE,
  height = 1,
  col0 = viridis(2)[2],
  col1 = viridis(2)[1],
  lwd2 = 2,
  newplot = FALSE
)

# Save plots
ggsave("predicted_probabilities.png", width = 10, height = 6)
ggsave("first_differences.png", width = 10, height = 6)
ggsave("separation_plots.png", width = 10, height = 6)
