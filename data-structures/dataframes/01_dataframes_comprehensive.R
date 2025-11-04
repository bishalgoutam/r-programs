# Data Frames in R
# This script demonstrates R's most important data structure for data analysis
# Covers creation, manipulation, indexing, and real-world applications

# Clear workspace
rm(list = ls())

cat("=== R Data Frames Tutorial ===\n")
cat("Comprehensive guide to data frames - R's primary data analysis structure\n\n")

# =============================================================================
# DATA FRAME BASICS
# =============================================================================

cat("1. DATA FRAME BASICS\n")
cat("===================\n\n")

# Creating a basic data frame
students_df <- data.frame(
  name = c("Alice", "Bob", "Charlie", "Diana", "Eve"),
  age = c(20, 21, 19, 22, 20),
  major = c("Computer Science", "Mathematics", "Physics", "Biology", "Chemistry"),
  gpa = c(3.8, 3.6, 3.9, 3.7, 3.5),
  graduated = c(FALSE, FALSE, FALSE, TRUE, FALSE),
  stringsAsFactors = FALSE  # Keep strings as characters, not factors
)

cat("Basic data frame:\n")
print(students_df)
cat("\n")

# Data frame properties
cat("Data frame properties:\n")
cat("Dimensions:", dim(students_df), "\n")
cat("Number of rows:", nrow(students_df), "\n")
cat("Number of columns:", ncol(students_df), "\n")
cat("Column names:", colnames(students_df), "\n")
cat("Row names:", rownames(students_df), "\n")
cat("Class:", class(students_df), "\n\n")

# Structure and summary
cat("Data frame structure:\n")
str(students_df)
cat("\nData frame summary:\n")
print(summary(students_df))
cat("\n")

# =============================================================================
# DATA FRAME CREATION METHODS
# =============================================================================

cat("2. DATA FRAME CREATION METHODS\n")
cat("==============================\n\n")

# Method 1: From vectors
names <- c("Apple", "Banana", "Orange", "Grape")
prices <- c(1.20, 0.80, 1.50, 2.00)
colors <- c("Red", "Yellow", "Orange", "Purple")
in_stock <- c(TRUE, TRUE, FALSE, TRUE)

fruits_df <- data.frame(
  name = names,
  price = prices,
  color = colors,
  available = in_stock
)

cat("From vectors:\n")
print(fruits_df)
cat("\n")

# Method 2: From lists
student_list <- list(
  id = 1:4,
  name = c("John", "Jane", "Mike", "Sarah"),
  score = c(85, 92, 78, 90)
)

grades_df <- data.frame(student_list)
cat("From list:\n")
print(grades_df)
cat("\n")

# Method 3: From matrices
matrix_data <- matrix(1:12, nrow = 3, ncol = 4)
colnames(matrix_data) <- c("Q1", "Q2", "Q3", "Q4")
rownames(matrix_data) <- c("Product A", "Product B", "Product C")

sales_df <- as.data.frame(matrix_data)
cat("From matrix:\n")
print(sales_df)
cat("\n")

# Method 4: Empty data frame
empty_df <- data.frame(
  name = character(0),
  age = numeric(0),
  city = character(0)
)

cat("Empty data frame structure:\n")
str(empty_df)
cat("\n")

# Method 5: Reading from built-in datasets
cat("Built-in datasets:\n")
data(mtcars)  # Load built-in dataset
cat("mtcars dataset (first 6 rows):\n")
print(head(mtcars))
cat("\n")

# =============================================================================
# DATA FRAME INDEXING AND SUBSETTING
# =============================================================================

cat("3. DATA FRAME INDEXING AND SUBSETTING\n")
cat("=====================================\n\n")

