# *** PLOTTING TIME SERIES TREND AND USING LINEAR REGRESSION FOR FORCASTING ***

# Install if not already installed
# install.packages("tidyverse")

# load libraries
library(tidyverse)

#set working directory (adjust this for your own computer)
setwd("C:/Users/Admin/Projects/R_US_retaill_forecast")

# This data on united states yearly retail sales comes from statistica
#read dataset into R
sales_df <- read.csv("us-retail.csv")

# The Retail_Sales column values are in billions of US dollars
View(sales_df)

# Plot time series showing yearly retail sales in billions
ggplot(data = sales_df, mapping = aes(x = Year, y = Retail_Sales)) +
  geom_line() +
  geom_point() +
  scale_x_continuous(breaks = seq(1990, 2025, by = 5)) +
  scale_y_continuous(breaks = seq(1000, 8000, by = 1000)) +
  labs(title = "Total Retail Sales in the U.S. from 1992 to 2023",
       x = "Year", y = "Retail Sales (in Billions)")

# Add a column of numbers corresponding to each year (1 to 32) for time
sales_df$Time <- 1:nrow(sales_df)

# Create a regression equation using simple linear regression for forecasting
lm_retail <- lm(Retail_Sales ~ Time, data = sales_df)
summary(lm_retail)

#Predict US retail sales for 2024
1510.951+(147.675*33)
# It's $ 6,384,226,000,000

#Predict US retail sales for 2024, 2025, 2026
#Create data frame with the time periods to use for the prediction
retail_preds <- data.frame(Time = c(33, 34, 35))

# Use new time periods and regression model to predict
predict(lm_retail, newdata = retail_preds)


# Functions for calculating the accuracy measures
mae<-function(actual,pred){
  mae <- mean(abs(actual-pred), na.rm=TRUE)
  return (mae)
}

mse<-function(actual,pred){
  mse <- mean((actual-pred)^2, na.rm=TRUE)
  return (mse)
}

rmse<-function(actual,pred){
  rmse <- sqrt(mean((actual-pred)^2, na.rm=TRUE))
  return (rmse)
}  

mape<-function(actual,pred){
  mape <- mean(abs((actual - pred)/actual), na.rm=TRUE)*100
  return (mape)
}

# Vector for predicted values by using regression above
us_pred = predict(lm_retail)

lm_retail

# Run the accuracy measures
mae (sales_df$Retail_Sales, us_pred)
mse (sales_df$Retail_Sales, us_pred)
rmse (sales_df$Retail_Sales, us_pred)
mape (sales_df$Retail_Sales, us_pred)

# Residuals are the difference between actual and predicted values for the response variable. 
# Vector of residuals using regression lm_retail
us_resid = resid(lm_retail)

# Data frame of residuals and predicted values.
res_pred_us <- data.frame(us_resid, us_pred)

# Plot residuals and predictions on a scatter plot
ggplot(data = res_pred_us, mapping = aes(x = us_pred, y = us_resid)) +
  geom_point() +
  labs(title = "Residuals vs Predicted Retail Sales", x = "Predicted Values",
       y = "Residuals")

# In a residuals vs predictors plot, the residuals should bounce around, randomly scattered around the 0 line.
# Our residuals aren't exactly random around 0, so our model must be missing something. 
# Our residuals sort of follow a pattern. For the first 15 or so years, they fluctuate between near 0 and 150.
# Then, the next 10 years vary between -600 and about -250. Then, the residuals for the last 3 years are all above 500.
