# R Programming Tutorial

Welcome to the comprehensive R Programming tutorial! This repository contains structured examples and tutorials covering everything from R fundamentals to advanced statistical analysis and data visualization.

## 📚 Table of Contents

### 1. [Fundamentals](./fundamentals/)
- **Variables and Data Types**: Numeric, character, logical, complex types
- **Operators**: Arithmetic, logical, comparison, assignment operators
- **Basic Input/Output**: Reading data, printing results, user interaction
- **Environment Management**: Workspace, packages, help system

### 2. [Data Structures](./data-structures/)
- **Vectors**: Creation, indexing, operations, named vectors
- **Matrices**: 2D data structures, matrix operations, linear algebra
- **Arrays**: Multi-dimensional arrays, array operations
- **Lists**: Heterogeneous data structures, nested lists
- **Data Frames**: Most important structure for data analysis
- **Factors**: Categorical data handling

### 3. [Control Structures](./control-structures/)
- **Conditional Statements**: if/else, ifelse(), switch()
- **Loops**: for, while, repeat loops
- **Apply Functions**: apply(), lapply(), sapply(), mapply()
- **Flow Control**: next, break, return statements

### 4. [Functions](./functions/)
- **Function Basics**: Definition, parameters, return values
- **Advanced Functions**: Default parameters, variable arguments
- **Scope and Environments**: Local vs global variables
- **Anonymous Functions**: Lambda expressions in R
- **Functional Programming**: Higher-order functions

### 5. [Data Manipulation](./data-manipulation/)
- **Base R Methods**: Indexing, subsetting, merging
- **dplyr Package**: filter(), select(), mutate(), arrange(), summarize()
- **tidyr Package**: gather(), spread(), separate(), unite()
- **Data Cleaning**: Handling missing values, duplicates
- **String Manipulation**: stringr package, regular expressions

### 6. [Statistics](./statistics/)
- **Descriptive Statistics**: mean, median, mode, variance, standard deviation
- **Probability Distributions**: Normal, binomial, poisson, t-distribution
- **Hypothesis Testing**: t-tests, chi-square tests, ANOVA
- **Correlation and Regression**: Linear/multiple regression, correlation analysis
- **Advanced Statistics**: Time series, clustering, classification

### 7. [Data Visualization](./visualization/)
- **Base R Graphics**: plot(), hist(), boxplot(), barplot()
- **ggplot2 Package**: Grammar of graphics, layered approach
- **Advanced Plots**: Faceting, themes, custom graphics
- **Interactive Visualizations**: plotly, shiny basics
- **Statistical Graphics**: Diagnostic plots, model visualization

### 8. [Projects](./projects/)
- **Data Analysis Project**: Complete workflow from raw data to insights
- **Statistical Modeling**: Predictive modeling with real datasets
- **Dashboard Creation**: Interactive data dashboard with Shiny
- **Report Generation**: R Markdown for reproducible research
- **Package Development**: Creating and documenting R packages

## 🚀 Getting Started

