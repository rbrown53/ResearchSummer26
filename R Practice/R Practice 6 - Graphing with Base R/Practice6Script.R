################
# R Practice 6 #
################

#############
# Problem 1 #
#############

# Part a
# ======
college <- read.csv("CollegeDistance.csv")
head(college)

# Part b
# ======
barplot(table(college$gender), xlab = "Gender",
        ylab = "Frequency", main = "Boxplot of Gender")

# Part c
# ======
pie(table(college$ethnicity),
    labels = c("African American", "Hispanic", "Other"),
    col = c("blue", "darkgreen", "orange"))

# Part d
# ======
plot(college$unemp, college$tuition, xlab = "Unemployment Rate",
     ylab = "Average 4-Year College Tuition (in thousands)",
     pch = 16, col = "darkblue", cex.lab = 1.3,
     main = "Plot of Tuition vs Unemployment")

# Part e
# ======
hist(college$distance, xlab = "Distance from College (in 10 miles)",
     main = "Histogram of Distance", col = "lightblue")

# Part f
# ======
boxplot(college$score ~ college$income, xlab = "Income Level",
        ylab = "Composite Test Score",
        main = "Histogram of Score by Income Level",
        col = "darkgreen")

#############
# Problem 2 #
#############
# Part a
# ======
nile <- read.csv("nile.csv")

# Part b
# ======
plot(nile$time, nile$value, xlab = "Year",
     ylab = "Annual Flow of Nile (in 10^8 cubic meters)",
     main = "Time Series of Annual Nile Flow",
     cex.lab = 1.3, cex.axis = 1.2, cex.main = 1.3,
     pch = 17, col = "brown",
     mgp = c(2.5, 0.5, 0))

