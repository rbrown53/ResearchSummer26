###########################################################
# R Script for Practice 2 - Bayesian Methods and Modeling #
###########################################################

#############
# Problem 1 #
#############
# Part a 
# ======
library(math3150package)
# Set the working direcotry to be where my data file is
setwd("~/My Drive/Research/Student Research/GitHub/Modeling Practice/Practice 1 - Linear Regression")
country <- read.csv("Country_Information.csv")

# Part b
# ======
country_mod <- lm(LifeExpectancy ~ GII, data = country)
summary(country_mod)

# Part c, d, e, and f
# ===================
library(brms)
set.seed(1)
country_bayes <- brm(LifeExpectancy ~ GII, data = country, backend = "cmdstanr")
summary(country_bayes)

# Part f
# ======
plot(country_bayes)

# Part g
# ======
country_priors <- c(
  prior(normal(50, 10), class = "b", coef = "Intercept"),
  prior(normal(-20, 5), class = "b", coef = "GII"),
  prior(exponential(0.2), class = "sigma")
)
set.seed(1)
country_bayes2 <- brm(LifeExpectancy ~ 0 + Intercept + GII, data = country, 
                      backend = "cmdstanr", prior = country_priors)
summary(country_bayes2)

# Part h
# ======
pp_check(country_bayes2, ndraws = 10)


#############
# Problem 2 #
#############
# Part a
# ======
setwd("~/My Drive/Research/Student Research/GitHub/Modeling Practice/Practice 2 - Logistic Regression")
city <- read.csv("USTempLocation.csv")
library(math3150package)
city <- city |>
  mutate(CitySize = factor(CitySize, levels = c("Under1M", "Over1M")))
city_mod <- glm(CitySize ~ JanTemp  + Region, data = city, family = binomial())
summary(city_mod)

# Part b and c
# ============
set.seed(1)
city_bayes <- brm(CitySize ~ JanTemp  + Region, data = city, 
                  family = bernoulli(), backend = "cmdstanr")
summary(city_bayes)

# Part d
# ======
city_priors <- c(
  prior(normal(1, 1), class = "b", coef = "JanTemp"),
  prior(normal(2, 1), class = "b", coef = "RegionNortheast"),
  prior(normal(-2, 1), class = "b", coef = "RegionSouth"),
  prior(normal(0, 1), class = "b", coef = "RegionWest")
)
city_bayes2 <- brm(CitySize ~ JanTemp  + Region, data = city, 
                   family = bernoulli(), backend = "cmdstanr", 
                   prior = city_priors, iter = 4000, chains = 6, cores = 4, seed = 1)
summary(city_bayes2)

plot(city_bayes2)

# Part e
# ======
pp_check(city_bayes2, ndraws = 10)
