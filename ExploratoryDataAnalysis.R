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