### Prerequisites
- **R Installation**: Download and install R from [CRAN](https://cran.r-project.org/)
- **RStudio IDE**: Download RStudio from [RStudio.com](https://www.rstudio.com/)
- **Essential Packages**: Install core packages for data science

```r
# Install essential packages
install.packages(c(
  "tidyverse",    # Data manipulation and visualization
  "dplyr",        # Data manipulation
  "ggplot2",      # Data visualization
  "tidyr",        # Data tidying
  "readr",        # Data import
  "stringr",      # String manipulation
  "lubridate",    # Date/time manipulation
  "knitr",        # Dynamic report generation
  "rmarkdown",    # R Markdown documents
  "shiny",        # Interactive web applications
  "plotly",       # Interactive plots
  "DT",           # Interactive tables
  "corrplot",     # Correlation plots
  "randomForest", # Machine learning
  "caret"         # Machine learning framework
))
```

### Setting Up Your Environment

```r
# Check R version
version

# Set working directory
setwd("path/to/your/workspace")

# Load essential libraries
library(tidyverse)
library(dplyr)
library(ggplot2)

# Check installed packages
installed.packages()

# Get help
help(mean)
?lm
```

## 📖 Learning Path

### Beginner (Weeks 1-2)
1. **Fundamentals**: Variables, data types, basic operations
2. **Data Structures**: Vectors, matrices, data frames
3. **Basic Control**: if/else statements, simple loops
4. **Basic Functions**: Built-in functions, simple custom functions

### Intermediate (Weeks 3-4)
1. **Advanced Data Structures**: Lists, factors, complex indexing
2. **Data Manipulation**: dplyr, tidyr for data wrangling
3. **Control Structures**: Advanced loops, apply functions
4. **Statistics**: Descriptive statistics, basic hypothesis testing

### Advanced (Weeks 5-6)
1. **Advanced Statistics**: Regression, ANOVA, model diagnostics
2. **Data Visualization**: ggplot2 mastery, custom themes
3. **Functional Programming**: Advanced functions, environments
4. **Package Development**: Creating and documenting packages

### Expert (Weeks 7-8)
1. **Machine Learning**: Predictive modeling, cross-validation
2. **Interactive Applications**: Shiny dashboards
3. **Reproducible Research**: R Markdown, version control
4. **Performance Optimization**: Profiling, parallel computing

## 🛠️ Development Tools

### RStudio Features
- **Script Editor**: Syntax highlighting, code completion
- **Console**: Interactive R session
- **Environment**: Variable and object inspector
- **Plots**: Integrated plotting viewer
- **Packages**: Package management interface
- **Help**: Integrated documentation

### Useful R Commands
```r
# Environment management
ls()                    # List objects
rm(list = ls())        # Clear workspace
getwd()                # Get working directory
setwd("path")          # Set working directory

# Package management
install.packages("pkg") # Install package
library(pkg)           # Load package
detach("package:pkg")  # Unload package
update.packages()      # Update packages

# Help and documentation
help(function)         # Get help
?function             # Quick help
example(function)     # Show examples
vignette("package")   # Package vignettes
```

## 📊 Sample Projects Overview

### 1. **Exploratory Data Analysis**
- Import and clean real-world datasets
- Generate summary statistics
- Create comprehensive visualizations
- Identify patterns and anomalies

### 2. **Statistical Modeling**
- Linear and logistic regression
- Model validation and diagnostics
- Prediction and forecasting
- Model comparison and selection

### 3. **Data Dashboard**
- Interactive Shiny application
- Real-time data updates
- User controls and filters
- Professional styling

### 4. **Reproducible Research**
- R Markdown documents
- Automated report generation
- Version control integration
- Publication-ready outputs

## 🎯 Key R Concepts

### Data Science Workflow
1. **Import**: Read data from various sources
2. **Tidy**: Structure data for analysis
3. **Transform**: Create new variables, summarize data
4. **Visualize**: Explore data through graphics
5. **Model**: Fit statistical models
6. **Communicate**: Share insights through reports

### R Strengths
- **Statistical Computing**: Built for statistics and data analysis
- **Data Visualization**: Excellent graphics capabilities
- **Package Ecosystem**: Comprehensive CRAN repository
- **Reproducible Research**: R Markdown and knitr
- **Community**: Active and supportive user community

### Best Practices
- **Code Style**: Use consistent naming and formatting
- **Documentation**: Comment your code extensively
- **Version Control**: Use Git for project management
- **Testing**: Write tests for your functions
- **Reproducibility**: Make analyses reproducible

## 📈 Learning Resources

### Official Documentation
- [R Documentation](https://www.r-project.org/other-docs.html)
- [RStudio Cheat Sheets](https://www.rstudio.com/resources/cheatsheets/)
- [CRAN Task Views](https://cran.r-project.org/web/views/)

### Recommended Books
- "R for Data Science" by Hadley Wickham
- "Advanced R" by Hadley Wickham
- "R Graphics Cookbook" by Winston Chang
- "The Art of R Programming" by Norman Matloff

### Online Courses
- R Programming (Johns Hopkins/Coursera)
- Data Science Specialization (Johns Hopkins/Coursera)
- R Programming A-Z (Udemy)
- Introduction to R (DataCamp)

## 🤝 Contributing

Feel free to contribute to this tutorial by:
- Adding new examples
- Improving existing code
- Fixing bugs or errors
- Enhancing documentation
- Suggesting new topics

## 📞 Support

If you have questions or need help:
- Check the documentation in each section
- Review the example code and comments
- Consult the official R documentation
- Ask questions on Stack Overflow with the 'r' tag

## 📝 License

This educational content is open source and available for learning purposes.

---

**Happy Learning with R! 📊✨**

Start your journey with the [fundamentals](./fundamentals/) section and work your way through each topic systematically. Each section builds upon the previous one, providing a comprehensive foundation in R programming and data science.