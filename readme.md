
# Brexit Vote Analysis: Immigration Attitudes and Authoritarianism


[Brexit Vote Analysis Report](https://htmlpreview.github.io/?[https://github.com/Jannik-Hoffmann/Brexit-Data-Analysis/blob/main/Finished%20Report.qmd]
## Overview

This project analyzes the determinants of the Brexit vote, focusing on the relationship between attitudes towards immigration, levels of authoritarianism, and the likelihood of voting to leave the European Union. Using data from the 15th wave of the British Election Study, this analysis employs advanced statistical techniques to explore how these factors influenced voting behavior in the 2016 EU referendum.

## Key Features

- Logistic regression models with interaction terms
- Simulation-based interpretation of results
- Visualization of predicted probabilities and first differences
- Separation plots for model evaluation

## Data

The analysis uses a subsample of 3000 respondents from the 15th wave of the British Election Study. Key variables include:
- Brexit vote (Leave/Remain)
- Attitudes towards immigration
- Levels of authoritarianism
- Demographic factors (age, ethnicity, household income)

## Project Structure

```
brexit-analysis/
│
├── raw-data/
│   └── bes15.csv
│
├── output/
│
├── data/
├── scripts/
│   ├── 01_setup.R
│   ├── 02_data_preparation.R
│   ├── 03_descriptive_statistics.R
│   ├── 04_regression_models.R
│   ├── 05_simulation.R
│   ├── 06_plots.R
│   └── 07_main_analysis.R
│
├── README.md
├── .gitignore
├── requirements.txt
└── LICENSE
```

## How to Run the Analysis

1. Ensure you have R installed (version 4.0.0 or higher).
2. Clone this repository to your local machine.
3. Install the required R packages listed in `requirements.txt`.
4. Place the `bes15.csv` file in the `raw-data/` directory.
5. Open R or RStudio and set the working directory to the project folder.
6. Run the scripts in order:
   ```R
   source("scripts/01_setup.R")
   source("scripts/02_data_preparation.R")
   source("scripts/03_descriptive_statistics.R")
   source("scripts/04_regression_models.R")
   source("scripts/05_simulation.R")
   source("scripts/06_plots.R")
   ```
   Or run the main analysis script:
   ```R
   source("scripts/07_main_analysis.R")
   ```
7. Check the `output/` directory for generated plots and tables.

## Key Findings

- Both anti-immigration attitudes and authoritarianism predict higher likelihood of voting for Brexit
- The effect of immigration attitudes on Brexit vote is moderated by levels of authoritarianism
- The interaction effect becomes more pronounced at higher levels of authoritarianism

## Insights and Implications

Our analysis reveals key insights into the Brexit vote:

1. **Immigration Attitudes Matter**: Anti-immigration sentiments strongly predicted Brexit support, confirming the importance of this issue in the referendum.

2. **Authoritarianism's Role**: Higher levels of authoritarianism also increased likelihood of Brexit support, suggesting the vote tapped into deeper psychological predispositions.

3. **Complex Interaction**: The effect of immigration attitudes on Brexit support was strongest among those low in authoritarianism. For high authoritarians, Brexit support was high regardless of immigration views.

4. **Beyond Simple Narratives**: Our findings challenge one-dimensional explanations of Brexit, revealing a complex interplay between policy attitudes and psychological factors.

5. **Future Political Implications**: This interaction between policy views and underlying psychological traits may help explain other populist movements globally.

These insights demonstrate the value of integrating psychological concepts into political analysis, offering a more nuanced understanding of voter behavior in high-stakes political decisions.
## Methods

1. Multiple logistic regression models
2. Interaction effects between immigration attitudes and authoritarianism
3. Simulation-based estimation of quantities of interest
4. Visualization of predicted probabilities and first differences
5. Model evaluation using separation plots

## R Techniques Utilized

This project showcases several the techniques and workflow I developed during my program.

1. **Data Manipulation**:  Use of `dplyr` for efficient data wrangling and preprocessing.
2. **Complex Modeling**: Implementation of logistic regression models with interaction terms using `glm()`.
3. **Simulation-Based Inference**: Utilization of the `MASS::mvrnorm()` function for drawing from multivariate normal distributions to simulate model parameters.
4. **Uncertainty Quantification**: Calculation and visualization of confidence intervals for predicted probabilities and first differences.
5. **Advanced Plotting**: Creation of appropriate visualizations using `ggplot2`, including predicted probability plots and first difference plots.
6. **Model Diagnostics**: Implementation of separation plots using the `separationplot` package for evaluating the fit of binary response models.
7. **Reproducible Research**: Use of R scripts and RMarkdown for creating a reproducible research workflow.
8. **Efficient Code Organization**: Structuring the analysis into multiple R scripts for improved readability and maintainability.
9. **Statistical Reporting**: Use of `stargazer` for creating publication-quality regression tables.
10. **Version Control Integration**: Project structured for easy integration with Git for version control.

## Requirements

See `requirements.txt` for a list of required R packages.

## Academic Context

This project was completed as part of the Multivariate Analysis course, taught by Professor Thomas Gschwend at the University of Mannheim. It represents a component of the Master's programme in Political Science.

## Author

Jannik Marian Hoffmann

## Acknowledgments

- British Election Study for creating a great dataset
- Professor Thomas Gschwend for guidance and instruction in the Multivariate Analysis course
- University of Mannheim, Political Science Department

## Citations

This project builds upon and references the following academic works:

Altemeyer, B. (1981). Right-wing authoritarianism. University of Manitoba Press.

Colantone, I., & Stanig, P. (2018). Global competition and Brexit. American Political Science Review, 112(2), 201-218.

Goodwin, M. J., & Milazzo, C. (2017). Taking back control? Investigating the role of immigration in the 2016 vote for Brexit. The British Journal of Politics and International Relations, 19(3), 450-464.

Greenhill, B., Ward, M. D., & Sacks, A. (2011). The Separation Plot: A New Visual Method for Evaluating the Fit of Binary Models. American Journal of Political Science, 55(4), 991-1002.

King, G., Tomz, M., & Wittenberg, J. (2000). Making the Most of Statistical Analyses: Improving Interpretation and Presentation. American Journal of Political Science, 44(2), 341-355.

Norris, P., & Inglehart, R. (2019). Cultural backlash: Trump, Brexit, and authoritarian populism. Cambridge University Press.

Stenner, K. (2005). The authoritarian dynamic. Cambridge University Press.

## Data Source

The data used in this analysis comes from:

Fieldhouse, E., Green, J., Evans, G., Schmitt, H., van der Eijk, C., Mellon, J., & Prosser, C. (2020). British Election Study Internet Panel Waves 1-19. https://www.britishelectionstudy.com/data-object/british-election-study-combined-wave-1-19-internet-panel/

## License

This project is licensed under the MIT License - see the LICENSE file for details.
