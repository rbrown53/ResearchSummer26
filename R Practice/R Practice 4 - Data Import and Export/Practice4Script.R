################
# R Practice 4 #
################

#############
# Problem 1 #
#############

# Part a
# ======
brexit_csv <- read.csv("brexit.csv")
head(brexit_csv)

# Part b
# ======
brexit_table <- read.table("brexit.csv", header = T, sep = ",")
head(brexit_table)

# Part c
# ======
# The spread variable is the difference between the remain and leave proportioms.
#   When spread is positive, that poll indicated that the proporiton who want to 
#   remain is larger. 

# Part d
# ======
mean(brexit_csv$leave[brexit_csv$poll_type == "Online"])
mean(brexit_csv$leave[brexit_csv$poll_type == "Telephone"])
# Online is 0.4259 and Telephone is 0.415. 
# Can also use tidyverse:
brexit_csv |> 
  group_by(poll_type) |>
  summarize(avg = mean(leave))

# Part e
# ======
decision <- rep("leave", 127)
decision[brexit_csv$remain > brexit_csv$leave] <- "remain"
brexit_new <- data.frame(brexit_csv, decision = as.factor(decision))

# Part f
# ======
summary(brexit_new$decision)
# More polls indicate Brits want to remain.

# Part g
# ======
write.csv(brexit_new, "brexit_new.csv")


#############
# Problem 2 #
#############
library(readxl)
temp_location <- read_excel("USTempLocation.xlsx")
head(temp_location, 10)
