# *** USING LINEAR REGRESSION FOR FORCASTING ***

# Install if not already installed
# install.packages("tidyverse")

# load libraries
library(tidyverse)

#set working directory (adjust this for your own computer)
setwd("C:/Users/Admin/Data-Science/Data-Science/Data-Science-Projects")

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