# Create test data frame
test_df <- data.frame(
  id = 1:8,
  name = c("Alice", "Bob", "Charlie", "Diana", "Eve", "Frank", "Grace", "Henry"),
  department = c("IT", "HR", "IT", "Finance", "IT", "HR", "Finance", "IT"),
  salary = c(75000, 65000, 80000, 70000, 85000, 60000, 72000, 78000),
  years = c(3, 5, 2, 7, 4, 8, 6, 1),
  remote = c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE)
)

cat("Test data frame:\n")
print(test_df)
cat("\n")

# Column access
cat("Column access methods:\n")
cat("Using $: test_df$name =", test_df$name, "\n")
cat("Using []: test_df[, 'salary'] =", test_df[, "salary"], "\n")
cat("Using [[]]: test_df[['department']] =", test_df[["department"]], "\n\n")

# Row access
cat("Row access:\n")
first_row <- test_df[1, ]
cat("First row:\n")
print(first_row)

multiple_rows <- test_df[c(1, 3, 5), ]
cat("Rows 1, 3, 5:\n")
print(multiple_rows)
cat("\n")

# Specific cells
cat("Specific cell access:\n")
cat("Cell [2, 3] (Bob's department):", test_df[2, 3], "\n")
cat("Cell [4, 'salary'] (Diana's salary):", test_df[4, "salary"], "\n\n")

# Multiple columns
selected_cols <- test_df[, c("name", "salary", "years")]
cat("Selected columns (name, salary, years):\n")
print(selected_cols)
cat("\n")

# Conditional subsetting
cat("Conditional subsetting:\n")
it_employees <- test_df[test_df$department == "IT", ]
cat("IT employees:\n")
print(it_employees)

high_earners <- test_df[test_df$salary > 70000, ]
cat("High earners (> $70,000):\n")
print(high_earners)

experienced_remote <- test_df[test_df$years > 3 & test_df$remote == TRUE, ]
cat("Experienced remote workers:\n")
print(experienced_remote)
cat("\n")

# =============================================================================
# DATA FRAME MANIPULATION
# =============================================================================

cat("4. DATA FRAME MANIPULATION\n")
cat("==========================\n\n")

# Adding new columns
test_df$bonus <- test_df$salary * 0.1
test_df$total_compensation <- test_df$salary + test_df$bonus
test_df$experience_level <- ifelse(test_df$years < 3, "Junior", 
                                  ifelse(test_df$years < 6, "Mid", "Senior"))

cat("After adding new columns:\n")
print(test_df[, c("name", "salary", "bonus", "total_compensation", "experience_level")])
cat("\n")

# Modifying existing columns
test_df$salary <- test_df$salary * 1.05  # 5% raise
test_df$department <- toupper(test_df$department)  # Uppercase departments

cat("After modifications (salary increased 5%, departments uppercase):\n")
print(test_df[, c("name", "department", "salary")])
cat("\n")

# Removing columns
test_df$bonus <- NULL  # Remove bonus column
test_df_subset <- test_df[, !names(test_df) %in% c("total_compensation")]

cat("After removing bonus column:\n")
cat("Remaining columns:", colnames(test_df), "\n\n")

# Adding new rows
new_employee <- data.frame(
  id = 9,
  name = "Isabel",
  department = "MARKETING",
  salary = 68000,
  years = 2,
  remote = FALSE,
  experience_level = "Junior"
)

expanded_df <- rbind(test_df, new_employee)
cat("After adding new employee:\n")
print(tail(expanded_df, 3))
cat("\n")

# =============================================================================
# DATA FRAME SORTING AND ORDERING
# =============================================================================

cat("5. DATA FRAME SORTING AND ORDERING\n")
cat("==================================\n\n")

# Sort by single column
sorted_by_salary <- test_df[order(test_df$salary), ]
cat("Sorted by salary (ascending):\n")
print(sorted_by_salary[, c("name", "salary")])
cat("\n")

sorted_by_salary_desc <- test_df[order(-test_df$salary), ]
cat("Sorted by salary (descending):\n")
print(sorted_by_salary_desc[, c("name", "salary")])
cat("\n")

