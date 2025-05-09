# =====================================================
# INTRODUCTION TO R PROGRAMMING
# A beginner's guide with practical examples
# =====================================================

# R is a powerful programming language for statistical computing and graphics
# This guide will help you learn the fundamentals step by step

# =====================================================
# SECTION 1: BASIC R OPERATIONS
# =====================================================

# 1.1 Basic Arithmetic
2 + 3       # Addition
10 - 5      # Subtraction
4 * 5       # Multiplication
20 / 4      # Division
2 ^ 3       # Exponentiation
10 %% 3     # Modulo (remainder)
10 %/% 3    # Integer division

# 1.2 Variables
# Variables are used to store values
x <- 10     # Assign value 10 to variable x
y = 20      # Alternative assignment (= also works but <- is preferred)
z <- x + y  # z will be 30

# Display variable values
print(x)
print(y)
print(z)

# 1.3 Data Types
# Numeric
num <- 42.5
# Integer
int <- 42L  # The 'L' indicates this is an integer
# Character/String
text <- "Hello, R!"
# Logical
logic <- TRUE  # or FALSE

# Check data types
class(num)
class(int)
class(text)
class(logic)

# =====================================================
# SECTION 2: DATA STRUCTURES
# =====================================================

# 2.1 Vectors - one-dimensional arrays
# Create vectors
numbers <- c(1, 2, 3, 4, 5)
fruits <- c("apple", "banana", "orange")
logicals <- c(TRUE, FALSE, TRUE)

# Vector operations
numbers + 10          # Add 10 to each element
numbers * 2           # Multiply each element by 2
numbers[3]            # Access the third element
numbers[2:4]          # Access elements 2 through 4
length(numbers)       # Number of elements

# 2.2 Matrices - two-dimensional arrays
# Create a matrix
mat <- matrix(1:9, nrow = 3, ncol = 3)
mat
# Access elements
mat[2, 3]             # Element at row 2, column 3
mat[1, ]              # First row
mat[, 2]              # Second column

# 2.3 Lists - ordered collections of objects
# Create a list
my_list <- list(
  name = "John",
  age = 30,
  scores = c(85, 90, 92),
  passed = TRUE
)
my_list
# Access elements
my_list$name          # Access by name
my_list[[1]]          # Access by position
my_list$scores[2]     # Access nested elements

# 2.4 Data Frames - table-like structures
# Create a data frame
students <- data.frame(
  name = c("Alice", "Bob", "Charlie"),
  age = c(22, 21, 23),
  gpa = c(3.8, 3.2, 3.9)
)
students
# Access elements
students$name         # Access a column
students[2, ]         # Access a row
students[1, 2]        # Access a specific element

# =====================================================
# SECTION 3: CONTROL STRUCTURES
# =====================================================

# 3.1 Conditional statements (if, else if, else)
x <- 15

if (x > 10) {
  print("x is greater than 10")
} else if (x == 10) {
  print("x equals 10")
} else {
  print("x is less than 10")
}

# 3.2 For loops
# Print numbers 1 to 5
for (i in 1:5) {
  print(i)
}

# Loop through a vector
fruits <- c("apple", "banana", "orange")
for (fruit in fruits) {
  print(paste("I like", fruit))
}

# 3.3 While loops
counter <- 1
while (counter <= 5) {
  print(counter)
  counter <- counter + 1
}

# =====================================================
# SECTION 4: FUNCTIONS
# =====================================================

# 4.1 Using built-in functions
max(1, 5, 3, 7)       # Find maximum value
min(1, 5, 3, 7)       # Find minimum value
sum(1:10)             # Sum values
mean(c(10, 20, 30))   # Calculate average

# 4.2 Creating your own functions
# Function to calculate square
square <- function(x) {
  x ^ 2
}

# Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit <- function(celsius) {
  fahrenheit <- (celsius * 9 / 5) + 32
  fahrenheit
}


# Use the functions
square(4)
celsius_to_fahrenheit(25)

# Function with multiple arguments
calculate_bmi <- function(weight, height) {
  bmi <- weight / (height ^ 2)
  bmi
}

calculate_bmi(70, 1.75)

# =====================================================
# SECTION 5: DATA MANIPULATION WITH DPLYR
# =====================================================

