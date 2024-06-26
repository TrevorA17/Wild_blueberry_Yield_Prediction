# Load dataset
wild_blueberry_data <- read.csv("data/WildBlueberryPollinationSimulationData.csv", colClasses = c(
  clonesize = "numeric",
  honeybee = "numeric",
  bumbles = "numeric",
  andrena = "numeric",
  osmia = "numeric",
  MaxOfUpperTRange = "numeric",
  MinOfUpperTRange = "numeric",
  AverageOfUpperTRange = "numeric",
  MaxOfLowerTRange = "numeric",
  MinOfLowerTRange = "numeric",
  AverageOfLowerTRange = "numeric",
  RainingDays = "numeric",
  AverageRainingDays = "numeric",
  fruitset = "numeric",
  fruitmass = "numeric",
  seeds = "numeric",
  yield = "numeric"
))

# Display the structure of the dataset
str(wild_blueberry_data)

# View the first few rows of the dataset
head(wild_blueberry_data)

# View the dataset in a separate viewer window
View(wild_blueberry_data)

# Measures of frequency

# Count of unique values in each column
unique_counts <- sapply(wild_blueberry_data, function(x) length(unique(x)))

# Summary of unique value counts
summary_unique <- summary(unique_counts)

# Frequency table for categorical variables
frequency_table <- lapply(wild_blueberry_data[, sapply(wild_blueberry_data, is.factor)], table)

# Display results
print("Summary of Unique Value Counts:")
print(summary_unique)
print("Frequency Tables for Categorical Variables:")
print(frequency_table)

# Measures of central tendency

# Calculate mean, median, and mode for numeric variables
central_tendency <- data.frame(
  Mean = sapply(wild_blueberry_data[, sapply(wild_blueberry_data, is.numeric)], mean, na.rm = TRUE),
  Median = sapply(wild_blueberry_data[, sapply(wild_blueberry_data, is.numeric)], median, na.rm = TRUE)
)

# Mode function
get_mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# Calculate mode
mode_values <- sapply(wild_blueberry_data[, sapply(wild_blueberry_data, is.numeric)], get_mode)

# Combine mean, median, and mode into one dataframe
central_tendency <- cbind(central_tendency, Mode = mode_values)

# Display results
print("Measures of Central Tendency:")
print(central_tendency)

# Measures of distribution

# Calculate range, variance, and standard deviation for numeric variables
distribution <- data.frame(
  Range = sapply(wild_blueberry_data[, sapply(wild_blueberry_data, is.numeric)], function(x) max(x, na.rm = TRUE) - min(x, na.rm = TRUE)),
  Variance = sapply(wild_blueberry_data[, sapply(wild_blueberry_data, is.numeric)], var, na.rm = TRUE),
  StdDev = sapply(wild_blueberry_data[, sapply(wild_blueberry_data, is.numeric)], sd, na.rm = TRUE)
)

# Display results
print("Measures of Distribution:")
print(distribution)

# Measures of relationship

# Calculate correlation coefficients for numeric variables
correlation_matrix <- cor(wild_blueberry_data[, sapply(wild_blueberry_data, is.numeric)], use = "pairwise.complete.obs")

# Create contingency tables for categorical variables
contingency_tables <- lapply(wild_blueberry_data[, sapply(wild_blueberry_data, is.factor)], table)

# Display results
print("Correlation Matrix for Numeric Variables:")
print(correlation_matrix)
print("Contingency Tables for Categorical Variables:")
print(contingency_tables)

# Load the ggplot2 library
library(ggplot2)

# Univariate plots (histograms for numeric variables, bar plots for categorical variables)
univariate_plots <- lapply(names(wild_blueberry_data), function(var_name) {
  if (is.numeric(wild_blueberry_data[[var_name]])) {
    ggplot(wild_blueberry_data, aes_string(x = var_name)) +
      geom_histogram(fill = "skyblue", color = "black") +
      labs(title = paste("Histogram of", var_name), x = var_name, y = "Frequency")
  } else {
    ggplot(wild_blueberry_data, aes_string(x = var_name)) +
      geom_bar(fill = "skyblue", color = "black") +
      labs(title = paste("Bar Plot of", var_name), x = var_name, y = "Frequency")
  }
})


# Display plots
print("Univariate Plots:")
print(univariate_plots)