# Sort by multiple columns
sorted_multiple <- test_df[order(test_df$department, -test_df$salary), ]
cat("Sorted by department (asc), then salary (desc):\n")
print(sorted_multiple[, c("name", "department", "salary")])
cat("\n")

# Using with() for cleaner syntax
sorted_with <- test_df[with(test_df, order(years, name)), ]
cat("Sorted by years, then name:\n")
print(sorted_with[, c("name", "years")])
cat("\n")

# =============================================================================
# DATA FRAME MERGING AND JOINING
# =============================================================================

cat("6. DATA FRAME MERGING AND JOINING\n")
cat("=================================\n\n")

# Create related data frames
employee_info <- data.frame(
  emp_id = c(1, 2, 3, 4, 5),
  name = c("Alice", "Bob", "Charlie", "Diana", "Eve"),
  department = c("IT", "HR", "IT", "Finance", "IT")
)

salary_info <- data.frame(
  emp_id = c(1, 2, 3, 4, 6),  # Note: 5 missing, 6 extra
  salary = c(75000, 65000, 80000, 70000, 90000),
  start_date = as.Date(c("2021-01-15", "2020-03-10", "2022-06-01", "2019-11-20", "2023-02-14"))
)

cat("Employee info:\n")
print(employee_info)
cat("Salary info:\n")
print(salary_info)
cat("\n")

# Inner join (only matching records)
inner_joined <- merge(employee_info, salary_info, by = "emp_id")
cat("Inner join:\n")
print(inner_joined)
cat("\n")

# Left join (all from left, matching from right)
left_joined <- merge(employee_info, salary_info, by = "emp_id", all.x = TRUE)
cat("Left join:\n")
print(left_joined)
cat("\n")

# Right join (all from right, matching from left)
right_joined <- merge(employee_info, salary_info, by = "emp_id", all.y = TRUE)
cat("Right join:\n")
print(right_joined)
cat("\n")

# Full outer join (all records from both)
full_joined <- merge(employee_info, salary_info, by = "emp_id", all = TRUE)
cat("Full outer join:\n")
print(full_joined)
cat("\n")

# =============================================================================
# DATA FRAME AGGREGATION
# =============================================================================

cat("7. DATA FRAME AGGREGATION\n")
cat("=========================\n\n")

# Create sample data for aggregation
sales_data <- data.frame(
  region = rep(c("North", "South", "East", "West"), each = 6),
  quarter = rep(c("Q1", "Q2", "Q3", "Q4"), times = 6),
  product = rep(c("Product A", "Product B"), times = 12),
  sales = c(120, 135, 150, 140, 110, 125, 130, 145,
           160, 155, 135, 140, 125, 130, 145, 150,
           140, 135, 155, 160, 145, 150, 130, 135)
)

cat("Sales data (first 12 rows):\n")
print(head(sales_data, 12))
cat("\n")

# Aggregate by single variable
region_totals <- aggregate(sales ~ region, data = sales_data, FUN = sum)
cat("Total sales by region:\n")
print(region_totals)
cat("\n")

# Aggregate by multiple variables
region_quarter_avg <- aggregate(sales ~ region + quarter, data = sales_data, FUN = mean)
cat("Average sales by region and quarter:\n")
print(head(region_quarter_avg, 10))
cat("\n")

# Multiple aggregation functions
region_stats <- aggregate(sales ~ region, data = sales_data, 
                         FUN = function(x) c(
                           total = sum(x),
                           average = mean(x),
                           min = min(x),
                           max = max(x)
                         ))
cat("Region statistics:\n")
print(region_stats)
cat("\n")

# Using by() function
cat("Using by() function:\n")
by_result <- by(sales_data$sales, sales_data$region, summary)
print(by_result)
cat("\n")

# =============================================================================
# DATA FRAME WITH FACTORS
# =============================================================================

