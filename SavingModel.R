# Create a directory named "models" if it doesn't exist
if (!file.exists("./models")) {
  dir.create("./models")
}

# Saving the GBM model for the wild blueberry dataset
saveRDS(gbm_model, file = "./models/wild_blueberry_gbm_model.rds")

# Load the saved GBM model
loaded_wild_blueberry_gbm_model <- readRDS("./models/wild_blueberry_gbm_model.rds")

# Prepare new data for prediction (replace with your actual new data)
new_wild_blueberry_data <- data.frame(
  clonesize = c(37.5, 37.5, 38.2),  # Example clonesize values
  honeybee = c(0.75, 0.85, 0.9),  # Example honeybee values
  bumbles = c(0.25, 0.15, 0.2),  # Example bumbles values
  andrena = c(0.25, 0.3, 0.4),  # Example andrena values
  osmia = c(0.25, 0.2, 0.3),  # Example osmia values
  MaxOfUpperTRange = c(86, 87, 85),  # Example MaxOfUpperTRange values
  MinOfUpperTRange = c(52, 53, 50),  # Example MinOfUpperTRange values
  AverageOfUpperTRange = c(71.9, 72.3, 71.5),  # Example AverageOfUpperTRange values
  MaxOfLowerTRange = c(62, 63, 60),  # Example MaxOfLowerTRange values
  MinOfLowerTRange = c(30, 32, 28),  # Example MinOfLowerTRange values
  AverageOfLowerTRange = c(50.8, 51.2, 50.5),  # Example AverageOfLowerTRange values
  RainingDays = c(16, 15, 18),  # Example RainingDays values
  AverageRainingDays = c(0.1, 0.2, 0.3),  # Example AverageRainingDays values
  fruitset = c(0.444, 0.435, 0.45),  # Example fruitset values
  fruitmass = c(33.5, 32.7, 34.2),  # Example fruitmass values
  seeds = c(5000, 4900, 5100)  # Example seeds values
)

# Use the loaded model to make predictions for new wild blueberry data
predictions_gbm_loaded_model <- predict(loaded_wild_blueberry_gbm_model, newdata = new_wild_blueberry_data)

# Print predictions
print(predictions_gbm_loaded_model)
