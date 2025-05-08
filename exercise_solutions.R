# =====================================================
# SOLUTIONS TO EXERCISES FROM intro_to_R.R
# =====================================================

# Note: Try to solve the exercises yourself before looking at these solutions!

# =====================================================
# SECTION 7: EXERCISES FOR PRACTICE - SOLUTIONS
# =====================================================

# Exercise 1: Create a vector of the first 10 even numbers
even_numbers <- seq(2, 20, by = 2)
# Alternative solution:
even_numbers <- 2 * (1:10)
print(even_numbers)

# Exercise 2: Calculate the sum and mean of numbers from 1 to 100
sum_result <- sum(1:100)
mean_result <- mean(1:100)
print(paste("Sum:", sum_result))
print(paste("Mean:", mean_result))

# Exercise 3: Create a function that returns both the minimum and maximum of a vector
min_max <- function(x) {
  # Check if input is a vector
  if (!is.vector(x)) {
    stop("Input must be a vector")
  }
  
  # Return a named list with min and max values
  list(minimum = min(x), maximum = max(x))
}

# Test the function
test_vector <- c(5, 2, 8, 1, 9, 3)
result <- min_max(test_vector)
print(result)

# Exercise 4: Create a data frame with 5 students, their grades in 3 subjects
student_grades <- data.frame(
  name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  math = c(85, 92, 78, 96, 88),
  science = c(92, 88, 75, 90, 95),
  history = c(78, 85, 92, 88, 79)
)

# Calculate average grade for each student
student_grades$average <- rowMeans(student_grades[, c("math", "science", "history")])

# Determine letter grade based on average
student_grades$letter_grade <- ifelse(student_grades$average >= 90, "A",
                                ifelse(student_grades$average >= 80, "B",
                                       ifelse(student_grades$average >= 70, "C",
                                              ifelse(student_grades$average >= 60, "D", "F"))))

print(student_grades)

# Exercise 5: Write a function to determine if a number is prime
is_prime <- function(n) {
  # Handle special cases
  if (n <= 1) FALSE
  else if (n <= 3) TRUE
  else if (n %% 2 == 0 || n %% 3 == 0) FALSE
  else {
    # Check for divisibility by values of form 6k ± 1
    i <- 5
    while (i * i <= n) {
      if (n %% i == 0 || n %% (i + 2) == 0) FALSE
      i <- i + 6
    }
    TRUE
  }
}

# Test the function with a few numbers
test_numbers <- c(2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 17, 19, 23, 29)
for (num in test_numbers) {
  print(paste(num, "is prime:", is_prime(num)))
}

# =====================================================
# BONUS EXERCISES AND SOLUTIONS
# =====================================================

# Bonus Exercise 1: Fibonacci sequence
# Write a function that generates the first n numbers in the Fibonacci sequence
fibonacci <- function(n) {
  if (n <= 0) NULL
  else if (n == 1) 0
  else if (n == 2) c(0, 1)
  else {
    fib <- numeric(n)
    fib[1] <- 0
    fib[2] <- 1
    
    for (i in 3:n) {
      fib[i] <- fib[i - 1] + fib[i - 2]
    }
    
    fib
  }
}

# Test the function
fib_20 <- fibonacci(20)
print(fib_20)

# Bonus Exercise 2: Data Cleaning
# Create a function that takes a vector and replaces outliers with NA
# (Outliers defined as values more than 2 standard deviations from the mean)
remove_outliers <- function(x) {
  mean_x <- mean(x, na.rm = TRUE)
  sd_x <- sd(x, na.rm = TRUE)
  threshold <- 2 * sd_x
  
  # Create a copy of x with outliers replaced by NA
  result <- x
  result[abs(x - mean_x) > threshold] <- NA
  
  result
}

# Test the function
test_data <- c(5, 7, 8, 6, 9, 30, 8, 7, 6, 25, 8)
cleaned_data <- remove_outliers(test_data)
print(paste("Original data:", paste(test_data, collapse = ", ")))
print(paste("Cleaned data:", paste(ifelse(is.na(cleaned_data), "NA", cleaned_data), 
                                   collapse = ", ")))

# Bonus Exercise 3: Monte Carlo Simulation
# Estimate the value of π using Monte Carlo simulation
estimate_pi <- function(n_points = 10000) {
  # Generate random points in the unit square
  x <- runif(n_points, -1, 1)
  y <- runif(n_points, -1, 1)
  
  # Count points inside the unit circle
  inside_circle <- sum(x ^ 2 + y ^ 2 <= 1)
  
  # Estimate π: area of circle = π * r^2, area of square = (2r)^2 = 4r^2
  # So π = 4 * (area of circle/area of square) = 4 * (points inside circle/total points)
  4 * inside_circle / n_points
}

# Test the function with different numbers of points
pi_estimate_1k <- estimate_pi(1000)
pi_estimate_10k <- estimate_pi(10000)
pi_estimate_100k <- estimate_pi(100000)

print(paste("π estimate with 1,000 points:", pi_estimate_1k))
print(paste("π estimate with 10,000 points:", pi_estimate_10k))
print(paste("π estimate with 100,000 points:", pi_estimate_100k))
print(paste("Actual π value:", pi)) 