cat("8. DATA FRAME WITH FACTORS\n")
cat("==========================\n\n")

# Create data frame with factors
survey_data <- data.frame(
  respondent_id = 1:10,
  age_group = factor(c("18-25", "26-35", "36-45", "18-25", "26-35", 
                      "46-55", "36-45", "18-25", "46-55", "26-35"),
                    levels = c("18-25", "26-35", "36-45", "46-55"),
                    ordered = TRUE),
  education = factor(c("High School", "Bachelor", "Master", "High School", "Bachelor",
                      "PhD", "Master", "Bachelor", "PhD", "Master"),
                    levels = c("High School", "Bachelor", "Master", "PhD"),
                    ordered = TRUE),
  satisfaction = factor(c("High", "Medium", "High", "Low", "Medium",
                         "High", "High", "Medium", "High", "Medium"),
                       levels = c("Low", "Medium", "High"),
                       ordered = TRUE),
  score = c(8.5, 7.2, 9.1, 5.5, 6.8, 9.3, 8.7, 7.5, 9.0, 7.8)
)

cat("Survey data with factors:\n")
print(survey_data)
cat("\n")

# Factor summaries
cat("Factor level summaries:\n")
cat("Age groups:\n")
print(table(survey_data$age_group))
cat("Education levels:\n")
print(table(survey_data$education))
cat("Satisfaction levels:\n")
print(table(survey_data$satisfaction))
cat("\n")

# Cross-tabulation
cat("Cross-tabulation (Age Group vs Education):\n")
print(table(survey_data$age_group, survey_data$education))
cat("\n")

# Factor-based aggregation
satisfaction_scores <- aggregate(score ~ satisfaction, data = survey_data, FUN = mean)
cat("Average scores by satisfaction level:\n")
print(satisfaction_scores)
cat("\n")

# =============================================================================
# MISSING DATA HANDLING
# =============================================================================

cat("9. MISSING DATA HANDLING\n")
cat("========================\n\n")

# Create data frame with missing values
incomplete_data <- data.frame(
  id = 1:8,
  name = c("A", "B", "C", "D", "E", "F", "G", "H"),
  value1 = c(10, NA, 30, 40, NA, 60, 70, 80),
  value2 = c(NA, 25, 35, NA, 55, 65, NA, 85),
  category = c("X", "Y", NA, "X", "Y", "X", "Y", NA)
)

cat("Data with missing values:\n")
print(incomplete_data)
cat("\n")

# Identify missing data
cat("Missing data patterns:\n")
cat("Complete cases:", sum(complete.cases(incomplete_data)), "out of", nrow(incomplete_data), "\n")
cat("Missing by column:\n")
print(colSums(is.na(incomplete_data)))
cat("\n")

# Remove rows with any missing values
complete_only <- incomplete_data[complete.cases(incomplete_data), ]
cat("Complete cases only:\n")
print(complete_only)
cat("\n")

# Remove rows with missing values in specific columns
value1_complete <- incomplete_data[!is.na(incomplete_data$value1), ]
cat("Rows with complete value1:\n")
print(value1_complete)
cat("\n")

# Replace missing values
filled_data <- incomplete_data
filled_data$value1[is.na(filled_data$value1)] <- mean(filled_data$value1, na.rm = TRUE)
filled_data$value2[is.na(filled_data$value2)] <- median(filled_data$value2, na.rm = TRUE)
filled_data$category[is.na(filled_data$category)] <- "Unknown"

cat("After filling missing values:\n")
print(filled_data)
cat("\n")

# =============================================================================
# PRACTICAL EXAMPLES
# =============================================================================

cat("10. PRACTICAL EXAMPLES\n")
cat("======================\n\n")

