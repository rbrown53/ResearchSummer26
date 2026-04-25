################
# R Practice 2 #
################

#############
# Problem 1 #
#############
# Part a
# ======
temperatures <- c(25, 28, 30, 27, 23, 22, 26)
mean(temperatures)

# Part b
# ======
days <- c("Monday", "Tuesday", "Wednesday", "Thursday",
          "Friday", "Saturday", "Sunday")
days

# Part c
# ======
test_scores <- c(85, 92, 78, 60, 95, 88, 68, 82, 91, 75)
mean(test_scores) # 81.4
median(test_scores) # 83.5
sd(test_scores) # 11.23684
IQR(test_scores) # 14.5

# Part d
# ======
mean(test_scores[c(1:3, 10)]) # 82.5
median(test_scores[c(1:3, 10)]) # 81.5
sd(test_scores[c(1:3, 10)]) # 7.593857
IQR(test_scores[c(1:3, 10)]) # 9.5

# Part e
# ======
passing <- test_scores >= 70
mean(passing) # The mean of a logical vector will give the proportion

# Part f
# ======
mean(test_scores[which(passing)]) # 85.75
median(test_scores[which(passing)]) # 86.5
sd(test_scores[which(passing)]) # 7.045769
IQR(test_scores[which(passing)]) # 10.25

#############
# Problem 2 #
#############
# Part a
# ======
students <- data.frame(Name = c("Alice", "Bob", "Catherine"),
                       Age = c(25, 22, 23),
                       Grade = c("A", "B", "A-"))

# Part b
# ======
# There are many ways to due this. This is one.
students <- cbind(students, Sex = c("Female", "Male", "Female"))

#############
# Problem 3 #
#############
# Part a
# ======
DF <- data.frame(x = c(10, 12, 8, 8, 7, 10, 6, 15, 16, 20, 12, 21),
                 y = c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                       "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))

# Part b
# =======
names(DF) <- c("sales", "month")
head(DF)

# Part c
# ======
sales_info <- data.frame(DF, revenue = 100*DF$sales - 80)

# Part d
# ======
rm(DF)

# Part e
# ======
mean(sales_info$revenue) # 1128.333
mean(sales_info[,3]) # Same answers: 1128.333

# Part f
# =====
mean(sales_info$revenue[6:8]) # 953.333
# Could also do mean(sales_info[6:8,3])

#############
# Problem 4 #
#############
# Part a
# ======
data(mtcars)
head(mtcars, 10)

# Part b
# ======
mtcars_ordered <- mtcars[order(mtcars$hp, decreasing=T),]
mtcars_ordered[which(mtcars_ordered$hp>100),]

#############
# Problem 5 #
#############
# Part a
# ======
grade_level <- c(rep("freshmen", 6), rep("sophomores", 2), rep("juniors", 3),
                 rep("seniors", 4))

# Part b
# ======
grade_factor <- factor(grade_level, levels = c("freshmen", "sophomores",
                                               "juniors", "seniors"))