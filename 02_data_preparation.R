# Data preparation script: Load and preprocess the data

source("01_setup.R")  # Load required packages and settings

# Load the raw data
data <- read.csv("raw-data/bes15.csv")

# Recode immigSelf variable to reverse its scale
data$immigSelf <- recode(data$immigSelf, `0`=10L, `1`=9L, `2`=8L, `3`=7L, `4`=6L, `5`=5L, `6`=4L, `7`=3L, `8`=2L, `9`=1L, `10`=0L)

# Prepare dataset for later substantive interpretation
# Calculate mean immigration attitude for Farage supporters
faragesupporters <- subset(data, likeFarage >= 8) 
mean(faragesupporters$immig_att, na.rm = TRUE)

# Calculate mean immigration attitude for Corbyn supporters
corbynsupporters <- subset(data, likeCorbyn >= 8)
mean(corbynsupporters$immig_att, na.rm = TRUE)

# Select relevant variables for analysis
data <- subset(data, select = c(p_eurefvote, immig_att, immigSelf, al_scaleW14, eth_wBrit, age, p_gross_household))

# Create grouped household income variable
data$gross_household_grouped <- cut(data$p_gross_household,
                                    breaks=c(1, 4, 8, 15),  # Define break points
                                    labels=c('Low', "Mid", "High"))  # Define labels for groups
print(colnames(data))
# Save prepared data
save(data, file = "prepared_data.RData")