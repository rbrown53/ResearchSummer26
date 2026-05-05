###############################################################################
# R Script for Practice 1 - Scatter Plots, Correlation, and Linear Regression #
###############################################################################

#############
# Problem 1 #
#############
# Set the working direcotry to be where my data file is
setwd("~/My Drive/Research/Student Research/Modeling Practice/Practice 1 - Linear Regression")
country <- read.csv("Country_Information.csv")
library(math3150package)

#############
# Problem 2 #
#############
# Create the correlation matrix
country |> 
  select(!Country) |>
  cor() |>
  round(3)


#############
# Problem 3 #
#############
# Part a
# ======
ggplot(country, aes(x = GII, y = LifeExpectancy)) +
  geom_point() +
  geom_smooth(method = "lm", formula = "y ~ x", se = F) +
  labs(x = "Gender Inequality Index (GII)", y = "Life Expectancy") +
  theme_bw()

# Part c
# ======
country_mod <- lm(LifeExpectancy ~ GII, data = country)
summary(country_mod)

# Part d
# ======
predict(country_mod, data.frame(GII = 0.5))

# Part e
# ======
predict(country_mod, data.frame(GII = 3.1))

# Part f, g, and h
# ================
summary(country_mod)

# Part i
# ======
predict(country_mod, data.frame(GII = 0.5), interval = "prediction")


#############
# Problem 4 #
#############
# Part a
# ======
county_mod_mult <- lm(LifeExpectancy ~ GDP + GII + EduIndex + PubHealthExp,
                      data = country)
summary(county_mod_mult)

# Part b
# ======
predict(county_mod_mult, 
        data.frame(GDP = 20000, GII = 0.4, EduIndex = 0.3, PubHealthExp = 1.8))

# Part c, d, e, and f
# ======
summary(county_mod_mult) # Look for R-squared

# Part g
# ======
residual_plots(county_mod_mult)

# Part h
# ======
influence_plots(county_mod_mult)
