# =====================================================
# ADVANCED R PRACTICES AND EXAMPLES
# =====================================================

# =====================================================
# SECTION 1: ADVANCED DATA MANIPULATION
# =====================================================

# 1.1 Complex Data Transformations
# Example: Analyzing customer purchase patterns
library(tidyverse)
library(lubridate)

# Create sample customer data
customer_data <- tibble(
  customer_id = rep(1:5, each = 3),
  purchase_date = as.Date(c(
    "2024-01-15", "2024-02-20", "2024-03-25",
    "2024-01-10", "2024-02-15", "2024-03-20",
    "2024-01-05", "2024-02-10", "2024-03-15",
    "2024-01-20", "2024-02-25", "2024-03-30",
    "2024-01-25", "2024-03-01", "2024-03-31"
  )),
  amount = c(100, 150, 200, 80, 120, 180, 90, 130, 170, 110, 140, 190, 95, 125, 175),
  category = rep(c("Electronics", "Clothing", "Food"), 5)
)

# Advanced data transformation
customer_analysis <- customer_data %>%
  # Group by customer
  group_by(customer_id) %>%
  # Calculate purchase statistics
  mutate(
    purchase_count = n(),
    total_spent = sum(amount),
    avg_purchase = mean(amount),
    days_since_last = as.numeric(max(purchase_date) - min(purchase_date)),
    purchase_frequency = purchase_count / (days_since_last / 30)  # purchases per month
  ) %>%
  # Add purchase rank within customer
  mutate(purchase_rank = rank(purchase_date)) %>%
  # Calculate purchase growth
  mutate(
    purchase_growth = (amount - lag(amount)) / lag(amount) * 100
  ) %>%
  # Add category analysis
  group_by(customer_id, category) %>%
  mutate(
    category_total = sum(amount),
    category_share = category_total / sum(amount) * 100
  ) %>%
  ungroup()

# 1.2 Advanced Data Cleaning
# Example: Cleaning and standardizing customer addresses
address_data <- tibble(
  customer_id = 1:5,
  address = c(
    "123 Main St, New York, NY 10001",
    "456 Oak Ave, Apt 7B, Boston, MA 02108",
    "789 Pine Rd, Suite 100, Chicago, IL 60601",
    "321 Elm St, Unit 5, San Francisco, CA 94105",
    "654 Maple Dr, Floor 3, Seattle, WA 98101"
  )
)

# Clean and standardize addresses
clean_addresses <- address_data %>%
  # Extract components using regex
  mutate(
    street = str_extract(address, "^[^,]+"),
    unit = str_extract(address, "(?:Apt|Suite|Unit|Floor)\\s+[^,]+"),
    city = str_extract(address, "(?<=,\\s)[^,]+(?=,)"),
    state = str_extract(address, "[A-Z]{2}"),
    zip = str_extract(address, "\\d{5}")
  ) %>%
  # Clean up street names
  mutate(
    street = str_to_title(street),
    street = str_replace(street, "St$", "Street"),
    street = str_replace(street, "Ave$", "Avenue"),
    street = str_replace(street, "Rd$", "Road"),
    street = str_replace(street, "Dr$", "Drive")
  )

# =====================================================
# SECTION 2: ADVANCED VISUALIZATION
# =====================================================

# 2.1 Complex Plot Creation
# Example: Creating a publication-ready visualization
library(ggplot2)
library(scales)

# Create sample time series data
time_data <- tibble(
  date = seq.Date(as.Date("2024-01-01"), as.Date("2024-12-31"), by = "month"),
  sales = cumsum(rnorm(12, 1000, 200)),
  profit = sales * 0.3 + rnorm(12, 0, 50),
  customers = cumsum(rnorm(12, 100, 20))
)

# Create a complex visualization
advanced_plot <- ggplot(time_data, aes(x = date)) +
  # Add sales line
  geom_line(aes(y = sales, color = "Sales"), size = 1) +
  # Add profit line
  geom_line(aes(y = profit, color = "Profit"), size = 1) +
  # Add customer points
  geom_point(aes(y = customers * 10, color = "Customers"), size = 3) +
  # Add confidence intervals
  geom_ribbon(aes(ymin = sales - 200, ymax = sales + 200), alpha = 0.2) +
  # Customize scales
  scale_y_continuous(
    name = "Sales and Profit ($)",
    labels = dollar_format(),
    sec.axis = sec_axis(~./10, name = "Number of Customers")
  ) +
  scale_x_date(
    name = "Date",
    date_breaks = "2 months",
    date_labels = "%b %Y"
  ) +
  # Add labels and theme
  labs(
    title = "Business Performance Over Time",
    subtitle = "Monthly sales, profit, and customer growth",
    caption = "Data source: Internal records"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 12),
    axis.title = element_text(size = 10),
    legend.position = "bottom",
    legend.title = element_blank()
  ) +
  scale_color_brewer(palette = "Set1")

# 2.2 Interactive Visualizations
# Example: Creating an interactive plot with plotly
library(plotly)

# Convert ggplot to plotly
interactive_plot <- ggplotly(advanced_plot)

# =====================================================
# SECTION 3: ADVANCED FUNCTION WRITING
# =====================================================

# 3.1 Function Factory
# Example: Creating a function that generates other functions
create_statistic_function <- function(stat_name) {
  function(x, ...) {
    switch(stat_name,
           "mean" = mean(x, ...),
           "median" = median(x, ...),
           "sd" = sd(x, ...),
           stop("Unknown statistic"))
  }
}

# Create specific statistic functions
calculate_mean <- create_statistic_function("mean")
calculate_median <- create_statistic_function("median")
calculate_sd <- create_statistic_function("sd")

