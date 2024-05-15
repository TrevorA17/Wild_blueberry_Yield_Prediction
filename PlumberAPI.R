# Load necessary libraries
library(plumber)

# Load the saved GBM model for wild blueberry yield prediction
loaded_wild_blueberry_gbm_model <- readRDS("./models/wild_blueberry_gbm_model.rds")

#* @apiTitle Wild Blueberry Yield Prediction Model API
#* @apiDescription Used to predict the yield of wild blueberries.

#* @post /predict_wild_blueberry_yield
#* @param clonesize Numeric: Clone size
#* @param honeybee Numeric: Honeybee presence
#* @param bumbles Numeric: Bumblebee presence
#* @param andrena Numeric: Andrena presence
#* @param osmia Numeric: Osmia presence
#* @param MaxOfUpperTRange Numeric: Maximum upper temperature range
#* @param MinOfUpperTRange Numeric: Minimum upper temperature range
#* @param AverageOfUpperTRange Numeric: Average upper temperature range
#* @param MaxOfLowerTRange Numeric: Maximum lower temperature range
#* @param MinOfLowerTRange Numeric: Minimum lower temperature range
#* @param AverageOfLowerTRange Numeric: Average lower temperature range
#* @param RainingDays Numeric: Number of raining days
#* @param AverageRainingDays Numeric: Average number of raining days
#* @param fruitset Numeric: Fruit set
#* @param fruitmass Numeric: Fruit mass
#* @param seeds Numeric: Seeds count
predict_wild_blueberry_yield <- function(clonesize, honeybee, bumbles, andrena, osmia, MaxOfUpperTRange, MinOfUpperTRange, AverageOfUpperTRange, MaxOfLowerTRange, MinOfLowerTRange, AverageOfLowerTRange, RainingDays, AverageRainingDays, fruitset, fruitmass, seeds) {
  # Create a data frame using the arguments
  new_wild_blueberry_data <- data.frame(
    clonesize = as.numeric(clonesize),
    honeybee = as.numeric(honeybee),
    bumbles = as.numeric(bumbles),
    andrena = as.numeric(andrena),
    osmia = as.numeric(osmia),
    MaxOfUpperTRange = as.numeric(MaxOfUpperTRange),
    MinOfUpperTRange = as.numeric(MinOfUpperTRange),
    AverageOfUpperTRange = as.numeric(AverageOfUpperTRange),
    MaxOfLowerTRange = as.numeric(MaxOfLowerTRange),
    MinOfLowerTRange = as.numeric(MinOfLowerTRange),
    AverageOfLowerTRange = as.numeric(AverageOfLowerTRange),
    RainingDays = as.numeric(RainingDays),
    AverageRainingDays = as.numeric(AverageRainingDays),
    fruitset = as.numeric(fruitset),
    fruitmass = as.numeric(fruitmass),
    seeds = as.numeric(seeds)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_wild_blueberry_gbm_model, newdata = new_wild_blueberry_data)
  
  # Return the prediction
  return(as.character(prediction))
}
