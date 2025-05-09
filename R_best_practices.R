# =====================================================
# R BEST PRACTICES AND TIDYVERSE STYLE GUIDE
# =====================================================

# =====================================================
# SECTION 1: TIDYVERSE STYLE GUIDE
# =====================================================

# 1.1 Package Management
# Always load packages at the start of your script
library(tidyverse)  # Load core tidyverse packages
library(lubridate)  # For date manipulation
library(stringr)    # For string manipulation
library(forcats)    # For factor manipulation

# 1.2 Naming Conventions
# Use snake_case for variable and function names
user_name <- "John"
calculate_mean <- function(x) mean(x)

# Use descriptive names
# Good:
customer_satisfaction_score <- 4.5
# Bad:
css <- 4.5

# 1.3 Pipe Operator (%>%)
# Use the pipe operator for better readability
# Instead of:
result <- mean(sqrt(abs(c(-4, -1, 0, 1, 4))))

# Use:
result <- c(-4, -1, 0, 1, 4) %>%
  abs() %>%
  sqrt() %>%
  mean()

# =====================================================
# SECTION 2: DATA MANIPULATION BEST PRACTICES
# =====================================================

# 2.1 Data Import
# Use readr functions instead of base R
# Instead of:
# data <- read.csv("file.csv")

# Use:
data <- read_csv("file.csv")

# 2.2 Data Cleaning
# Use dplyr verbs for data manipulation
# Create a sample dataset
sample_data <- tibble(
  name = c("Alice", "Bob", "Charlie"),
  age = c(25, NA, 30),
  score = c(85, 90, NA)
)

# Clean data using dplyr
clean_data <- sample_data %>%
  # Remove rows with missing values
  drop_na() %>%
  # Create new variables
  mutate(
    age_group = case_when(
      age < 30 ~ "Young",
      age >= 30 ~ "Adult"
    ),
    score_category = if_else(score >= 90, "High", "Low")
  ) %>%
  # Select and rename columns
  select(
    student_name = name,
    age,
    score,
    age_group,
    score_category
  )

# 2.3 Data Transformation
# Use tidyr for reshaping data
# Create a wide dataset
wide_data <- tibble(
  id = 1:3,
  test1 = c(85, 90, 95),
  test2 = c(88, 92, 96)
)

# Convert to long format
long_data <- wide_data %>%
  pivot_longer(
    cols = c(test1, test2),
    names_to = "test",
    values_to = "score"
  )

# =====================================================
# SECTION 3: VISUALIZATION BEST PRACTICES
# =====================================================

# 3.1 Use ggplot2 for all visualizations
# Create a sample dataset
plot_data <- tibble(
  x = 1:10,
  y = x^2,
  group = rep(c("A", "B"), each = 5)
)

# Create a plot with proper styling
ggplot(plot_data, aes(x = x, y = y, color = group)) +
  geom_point(size = 3) +
  geom_line() +
  labs(
    title = "Quadratic Relationship",
    subtitle = "By Group",
    x = "X Value",
    y = "Y Value"
  ) +
  theme_minimal() +
  scale_color_brewer(palette = "Set1")

# 3.2 Consistent Theme
# Create a custom theme
my_theme <- theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title = element_text(size = 12),
    legend.position = "bottom"
  )

# =====================================================
# SECTION 4: FUNCTION WRITING BEST PRACTICES
# =====================================================

# 4.1 Function Structure
# Use roxygen2-style documentation
#' Calculate summary statistics for a numeric vector
#'
#' @param x A numeric vector
#' @param na.rm Logical. Should missing values be removed?
#'
#' @return A list containing mean, median, and standard deviation
#' @export
#'
#' @examples
#' calculate_stats(c(1, 2, 3, 4, 5))
calculate_stats <- function(x, na.rm = TRUE) {
  # Input validation
  if (!is.numeric(x)) {
    stop("Input must be numeric")
  }
  
  # Calculate statistics
  stats <- list(
    mean = mean(x, na.rm = na.rm),
    median = median(x, na.rm = na.rm),
    sd = sd(x, na.rm = na.rm)
  )
  
  return(stats)
}

# 4.2 Error Handling
# Use stopifnot() for input validation
validate_input <- function(x, min_length = 1) {
  stopifnot(
    is.numeric(x),
    length(x) >= min_length,
    all(!is.na(x))
  )
}

# =====================================================
# SECTION 5: PROJECT ORGANIZATION
# =====================================================

# 5.1 Directory Structure
# /project
#   /data
#     /raw
#     /processed
#   /R
#     functions.R
#     analysis.R
#   /output
#     /figures
#     /tables
#   /tests
#   README.md
#   .gitignore

# 5.2 Script Organization
# 1. Load required packages
# 2. Define functions
# 3. Import data
# 4. Process data
# 5. Create visualizations
# 6. Generate reports

# =====================================================
# SECTION 6: PERFORMANCE BEST PRACTICES
# =====================================================

# 6.1 Vectorization
# Instead of loops, use vectorized operations
# Bad:
result <- numeric(length(x))
for (i in seq_along(x)) {
  result[i] <- x[i] * 2
}

# Good:
result <- x * 2

# 6.2 Efficient Data Structures
# Use appropriate data structures
# For large datasets, consider data.table
library(data.table)
dt <- as.data.table(iris)
dt[, mean(Sepal.Length), by = Species]

# =====================================================
# SECTION 7: TESTING AND DEBUGGING
# =====================================================

# 7.1 Unit Testing
# Use testthat for unit testing
library(testthat)

test_that("calculate_stats works correctly", {
  x <- c(1, 2, 3, 4, 5)
  result <- calculate_stats(x)
  expect_equal(result$mean, 3)
  expect_equal(result$median, 3)
})

# 7.2 Debugging
# Use browser() for interactive debugging
debug_function <- function(x) {
  browser()  # Execution will pause here
  result <- x * 2
  return(result)
}

# =====================================================
# SECTION 8: DOCUMENTATION
# =====================================================

# 8.1 Code Comments
# Use comments to explain why, not what
# Bad:
# Add 1 to x
x <- x + 1

# Good:
# Adjust for zero-based indexing
x <- x + 1

# 8.2 R Markdown
# Use R Markdown for reproducible reports
# Create a new R Markdown document with:
# ---
# title: "Analysis Report"
# output: html_document
# ---

# =====================================================
# EXERCISES
# =====================================================

# Exercise 1: Code Refactoring
# Refactor the following code using tidyverse principles:
# data <- read.csv("data.csv")
# data$new_col <- data$col1 + data$col2
# data <- data[data$col3 > 0, ]
# mean(data$new_col)

# Exercise 2: Function Writing
# Write a function that follows best practices to:
# - Calculate summary statistics for multiple columns
# - Handle missing values appropriately
# - Include proper documentation
# - Include input validation
# - Return a tidy data frame

# Exercise 3: Visualization
# Create a publication-ready visualization that:
# - Uses appropriate geoms
# - Includes proper labels and titles
# - Uses a consistent theme
# - Handles multiple variables
# - Includes a legend

# Exercise 4: Data Pipeline
# Create a complete data analysis pipeline that:
# - Imports data using readr
# - Cleans data using dplyr
# - Transforms data using tidyr
# - Creates visualizations using ggplot2
# - Generates a report using R Markdown 