# First, install and load the dplyr package if needed
# install.packages("dplyr")
# library(dplyr)

# Create a sample dataset
employees <- data.frame(
  name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  department = c("HR", "IT", "Finance", "IT", "HR"),
  salary = c(45000, 65000, 55000, 70000, 48000),
  years = c(2, 5, 3, 7, 4)
)

# =====================================================
# SECTION 6: DATA VISUALIZATION
# =====================================================

# Basic plotting
# Scatter plot
x <- 1:10
y <- x ^ 2
plot(x, y, main = "Simple Scatter Plot", xlab = "X", ylab = "Y",
     col = "blue", pch = 19)

# Bar plot
counts <- c(25, 15, 30, 20)
names <- c("A", "B", "C", "D")
barplot(counts, names.arg = names, col = "cyan", main = "Bar Plot Example")

# Histogram
data <- rnorm(100)  # Generate 100 random numbers
hist(data, col = "lightblue", main = "Histogram Example")

# For more advanced visualizations, you can use ggplot2
# install.packages("ggplot2")
# library(ggplot2)

# =====================================================
# SECTION 7: EXERCISES FOR PRACTICE
# =====================================================

# Exercise 1: Create a vector of the first 10 even numbers
# Your code here:
# even_numbers <-

# Exercise 2: Calculate the sum and mean of numbers from 1 to 100
# Your code here:
# sum_result <-
# mean_result <-

# Exercise 3: Create a function that returns both the minimum and maximum of a vector
# Your code here:
# min_max <- function(x) {
#   # Your code here
# }

# Exercise 4: Create a data frame with 5 students, their grades in 3 subjects
# Your code here:
# student_grades <- data.frame(
#   # Your code here
# )

# Exercise 5: Write a function to determine if a number is prime
# Your code here:
# is_prime <- function(n) {
#   # Your code here
# }

# =====================================================
# SECTION 8: DATA IMPORT AND EXPORT
# =====================================================

# 8.1 Reading CSV files
# read.csv() is used to read CSV files
# Example:
# my_data <- read.csv("path/to/your/file.csv")

# 8.2 Reading Excel files
# First, install and load the readxl package
# install.packages("readxl")
# library(readxl)
# my_data <- read_excel("path/to/your/file.xlsx")

# 8.3 Writing data to files
# Write to CSV
# write.csv(my_data, "output.csv", row.names = FALSE)

# Write to Excel
# install.packages("writexl")
# library(writexl)
# write_xlsx(my_data, "output.xlsx")

# =====================================================
# SECTION 9: DATA CLEANING AND PREPROCESSING
# =====================================================

# 9.1 Handling missing values
# Create a sample dataset with missing values
sample_data <- data.frame(
  name = c("Alice", "Bob", "Charlie", NA),
  age = c(25, NA, 30, 35),
  score = c(85, 90, NA, 95)
)

# Check for missing values
is.na(sample_data)
colSums(is.na(sample_data))

# Remove rows with missing values
clean_data <- na.omit(sample_data)

# Replace missing values with mean
sample_data$age[is.na(sample_data$age)] <- mean(sample_data$age, na.rm = TRUE)

# 9.2 String manipulation
# Basic string operations
text <- "Hello, R Programming!"
toupper(text)  # Convert to uppercase
tolower(text)  # Convert to lowercase
nchar(text)    # Count characters
substr(text, 1, 5)  # Extract substring

# 9.3 Date and time operations
# Create date objects
today <- Sys.Date()
now <- Sys.time()

# Format dates
format(today, "%Y-%m-%d")
format(now, "%H:%M:%S")

# =====================================================
# SECTION 10: BASIC STATISTICAL ANALYSIS
# =====================================================

# 10.1 Descriptive statistics
# Create a sample dataset
numbers <- c(10, 15, 20, 25, 30, 35, 40)

# Basic statistics
mean(numbers)
median(numbers)
sd(numbers)
var(numbers)
quantile(numbers)
summary(numbers)

# 10.2 Correlation analysis
# Create two variables
x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 5, 4, 5)

# Calculate correlation
cor(x, y)

# 10.3 Simple linear regression
# Fit a linear model
model <- lm(y ~ x)
summary(model)

