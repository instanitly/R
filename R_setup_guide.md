# R Programming Setup Guide

This document provides instructions for setting up your R programming environment and lists additional resources for learning R.

## Installing R and RStudio

### Step 1: Install R
1. Go to the [R Project website](https://www.r-project.org/)
2. Click on "CRAN" under the Download section
3. Select a mirror close to your location
4. Choose your operating system (Windows, macOS, or Linux)
5. Download the latest version of R
6. Run the installer and follow the on-screen instructions

### Step 2: Install RStudio (Recommended IDE)
1. Go to the [RStudio website](https://posit.co/download/rstudio-desktop/)
2. Download the free RStudio Desktop version
3. Run the installer and follow the on-screen instructions

### Step 3: Verify Installation
1. Open RStudio
2. In the console (usually the bottom-left pane), type:
   ```r
   R.version
   ```
3. This should display information about your R installation

## Essential R Packages

Install these useful packages by running the following commands in the R console:

```r
# Basic data manipulation packages
install.packages("tidyverse")  # Collection of data science packages (includes ggplot2, dplyr, tidyr, etc.)
install.packages("data.table") # Fast data manipulation

# Statistics packages
install.packages("psych")      # Psychological statistics functions
install.packages("stats")      # Standard statistical functions

# Visualization packages
install.packages("ggplot2")    # Advanced data visualization
install.packages("plotly")     # Interactive plots

# Reporting packages
install.packages("rmarkdown")  # Dynamic report generation
install.packages("knitr")      # Dynamic report generation

# Machine learning packages
install.packages("caret")      # Classification and regression training
install.packages("randomForest") # Random forest models
```

## RStudio Basics

### Interface Overview
- **Source Editor** (top-left): Where you write and edit R scripts
- **Console** (bottom-left): Where you can run R commands directly
- **Environment/History** (top-right): Shows objects in your workspace
- **Files/Plots/Packages/Help** (bottom-right): Shows files, plots, installed packages, and help documentation

### Useful Keyboard Shortcuts
- Run current line: Ctrl+Enter (Windows/Linux) or Cmd+Enter (Mac)
- Run current script: Ctrl+Shift+Enter (Windows/Linux) or Cmd+Shift+Enter (Mac)
- Save script: Ctrl+S (Windows/Linux) or Cmd+S (Mac)
- Clear console: Ctrl+L (Windows/Linux) or Cmd+L (Mac)
- See keyboard shortcuts: Alt+Shift+K (Windows/Linux) or Option+Shift+K (Mac)

## Recommended Learning Path

1. **Start with the basics**:
   - Complete the provided `intro_to_R.R` script
   - Practice the examples and solve the exercises

2. **Practice data analysis**:
   - Work through the `data_analysis_practice.R` script
   - Modify the examples to analyze different aspects of the datasets

3. **Expand your knowledge**:
   - Learn about data manipulation with dplyr and tidyr
   - Master data visualization with ggplot2
   - Study statistical analysis techniques
   - Explore machine learning with R

## Additional Learning Resources

### Online Courses
- [R for Data Science](https://r4ds.had.co.nz/) - Free online book
- [DataCamp: Introduction to R](https://www.datacamp.com/courses/free-introduction-to-r)
- [Coursera: Data Science Specialization](https://www.coursera.org/specializations/jhu-data-science)
- [edX: Data Science: R Basics](https://www.edx.org/course/data-science-r-basics)

### Books
- "R for Data Science" by Hadley Wickham and Garrett Grolemund
- "The Art of R Programming" by Norman Matloff
- "R Cookbook" by Paul Teetor
- "An Introduction to Statistical Learning" by Gareth James et al.

### Websites
- [RStudio Cheatsheets](https://www.rstudio.com/resources/cheatsheets/)
- [R-bloggers](https://www.r-bloggers.com/)
- [Stack Overflow: R Questions](https://stackoverflow.com/questions/tagged/r)
- [R Documentation](https://www.rdocumentation.org/)

### YouTube Channels
- [StatQuest with Josh Starmer](https://www.youtube.com/c/joshstarmer)
- [Data Science Dojo](https://www.youtube.com/c/Datasciencedojo)
- [MarinStatsLectures](https://www.youtube.com/c/marinstatlectures)

## R Community and Help

- [RStudio Community](https://community.rstudio.com/)
- [R-help mailing list](https://stat.ethz.ch/mailman/listinfo/r-help)
- [#rstats on Twitter](https://twitter.com/hashtag/rstats)

## Troubleshooting Tips

1. **Check your syntax**: R is case-sensitive and requires precise syntax
2. **Read error messages carefully**: They often give clues about what went wrong
3. **Search for errors online**: Most errors have been encountered by others
4. **Create a minimal reproducible example**: Simplify your code to isolate the issue
5. **Use the built-in help**: Type `?function_name` to get documentation

## Next Steps After Basics

1. Learn about data import/export with various file types
2. Study string manipulation with stringr
3. Explore date/time data with lubridate
4. Learn interactive visualization with shiny
5. Practice machine learning techniques
6. Develop skills in reproducible research with R Markdown 