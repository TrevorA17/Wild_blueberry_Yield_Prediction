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

# Load the caret library for data splitting
library(caret)

# Set seed for reproducibility
set.seed(123)

# Define the proportion of data to be used for training (e.g., 70% for training, 30% for testing)
train_proportion <- 0.7

# Split the dataset into training and testing sets
index <- createDataPartition(y = wild_blueberry_data$yield, p = train_proportion, list = FALSE)
train_data <- wild_blueberry_data[index, ]
test_data <- wild_blueberry_data[-index, ]

# Print the dimensions of the training and testing sets
print("Dimensions of Training Data:")
print(dim(train_data))
print("Dimensions of Testing Data:")
print(dim(test_data))

# Define the number of bootstrap iterations
num_iterations <- 1000

# Create an empty vector to store the bootstrapped means
bootstrapped_means <- numeric(num_iterations)

# Perform bootstrapping
for (i in 1:num_iterations) {
  # Sample with replacement from the original dataset
  boot_sample <- sample(wild_blueberry_data$yield, replace = TRUE)
  # Calculate the mean of the bootstrapped sample and store it
  bootstrapped_means[i] <- mean(boot_sample)
}

# Calculate the mean and standard error of bootstrapped means
mean_boot_mean <- mean(bootstrapped_means)
se_boot_mean <- sd(bootstrapped_means)

# Display results
print("Bootstrapping Results:")
print(paste("Mean of Bootstrapped Means:", mean_boot_mean))
print(paste("Standard Error of Bootstrapped Means:", se_boot_mean))

# Load the caret library for cross-validation
library(caret)

# Define the number of folds for cross-validation
num_folds <- 10

# Define the control parameters for cross-validation
ctrl <- trainControl(method = "cv", number = num_folds)

# Define the model training process
model <- train(yield ~ ., data = wild_blueberry_data, method = "lm", trControl = ctrl)

# Print the cross-validated performance metrics
print("Cross-Validated Performance Metrics:")
print(model$results)

