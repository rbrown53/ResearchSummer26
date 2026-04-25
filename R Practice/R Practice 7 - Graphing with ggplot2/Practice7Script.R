################
# R Practice 7 #
################

#############
# Problem 1 #
#############
library(tidyverse)
# Part a
# ======
data(msleep)
msleep
ggplot(msleep, aes(x = brainwt, y = bodywt)) +
  geom_line()
  
# Part b
# ======
ggplot(msleep, aes(x = brainwt, y = bodywt)) +
  geom_line(col = "blue") +
  geom_point(col = 'darkblue')

# Part c
# ======
msleep2 <- msleep |>
  mutate(logbrain = log(brainwt), logbody = log(bodywt))

ggplot(msleep2, aes(x = logbrain, y = logbody)) +
  geom_line() +
  geom_point()

# Part d
# ======
ggplot(msleep, aes(x = vore)) +
  geom_bar()

ggplot(msleep, aes(x = conservation)) +
  geom_bar(color = "black", fill = "lightblue")

# Part e
# ======
ggplot(msleep, aes(x = awake)) +
  geom_histogram()

ggplot(msleep, aes(x = awake)) +
  geom_histogram(col = "black", fill = "lightblue", bins = 10)

# Part f
# ======
ggplot(msleep, aes(x = conservation, y = sleep_total, fill = conservation)) +
  geom_boxplot() +
  labs(x = "Conservation Status", y = "Total Sleep Time", fill = "Conservation")

ggplot(msleep, aes(x = vore, y = sleep_rem, fill = vore)) +
  geom_boxplot() +
  labs(x = "Vore", y = "Total Rem Sleep Time", fill = "Vore")

# Part g
# ======
ggplot(msleep2, aes(x = logbrain, fill = conservation)) +
  geom_density(alpha = 0.5) + 
  labs(x = "Log(Brain Weight)", y = "Density") +
  ggtitle("Density Plots of Log(Brain Weight)") +
  theme(axis.title = element_text(size = 14))


ggplot(msleep2, aes(x = logbody, fill = vore)) +
  geom_density(alpha = 0.5) + 
  labs(x = "Log(Body Weight)", y = "Density") +
  ggtitle("Density Plots of Log(Body Weight)") +
  theme(axis.title = element_text(size = 16))

#############
# Problem 2 #
#############
# Part a
# ======
college <- read_csv("CollegeDistance.csv")
head(college)

# Part b
# ======
ggplot(college, aes(x = gender)) +
  geom_bar(col = "black", fill = "lightblue") +
  labs(x = "Gender", y = "Frequency") + 
  ggtitle("Barplot of Gender")

# Part c
# ======
ggplot(college, aes(x = income, fill = ethnicity)) +
  geom_bar(position = "fill") +
  labs(x = "Income", y = "Frequency") + 
  ggtitle("Barplot of Ethnicity by Income") +
  scale_fill_manual(labels = c("African American", "Hispanic", "Other"),
                    values = c("blue", "green", "orange"))

# Part d
# ======
ggplot(college, aes(x = unemp, y = tuition)) +
  geom_point(color = "darkblue") +
  labs(x = "Unemployment Rate",
       y = "Average 4-Year College Tuition (in thousands") +
  theme(axis.title = element_text(size=14),
        plot.title = element_text(size=14, face = "bold")) + 
  ggtitle("Plot of Tuition vs Unemployment")

# Part e
# ======
ggplot(college, aes(x = distance)) +
  geom_histogram(col = "black", fill = "lightblue") +
  labs(x = "Distance from College (in 10 miles)", y = "Frequency") + 
  ggtitle("Histogram of Distance") +
  theme_dark()

# Part f
# ======
ggplot(college, aes(x = income, y = score)) + 
  geom_boxplot(fill = "darkgreen") +
  labs(x = "Income Level", y = "Composite Test Score") +
  ggtitle("Histogram of Score by Income Level")

# Part g
# ======
ggplot(college, aes(x = gender, fill = ethnicity)) +
  geom_bar(col = "black", position = "dodge") +
  labs(x = "Gender", y = "Frequency") + 
  ggtitle("Barplot of Gender Split by Ethnicity")

#############
# Problem 3 #
#############
# Part a
# ======
nile <- read_csv("nile.csv")

# Part b
# ======
ggplot(nile, aes(x = time, y = value)) +
  geom_point(col = "brown", shape = 17, size = 2) +
  labs(x = "Year", y = "Annual Flow of Nile (in 10^8 cubic meters)") + 
  ggtitle("Time Series of Annual Nile Flow") +
  scale_y_continuous(breaks = seq(300, 2000, by = 100))


#############
# Problem 4 #
#############
# Part a
# ======
air <- read_csv("airlines.csv")
air <- air |>
  mutate(airline = as.factor(airline))
head(air)

# Part b
# ======
ggplot(air, aes(x = year, y = cost, color = airline)) +
  geom_line(aes(linetype = airline)) +
  lims(y = c(0, 5000000)) + 
  geom_point() +
  labs(x = "Year", y = "Cost (in thousands)") +
  ggtitle("Scatter Plot of Cost by Year") + 
  scale_color_manual(values = c("red", "orange", "yellow", "green", 
                                "blue", "purple"))

# Part c
# ======
ggplot(air, aes(x = year, y = cost)) +
  geom_line(aes(linetype = airline)) +
  lims(y = c(0, 5000000)) + 
  geom_point() +
  labs(x = "Year", y = "Cost (in thousands)") +
  ggtitle("Scatter Plot of Cost by Year") + 
  facet_grid(cols = vars(airline), labeller = label_both)

