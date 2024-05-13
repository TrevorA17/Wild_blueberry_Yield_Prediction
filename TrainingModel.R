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