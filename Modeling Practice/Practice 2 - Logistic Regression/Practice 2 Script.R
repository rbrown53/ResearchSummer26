#################################################
# R Script for Practice 2 - Logistic Regression #
#################################################

#############
# Problem 1 #
#############
# Part a
# ======
# Set the working directory to be where my data file is
setwd("~/My Drive/Research/Student Research/GitHub/Modeling Practice/Practice 2 - Logistic Regression")
city <- read.csv("USTempLocation.csv")
library(math3150package)
city <- city |>
  mutate(CitySize = factor(CitySize, levels = c("Under1M", "Over1M")))

# Part b
# ======
city_mod <- glm(CitySize ~ JanTemp  + Region, data = city, family = binomial())

# Part c, d, e, and f
# ===================
summary(city_mod)

# Part g
# ======
predict(
  city_mod, 
  data.frame(JanTemp = 20, Region = "Northeast"), 
  type = "response"
)

# Part h
# ======
predicted_size <- as.numeric(predict(city_mod, type = "response") > 0.5)
table(truth = city$CitySize, prediction = predicted_size) # 0 is under and 1 is over

# Part i
# ======
logistic_plots(city_mod)
city[c(16, 48, 11),]




