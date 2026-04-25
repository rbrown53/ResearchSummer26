################
# R Practice 3 #
################

#############
# Problem 1 #
#############
# Part a
# ======
celsius_to_fahrenheit <- function(celsius) {
  fahrenheit <- 9/5 * celsius + 32
  fahrenheit
}

# Part b
# ======
celsius_to_fahrenheit(25) # Answer is 77 degrees Fahrenheit.


#############
# Problem 2 #
#############
calculate_bmi <- function(height, weight) {
    bmi <- weight/(height)^2
    bmi
}
calculate_bmi(1.71, 59.8, 2)

#############
# Problem 3 #
#############
?plot
# Plot 100 randomly generated values from a normal distribution
plot(x = rnorm(100), y = rnorm(100)) 