# =====================================================
# SECTION 11: DATA VISUALIZATION FUNDAMENTALS
# =====================================================

# 11.1 Basic plots
# Create sample data
x <- 1:10
y <- x^2

# Scatter plot
plot(x, y, main = "Scatter Plot", xlab = "X", ylab = "Y")

# Line plot
plot(x, y, type = "l", main = "Line Plot")

# Bar plot
barplot(y, names.arg = x, main = "Bar Plot")

# Histogram
hist(y, main = "Histogram")

# 11.2 Customizing plots
# Add colors and points
plot(x, y, 
     main = "Customized Plot",
     xlab = "X axis",
     ylab = "Y axis",
     col = "blue",
     pch = 19,  # Solid circle
     cex = 1.5) # Point size

# Add a grid
grid()

# Add a legend
legend("topleft", 
       legend = "Data points",
       col = "blue",
       pch = 19)

# =====================================================
# SECTION 12: WORKING WITH FACTORS
# =====================================================

# 12.1 Creating and manipulating factors
# Create a factor
colors <- factor(c("red", "blue", "red", "green", "blue"))
levels(colors)

# Change factor levels
colors <- factor(colors, levels = c("red", "green", "blue"))

# 12.2 Cross-tabulation
# Create sample data
gender <- factor(c("M", "F", "M", "F", "M"))
education <- factor(c("High", "Low", "High", "High", "Low"))

# Create a contingency table
table(gender, education)

# =====================================================
# SECTION 13: BASIC DATA TRANSFORMATION
# =====================================================

# 13.1 Subsetting and filtering
# Create a sample dataset
data <- data.frame(
  name = c("Alice", "Bob", "Charlie", "David"),
  age = c(25, 30, 35, 40),
  score = c(85, 90, 95, 88)
)

# Subset by condition
young_people <- data[data$age < 35, ]
high_scores <- data[data$score >= 90, ]

# 13.2 Sorting
# Sort by age
sorted_by_age <- data[order(data$age), ]
sorted_by_age_desc <- data[order(-data$age), ]

# 13.3 Aggregating data
# Calculate mean score by age group
data$age_group <- ifelse(data$age < 30, "Young", "Old")
aggregate(score ~ age_group, data = data, FUN = mean)

# =====================================================
# SECTION 14: R MARKDOWN BASICS
# =====================================================

# To create an R Markdown document:
# 1. In RStudio, go to File > New File > R Markdown
# 2. Choose a title and output format
# 3. Click OK

# Basic R Markdown syntax:
# ```{r}
# # This is an R code chunk
# x <- 1:10
# mean(x)
# ```

# # This is a heading
# This is regular text
# *This is italic*
# **This is bold**

# =====================================================
# EXERCISES FOR NEW TOPICS
# =====================================================

# Exercise 1: Data Cleaning
# Create a function that cleans a dataset by:
# - Removing rows with more than 2 missing values
# - Replacing remaining missing values with column means
# - Converting all character columns to factors

# Exercise 2: Data Visualization
# Create a function that generates a comprehensive plot of a dataset:
# - Scatter plot for numeric variables
# - Bar plot for categorical variables
# - Add appropriate labels and title
# - Use different colors for different categories

# Exercise 3: Statistical Analysis
# Create a function that performs basic statistical analysis:
# - Calculate mean, median, standard deviation
# - Perform correlation analysis between numeric variables
# - Create a summary report

# Exercise 4: Data Transformation
# Create a function that transforms a dataset:
# - Convert wide format to long format
# - Create new variables based on existing ones
# - Aggregate data by specified groups

# Exercise 5: R Markdown Report
# Create an R Markdown document that:
# - Imports a dataset
# - Performs basic analysis
# - Creates visualizations
# - Includes explanations and interpretations

# =====================================================
# CONCLUSION
# =====================================================

# This script introduced you to the fundamentals of R programming.
# Practice these concepts by modifying the examples and completing the exercises.
# As you become more comfortable, explore additional topics like:
# - Statistical analysis
# - Machine learning
# - Data manipulation with tidyverse
# - Interactive visualizations
# - R Markdown for reports

# For help on any function, use the ? operator:
# ?mean
# ?data.frame
# ?plot 