# 3.2 Advanced Error Handling
# Example: Creating a robust data processing function
process_data <- function(data, required_cols, optional_cols = NULL) {
  # Input validation
  if (!is.data.frame(data)) {
    stop("Input must be a data frame")
  }
  
  # Check required columns
  missing_cols <- setdiff(required_cols, names(data))
  if (length(missing_cols) > 0) {
    stop("Missing required columns: ", paste(missing_cols, collapse = ", "))
  }
  
  # Process data with error handling
  tryCatch({
    # Basic cleaning
    result <- data %>%
      select(all_of(c(required_cols, optional_cols))) %>%
      na.omit()
    
    # Validate results
    if (nrow(result) == 0) {
      warning("No rows remaining after cleaning")
    }
    
    return(result)
  }, error = function(e) {
    message("Error processing data: ", e$message)
    return(NULL)
  })
}

# =====================================================
# SECTION 4: PERFORMANCE OPTIMIZATION
# =====================================================

# 4.1 Parallel Processing
# Example: Using parallel processing for large computations
library(parallel)
library(doParallel)

# Create a parallel processing function
parallel_process <- function(data, fun, n_cores = detectCores() - 1) {
  # Set up parallel processing
  cl <- makeCluster(n_cores)
  registerDoParallel(cl)
  
  # Process data in parallel
  result <- foreach(i = 1:nrow(data), .combine = rbind) %dopar% {
    fun(data[i, ])
  }
  
  # Clean up
  stopCluster(cl)
  return(result)
}

# 4.2 Memory Optimization
# Example: Efficient data processing with data.table
library(data.table)

# Convert to data.table for efficient processing
dt <- as.data.table(customer_data)

# Efficient operations
dt[, `:=`(
  purchase_count = .N,
  total_spent = sum(amount),
  avg_purchase = mean(amount)
), by = customer_id]

# =====================================================
# SECTION 5: ADVANCED EXERCISES
# =====================================================

# Exercise 1: Data Pipeline
# Create a complete data analysis pipeline that:
# - Imports data from multiple sources
# - Performs complex transformations
# - Handles errors gracefully
# - Creates interactive visualizations
# - Generates a comprehensive report

# Exercise 2: Performance Optimization
# Optimize the following code for large datasets:
# - Use parallel processing
# - Implement memory-efficient operations
# - Add progress tracking
# - Include error handling

# Exercise 3: Advanced Visualization
# Create a dashboard-style visualization that:
# - Shows multiple related plots
# - Includes interactive elements
# - Updates dynamically
# - Handles missing data gracefully

# Exercise 4: Function Development
# Create a package that:
# - Implements complex data processing functions
# - Includes proper documentation
# - Has unit tests
# - Handles edge cases
# - Provides example usage

# =====================================================
# SECTION 6: SOLUTIONS TO EXERCISES
# =====================================================

# Exercise 1 Solution: Data Pipeline
create_data_pipeline <- function(input_files, output_dir) {
  # Create output directory
  dir.create(output_dir, showWarnings = FALSE)
  
  # Process each input file
  results <- map(input_files, function(file) {
    tryCatch({
      # Import data
      data <- read_csv(file)
      
      # Process data
      processed_data <- data %>%
        clean_data() %>%
        transform_data() %>%
        analyze_data()
      
      # Create visualizations
      plots <- create_visualizations(processed_data)
      
      # Generate report
      generate_report(processed_data, plots, output_dir)
      
      return(list(
        success = TRUE,
        file = file,
        data = processed_data
      ))
    }, error = function(e) {
      return(list(
        success = FALSE,
        file = file,
        error = e$message
      ))
    })
  })
  
  return(results)
}

# Exercise 2 Solution: Performance Optimization
optimize_processing <- function(data, fun, n_cores = detectCores() - 1) {
  # Set up parallel processing
  cl <- makeCluster(n_cores)
  registerDoParallel(cl)
  
  # Create progress bar
  pb <- txtProgressBar(max = nrow(data), style = 3)
  
  # Process data in parallel with progress tracking
  result <- foreach(i = 1:nrow(data), .combine = rbind) %dopar% {
    # Update progress
    setTxtProgressBar(pb, i)
    
    # Process row
    tryCatch({
      fun(data[i, ])
    }, error = function(e) {
      warning(sprintf("Error processing row %d: %s", i, e$message))
      NULL
    })
  }
  
  # Clean up
  stopCluster(cl)
  close(pb)
  
  return(result)
}

# Exercise 3 Solution: Advanced Visualization
create_dashboard <- function(data) {
  # Create multiple plots
  plots <- list(
    # Time series plot
    time_plot = ggplot(data, aes(x = date, y = value)) +
      geom_line() +
      theme_minimal(),
    
    # Distribution plot
    dist_plot = ggplot(data, aes(x = value)) +
      geom_histogram() +
      theme_minimal(),
    
    # Scatter plot
    scatter_plot = ggplot(data, aes(x = x, y = y)) +
      geom_point() +
      theme_minimal()
  )
  
  # Combine plots into dashboard
  dashboard <- gridExtra::grid.arrange(
    plots$time_plot,
    plots$dist_plot,
    plots$scatter_plot,
    ncol = 2
  )
  
  return(dashboard)
}

# Exercise 4 Solution: Function Development
#' @title Data Processing Package
#' @description A package for advanced data processing
#' @name dataProcessor
#' @docType package
NULL

#' Process data with advanced features
#' @param data Input data frame
#' @param config Configuration list
#' @return Processed data frame
#' @export
process_data_advanced <- function(data, config) {
  # Input validation
  validate_input(data, config)
  
  # Process data
  result <- data %>%
    clean_data() %>%
    transform_data() %>%
    validate_output()
  
  return(result)
} 