# =====================================================
# PRACTICAL DATA ANALYSIS WITH R
# Working with real datasets and visualization
# =====================================================

# This script will guide you through a complete data analysis workflow
# using R's built-in datasets

# =====================================================
# SECTION 1: EXPLORING BUILT-IN DATASETS
# =====================================================

# R comes with several built-in datasets that are perfect for practice
# Let's see what datasets are available
data()

# We'll work with the mtcars dataset (Motor Trend Car Road Tests)
# This dataset has data from 32 automobiles from 1973-1974
data(mtcars)

# First, let's examine the structure of the dataset
str(mtcars)

# Look at the first few rows
head(mtcars)

# Basic summary statistics
summary(mtcars)

# =====================================================
# SECTION 2: DATA EXPLORATION
# =====================================================

# Dimensions of the dataset
dim(mtcars)

# Column names
names(mtcars)

# Basic statistics for a specific column
mean(mtcars$mpg)
median(mtcars$mpg)
min(mtcars$mpg)
max(mtcars$mpg)
sd(mtcars$mpg)  # Standard deviation

# Check for missing values
any(is.na(mtcars))

# Create a frequency table of the number of cylinders
table(mtcars$cyl)

# Correlation between variables
cor(mtcars$mpg, mtcars$wt)  # Correlation between mpg and weight

# Correlation matrix for all variables
cor(mtcars)

# =====================================================
# SECTION 3: DATA VISUALIZATION
# =====================================================

# Basic histogram
hist(mtcars$mpg, 
     main = "Distribution of Miles Per Gallon",
     xlab = "Miles Per Gallon",
     col = "lightblue",
     breaks = 10)

# Boxplot
boxplot(mtcars$mpg, 
        main = "Miles Per Gallon Boxplot",
        ylab = "MPG",
        col = "lightgreen")

# Boxplot by groups
boxplot(mpg ~ cyl, data = mtcars, 
        main = "MPG by Number of Cylinders",
        xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon",
        col = c("lightblue", "lightgreen", "lightpink"))

# Scatter plot
plot(mtcars$wt, mtcars$mpg, 
     main = "MPG vs. Weight",
     xlab = "Weight (1000 lbs)",
     ylab = "Miles Per Gallon",
     pch = 19,  # Solid circle point type
     col = "blue")

# Multiple scatter plots (pairs plot)
pairs(mtcars[, c("mpg", "disp", "hp", "wt")], 
      main = "Scatterplot Matrix")

# =====================================================
# SECTION 4: BASIC STATISTICAL ANALYSIS
# =====================================================

# T-test: Compare MPG between cars with automatic vs. manual transmission
t.test(mpg ~ am, data = mtcars)

# Linear regression: Predict MPG based on weight
model1 <- lm(mpg ~ wt, data = mtcars)
summary(model1)

# Plot the regression line
plot(mtcars$wt, mtcars$mpg, 
     main = "MPG vs. Weight with Regression Line",
     xlab = "Weight (1000 lbs)",
     ylab = "Miles Per Gallon",
     pch = 19,
     col = "blue")
abline(model1, col = "red", lwd = 2)

# Multiple regression: Predict MPG based on multiple factors
model2 <- lm(mpg ~ wt + hp + cyl, data = mtcars)
summary(model2)

# Analysis of variance (ANOVA)
anova_result <- aov(mpg ~ as.factor(cyl), data = mtcars)
summary(anova_result)

# =====================================================
# SECTION 5: DATA MANIPULATION
# =====================================================

# Create a new variable
mtcars$efficiency <- ifelse(mtcars$mpg > 20, "High", "Low")
head(mtcars)

# Count by categories
table(mtcars$efficiency, mtcars$cyl)

# Subset the data
high_mpg_cars <- subset(mtcars, mpg > 25)
high_mpg_cars

# Sort the data
sorted_mtcars <- mtcars[order(-mtcars$mpg), ]
head(sorted_mtcars)

# Group statistics
by(mtcars$mpg, mtcars$cyl, summary)
aggregate(mpg ~ cyl, data = mtcars, mean)

# =====================================================
# SECTION 6: EXERCISES
# =====================================================

# Exercise 1: Create a scatter plot of horsepower (hp) vs. quarter mile time (qsec)
# Your code here:
# plot(...)

# Exercise 2: Find the car with the best MPG and the car with the worst MPG
# Your code here:
# best_mpg <- ...
# worst_mpg <- ...

# Exercise 3: Calculate the average MPG for each combination of cylinders and transmission type
# Your code here:
# avg_mpg_by_group <- ...

# Exercise 4: Create a new variable called 'power_to_weight' which is hp divided by wt
# Then create a scatter plot of this new variable vs. mpg
# Your code here:
# mtcars$power_to_weight <- ...
# plot(...)

# Exercise 5: Build a linear model that predicts quarter mile time (qsec) based on 
# horsepower, weight, and transmission type. Interpret the results.
# Your code here:
# qsec_model <- ...
# summary(...)

# =====================================================
# ADDITIONAL DATASETS TO EXPLORE
# =====================================================

# Iris Dataset - famous dataset of flower measurements
# data(iris)
# str(iris)
# head(iris)

# Airquality Dataset - Daily air quality measurements in New York
# data(airquality)
# str(airquality)
# head(airquality)

# Titanic survival data
# install.packages("titanic")
# library(titanic)
# data(titanic_train)
# head(titanic_train)

# =====================================================
# CONCLUSION
# =====================================================

# This script has walked you through the basics of data analysis with R
# As you become more comfortable, consider exploring:
# - More advanced statistical methods
# - Machine learning techniques
# - Interactive visualizations with plotly or shiny
# - Working with external datasets in CSV, Excel, or database formats
# - Data cleaning and preprocessing methods 