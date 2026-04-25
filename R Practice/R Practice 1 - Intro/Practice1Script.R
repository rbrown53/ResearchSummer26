################
# R Practice 1 #
################

#############
# Problem 1 #
#############
# Part a
# ======
8 - 3 * 2
# Answer is 2

# Part b
# ======
3^4 + sqrt(16) + exp(3)
# Answer is 105.0855

# Part c
# ======
seq(1, 15, by = 2)

# Part d
# ======
x <- 5:15
sum(x)
# Answer is 110

# Part e
# ======
vec <- c(2, 4, 6, 8, 10)
mean(vec)
median(vec)

#############
# Problem 2 #
#############
# Part a
# ======
city <- "Edinburgh, Scotland"
print(city)

# Part b
# ======
birth_year <- 1992
paste("I was born in", birth_year)

# Part c
# ======
country <- "USA"
print(country)

# Part d
# ======
birth_month <- 7
paste("I was born in month", birth_month)

#############
# Problem 3 #
#############
# Part a
# ======
books <- c("The Hobbit", "Harry Potter", "Monster")

# Part b
# ======
is_employed <- TRUE
paste("Am I currently employed?", is_employed)

# Part c
# ======
ages <- c(25, 34, 32, 41, 26)

# Part d
# ======
fruits <- c("Apple", "Bannana", "Cantaloupe")
prices <- c(1.49, 0.49, 0.44)


#############
# Problem 4 #
#############
# Part a
# ======
ceiling(7.25)
# The result is 8. This rounds a number up. 

# Part b
# ======
abs(-7)
# This is the absolute value function.
# It makes any number entered positive. 

# Part c
# ======
round(3.14159, 2)
# This rounds a number to the specified number of
#   decimal places. In this case, it rounds the 
#   number to two decimal places

# Part d
# ======
?toupper
# This converts a string to all uppercase letters
toupper("hello, world")

# Part e
# ======
# Lots of possible answers here. 
# range gives the max and min value of a vector
range(c(10, 5, 3, 2)) 

# cumsum gives the cumulative sum for a vector
cumsum(c(10, 5, 3, 2))


#############
# Problem 5 #
#############
# Part a
# ======
install.packages("MASS")
library(MASS)
fractions(2 + 1/4 + 8/7 + 10/3)
# Answer is 565/84

# Part b
# ======
install.packages(tidyverse)

# Part c
# ======
library(tidyverse)