# Example 1: Student Performance Analysis
students <- data.frame(
  student_id = 1:15,
  name = c("Alice", "Bob", "Charlie", "Diana", "Eve", "Frank", "Grace", 
          "Henry", "Iris", "Jack", "Kelly", "Liam", "Mia", "Noah", "Olivia"),
  gender = factor(c("F", "M", "M", "F", "F", "M", "F", "M", "F", "M", 
                   "F", "M", "F", "M", "F")),
  grade_level = factor(c(10, 10, 11, 11, 12, 12, 10, 11, 12, 10, 
                        11, 12, 10, 11, 12)),
  math_score = c(85, 78, 92, 88, 95, 82, 79, 90, 93, 76, 87, 94, 81, 89, 96),
  science_score = c(82, 85, 89, 91, 92, 79, 84, 87, 95, 78, 88, 93, 83, 86, 94),
  english_score = c(88, 82, 85, 94, 89, 85, 91, 83, 92, 80, 90, 87, 86, 88, 93),
  attendance_rate = c(0.95, 0.88, 0.92, 0.97, 0.94, 0.85, 0.91, 0.89, 0.96, 
                     0.83, 0.93, 0.95, 0.87, 0.90, 0.98)
)

# Calculate overall performance
students$average_score <- (students$math_score + students$science_score + students$english_score) / 3
students$performance_level <- cut(students$average_score, 
                                 breaks = c(0, 80, 85, 90, 100),
                                 labels = c("Needs Improvement", "Good", "Very Good", "Excellent"))

cat("Student Performance Analysis:\n")
print(students[, c("name", "grade_level", "average_score", "performance_level")])
cat("\n")

# Performance by grade level
grade_performance <- aggregate(cbind(math_score, science_score, english_score, average_score) ~ grade_level, 
                              data = students, FUN = mean)
cat("Average scores by grade level:\n")
print(round(grade_performance, 1))
cat("\n")

# Gender performance comparison
gender_performance <- aggregate(cbind(math_score, science_score, english_score) ~ gender, 
                               data = students, FUN = mean)
cat("Average scores by gender:\n")
print(round(gender_performance, 1))
cat("\n")

# Top performers
top_students <- students[order(-students$average_score), ][1:5, c("name", "grade_level", "average_score")]
cat("Top 5 students:\n")
print(top_students)
cat("\n")

# Example 2: Sales Analysis
monthly_sales <- data.frame(
  month = factor(month.abb, levels = month.abb, ordered = TRUE),
  region = rep(c("North", "South", "East", "West"), each = 3),
  sales_2023 = c(150, 145, 160, 135, 140, 155, 125, 130, 145, 140, 135, 150,
                165, 170, 180, 155, 160, 175, 145, 150, 165, 160, 155, 170,
                175, 180, 195, 170, 175, 190, 165, 170, 185, 180, 175, 190),
  sales_2024 = c(165, 160, 175, 150, 155, 170, 140, 145, 160, 155, 150, 165,
                180, 185, 195, 170, 175, 190, 160, 165, 180, 175, 170, 185,
                190, 195, 210, 185, 190, 205, 180, 185, 200, 195, 190, 205)
)

# Calculate growth
monthly_sales$growth <- ((monthly_sales$sales_2024 - monthly_sales$sales_2023) / monthly_sales$sales_2023) * 100

cat("Sales Growth Analysis (first 12 months):\n")
print(head(monthly_sales, 12))
cat("\n")

# Regional performance
regional_summary <- aggregate(cbind(sales_2023, sales_2024, growth) ~ region, 
                             data = monthly_sales, FUN = mean)
cat("Regional performance summary:\n")
print(round(regional_summary, 1))
cat("\n")

# Best performing months
best_months <- monthly_sales[order(-monthly_sales$growth), ][1:6, c("month", "region", "growth")]
cat("Best performing months (by growth):\n")
print(round(best_months, 1))
cat("\n")

cat("=== Tutorial Complete ===\n")
cat("You've mastered R data frames!\n")
cat("Next: Study advanced data manipulation with dplyr and tidyr packages\n")