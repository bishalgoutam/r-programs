# Lists in R
# This script demonstrates R lists - flexible containers for heterogeneous data
# Covers creation, indexing, manipulation, and nested structures

# Clear workspace
rm(list = ls())

cat("=== R Lists Tutorial ===\n")
cat("Comprehensive guide to lists - R's most flexible data structure\n\n")

# =============================================================================
# LIST BASICS
# =============================================================================

cat("1. LIST BASICS\n")
cat("==============\n\n")

# Creating a basic list
basic_list <- list(
  numbers = c(1, 2, 3, 4, 5),
  text = "Hello, R!",
  logical_val = TRUE,
  matrix_data = matrix(1:6, nrow = 2)
)

cat("Basic list:\n")
print(basic_list)
cat("\n")

# List properties
cat("List properties:\n")
cat("Length:", length(basic_list), "\n")
cat("Class:", class(basic_list), "\n")
cat("Mode:", mode(basic_list), "\n")
cat("Names:", names(basic_list), "\n\n")

# Unnamed list
unnamed_list <- list(c(1, 2, 3), "text", TRUE, matrix(1:4, nrow = 2))
cat("Unnamed list:\n")
print(unnamed_list)
cat("\n")

# Mixed data types demonstration
mixed_list <- list(
  integer = 42L,
  double = 3.14159,
  character = "R Programming",
  logical = c(TRUE, FALSE, TRUE),
  factor = factor(c("A", "B", "C")),
  date = Sys.Date(),
  function_obj = mean
)

cat("Mixed data types list:\n")
str(mixed_list)
cat("\n")

# =============================================================================
# LIST CREATION METHODS
# =============================================================================

cat("2. LIST CREATION METHODS\n")
cat("========================\n\n")

# Method 1: Using list() function
method1 <- list(
  name = "John",
  age = 30,
  scores = c(85, 90, 78)
)

# Method 2: From vectors
name_vec <- c("Alice", "Bob", "Charlie")
age_vec <- c(25, 30, 35)
method2 <- list(names = name_vec, ages = age_vec)

# Method 3: From data frame
df <- data.frame(x = 1:3, y = 4:6)
method3 <- list(dataframe = df, summary = "Sample data")

# Method 4: Empty list
empty_list <- list()

cat("Method 1 (direct creation):\n")
print(method1)
cat("\nMethod 2 (from vectors):\n")
print(method2)
cat("\nMethod 3 (with data frame):\n")
str(method3)
cat("\nEmpty list length:", length(empty_list), "\n\n")

# Method 5: Using vector() function
vector_list <- vector("list", length = 3)
names(vector_list) <- c("first", "second", "third")
vector_list$first <- 1:5
vector_list$second <- "Hello"
vector_list$third <- matrix(1:4, nrow = 2)

cat("Created with vector() function:\n")
print(vector_list)
cat("\n")

# =============================================================================
# LIST INDEXING AND ACCESS
# =============================================================================

cat("3. LIST INDEXING AND ACCESS\n")
cat("===========================\n\n")

# Create test list
test_list <- list(
  students = c("Alice", "Bob", "Charlie"),
  grades = c(85, 90, 78),
  info = list(
    course = "R Programming",
    semester = "Fall 2024",
    instructor = "Dr. Smith"
  ),
  matrix_data = matrix(1:9, nrow = 3)
)

cat("Test list structure:\n")
str(test_list)
cat("\n")

# Single bracket indexing (returns list)
cat("Single bracket indexing (returns list):\n")
first_element <- test_list[1]
cat("test_list[1] class:", class(first_element), "\n")
print(first_element)
cat("\n")

# Double bracket indexing (returns actual content)
cat("Double bracket indexing (returns content):\n")
first_content <- test_list[[1]]
cat("test_list[[1]] class:", class(first_content), "\n")
print(first_content)
cat("\n")

# Name-based access
cat("Name-based access:\n")
students_dollar <- test_list$students
students_bracket <- test_list[["students"]]
students_quotes <- test_list["students"]

cat("Using $ (returns content):", students_dollar, "\n")
cat("Using [[]] (returns content):", students_bracket, "\n")
cat("Using [] (returns list):\n")
print(students_quotes)
cat("\n")

# Multiple element access
multiple_elements <- test_list[c("students", "grades")]
cat("Multiple elements:\n")
print(multiple_elements)
cat("\n")

# Accessing nested elements
cat("Accessing nested elements:\n")
course_name <- test_list$info$course
semester_info <- test_list[["info"]][["semester"]]
instructor <- test_list$info["instructor"]

cat("Course name:", course_name, "\n")
cat("Semester:", semester_info, "\n")
cat("Instructor (as list):\n")
print(instructor)
cat("\n")

# =============================================================================
# LIST MANIPULATION
# =============================================================================

cat("4. LIST MANIPULATION\n")
cat("===================\n\n")

# Adding elements
work_list <- list(
  name = "Project Alpha",
  status = "In Progress"
)

cat("Original list:\n")
print(work_list)

# Add using $
work_list$deadline <- "2024-12-31"

# Add using [[]]
work_list[["team_size"]] <- 5

# Add using list index
work_list[[length(work_list) + 1]] <- c("Task 1", "Task 2", "Task 3")
names(work_list)[length(work_list)] <- "tasks"

cat("\nAfter adding elements:\n")
print(work_list)
cat("\n")

# Modifying elements
work_list$status <- "Completed"
work_list$team_size <- work_list$team_size + 2
work_list$tasks <- c(work_list$tasks, "Task 4")

cat("After modifications:\n")
print(work_list)
cat("\n")

# Removing elements
work_list$deadline <- NULL  # Remove using NULL
work_list[["team_size"]] <- NULL  # Remove using NULL

cat("After removing elements:\n")
print(work_list)
cat("\n")

# Removing by index
work_list_copy <- work_list
work_list_copy[2] <- NULL  # Remove second element

cat("After removing by index:\n")
print(work_list_copy)
cat("\n")

# =============================================================================
# NESTED LISTS
# =============================================================================

cat("5. NESTED LISTS\n")
cat("==============\n\n")

# Create complex nested structure
company <- list(
  name = "Tech Corp",
  founded = 2010,
  departments = list(
    IT = list(
      head = "John Smith",
      employees = c("Alice", "Bob", "Charlie"),
      budget = 500000,
      projects = list(
        project1 = list(name = "Web App", status = "Active"),
        project2 = list(name = "Mobile App", status = "Planning")
      )
    ),
    HR = list(
      head = "Jane Doe",
      employees = c("Diana", "Eve"),
      budget = 200000,
      policies = c("Remote Work", "Flexible Hours", "Health Benefits")
    ),
    Finance = list(
      head = "Mike Johnson",
      employees = c("Frank", "Grace"),
      budget = 300000,
      reports = list(
        quarterly = "Q3 Report.pdf",
        annual = "Annual Report 2024.pdf"
      )
    )
  ),
  locations = list(
    headquarters = list(
      address = "123 Tech Street",
      city = "San Francisco",
      country = "USA"
    ),
    branch = list(
      address = "456 Innovation Ave",
      city = "Austin",
      country = "USA"
    )
  )
)

cat("Complex nested list structure:\n")
str(company, max.level = 2)
cat("\n")

# Accessing nested elements
cat("Accessing nested elements:\n")
it_head <- company$departments$IT$head
hr_budget <- company[["departments"]][["HR"]][["budget"]]
project1_status <- company$departments$IT$projects$project1$status

cat("IT Head:", it_head, "\n")
cat("HR Budget:", hr_budget, "\n")
cat("Project 1 Status:", project1_status, "\n\n")

# Deep access with multiple levels
hq_address <- company$locations$headquarters$address
finance_reports <- company$departments$Finance$reports

cat("Headquarters address:", hq_address, "\n")
cat("Finance reports:\n")
print(finance_reports)
cat("\n")

# Modifying nested elements
company$departments$IT$budget <- company$departments$IT$budget * 1.1  # 10% increase
company$departments$IT$projects$project3 <- list(name = "AI System", status = "Research")

cat("After modifying nested elements:\n")
cat("Updated IT budget:", company$departments$IT$budget, "\n")
cat("New project added:\n")
print(company$departments$IT$projects$project3)
cat("\n")

# =============================================================================
# LIST OPERATIONS
# =============================================================================

cat("6. LIST OPERATIONS\n")
cat("=================\n\n")

# Combining lists
list1 <- list(a = 1, b = 2)
list2 <- list(c = 3, d = 4)
list3 <- list(e = 5, f = 6)

# Using c() function
combined_c <- c(list1, list2)
cat("Combined using c():\n")
print(combined_c)
cat("\n")

# Using append() function
combined_append <- append(list1, list2)
cat("Combined using append():\n")
print(combined_append)
cat("\n")

# Combining multiple lists
combined_multiple <- c(list1, list2, list3)
cat("Multiple lists combined:\n")
print(combined_multiple)
cat("\n")

# List comparison
identical_lists <- list(x = 1:3, y = "test")
identical_copy <- list(x = 1:3, y = "test")
different_list <- list(x = 1:3, y = "different")

cat("List comparisons:\n")
cat("identical(identical_lists, identical_copy):", identical(identical_lists, identical_copy), "\n")
cat("identical(identical_lists, different_list):", identical(identical_lists, different_list), "\n\n")

# List element testing
test_elements <- list(num = 42, text = "hello", logical = TRUE)

cat("Element testing:\n")
cat("'num' in names:", "num" %in% names(test_elements), "\n")
cat("'missing' in names:", "missing" %in% names(test_elements), "\n")
cat("Length of 'text' element:", length(test_elements$text), "\n\n")

# =============================================================================
# APPLY FUNCTIONS WITH LISTS
# =============================================================================

cat("7. APPLY FUNCTIONS WITH LISTS\n")
cat("=============================\n\n")

# Create list of numeric vectors
numeric_list <- list(
  group1 = c(10, 15, 20, 25, 30),
  group2 = c(12, 18, 22, 28),
  group3 = c(8, 14, 19, 24, 29, 35),
  group4 = c(11, 16, 21)
)

cat("Numeric list:\n")
print(numeric_list)
cat("\n")

# lapply (returns list)
means_list <- lapply(numeric_list, mean)
cat("Means using lapply (returns list):\n")
print(means_list)
cat("\n")

# sapply (returns vector when possible)
means_vector <- sapply(numeric_list, mean)
cat("Means using sapply (returns vector):\n")
print(means_vector)
cat("\n")

# vapply (type-safe version)
means_vapply <- vapply(numeric_list, mean, FUN.VALUE = numeric(1))
cat("Means using vapply:\n")
print(means_vapply)
cat("\n")

# Multiple statistics
stats_list <- lapply(numeric_list, function(x) {
  c(mean = mean(x), 
    median = median(x), 
    sd = sd(x), 
    length = length(x))
})

cat("Multiple statistics using lapply:\n")
print(stats_list)
cat("\n")

# Using sapply for multiple statistics
stats_matrix <- sapply(numeric_list, function(x) {
  c(mean = mean(x), median = median(x), sd = sd(x))
})

cat("Statistics matrix using sapply:\n")
print(round(stats_matrix, 2))
cat("\n")

# =============================================================================
# LIST CONVERSION
# =============================================================================

cat("8. LIST CONVERSION\n")
cat("=================\n\n")

# List to vector (when possible)
simple_list <- list(a = 1, b = 2, c = 3)
vector_result <- unlist(simple_list)

cat("Original list:\n")
print(simple_list)
cat("Converted to vector:\n")
print(vector_result)
cat("Vector class:", class(vector_result), "\n\n")

# List to data frame (when structure allows)
structured_list <- list(
  name = c("Alice", "Bob", "Charlie"),
  age = c(25, 30, 35),
  salary = c(50000, 60000, 70000)
)

df_from_list <- data.frame(structured_list)
cat("List to data frame:\n")
print(df_from_list)
cat("\n")

# Data frame to list
df_to_list <- as.list(df_from_list)
cat("Data frame back to list:\n")
str(df_to_list)
cat("\n")

# List to matrix (when appropriate)
matrix_list <- list(
  row1 = c(1, 2, 3),
  row2 = c(4, 5, 6),
  row3 = c(7, 8, 9)
)

# Convert to matrix using do.call and rbind
matrix_result <- do.call(rbind, matrix_list)
cat("List to matrix:\n")
print(matrix_result)
cat("\n")

# =============================================================================
# PRACTICAL EXAMPLES
# =============================================================================

cat("9. PRACTICAL EXAMPLES\n")
cat("=====================\n\n")

# Example 1: Student Records System
student_records <- list(
  student_001 = list(
    personal = list(
      name = "Alice Johnson",
      email = "alice.j@university.edu",
      phone = "555-0101"
    ),
    academic = list(
      major = "Computer Science",
      year = 3,
      gpa = 3.85,
      courses = c("Data Structures", "Algorithms", "Database Systems")
    ),
    financial = list(
      tuition_paid = TRUE,
      scholarship = 5000,
      outstanding_balance = 0
    )
  ),
  student_002 = list(
    personal = list(
      name = "Bob Smith",
      email = "bob.s@university.edu",
      phone = "555-0102"
    ),
    academic = list(
      major = "Mathematics",
      year = 2,
      gpa = 3.92,
      courses = c("Calculus III", "Linear Algebra", "Statistics")
    ),
    financial = list(
      tuition_paid = TRUE,
      scholarship = 3000,
      outstanding_balance = 500
    )
  )
)

cat("Student Records System:\n")
# Extract all student names
student_names <- sapply(student_records, function(x) x$personal$name)
cat("All students:", student_names, "\n")

# Extract all GPAs
student_gpas <- sapply(student_records, function(x) x$academic$gpa)
cat("GPAs:", student_gpas, "\n")

# Calculate average GPA
avg_gpa <- mean(student_gpas)
cat("Average GPA:", round(avg_gpa, 2), "\n")

# Find students with outstanding balance
outstanding_balances <- sapply(student_records, function(x) x$financial$outstanding_balance)
students_with_balance <- student_names[outstanding_balances > 0]
cat("Students with outstanding balance:", students_with_balance, "\n\n")

# Example 2: Experimental Data Analysis
experiment_data <- list(
  experiment_A = list(
    conditions = list(
      temperature = 25,
      humidity = 60,
      pressure = 1013
    ),
    measurements = c(12.5, 12.8, 12.3, 12.9, 12.6),
    metadata = list(
      date = "2024-01-15",
      researcher = "Dr. Smith",
      equipment = "Model X-2000"
    )
  ),
  experiment_B = list(
    conditions = list(
      temperature = 30,
      humidity = 55,
      pressure = 1015
    ),
    measurements = c(15.2, 15.5, 15.1, 15.8, 15.3),
    metadata = list(
      date = "2024-01-16",
      researcher = "Dr. Johnson",
      equipment = "Model X-2000"
    )
  ),
  experiment_C = list(
    conditions = list(
      temperature = 35,
      humidity = 50,
      pressure = 1012
    ),
    measurements = c(18.1, 18.4, 18.0, 18.6, 18.2),
    metadata = list(
      date = "2024-01-17",
      researcher = "Dr. Smith",
      equipment = "Model Y-3000"
    )
  )
)

cat("Experimental Data Analysis:\n")

# Calculate summary statistics for each experiment
experiment_summary <- lapply(experiment_data, function(exp) {
  measurements <- exp$measurements
  list(
    mean_value = mean(measurements),
    std_dev = sd(measurements),
    min_value = min(measurements),
    max_value = max(measurements),
    n_measurements = length(measurements),
    temperature = exp$conditions$temperature
  )
})

cat("Experiment summaries:\n")
for(exp_name in names(experiment_summary)) {
  summary <- experiment_summary[[exp_name]]
  cat(sprintf("%s: Mean=%.2f, SD=%.3f, Temp=%d°C\n", 
              exp_name, summary$mean_value, summary$std_dev, summary$temperature))
}
cat("\n")

# Find correlation between temperature and mean values
temperatures <- sapply(experiment_data, function(x) x$conditions$temperature)
mean_values <- sapply(experiment_summary, function(x) x$mean_value)
correlation <- cor(temperatures, mean_values)

cat("Temperature vs Mean Value Correlation:", round(correlation, 3), "\n\n")

# Example 3: Configuration Management
app_config <- list(
  database = list(
    host = "localhost",
    port = 5432,
    name = "myapp_db",
    credentials = list(
      username = "app_user",
      password = "secure_password"
    ),
    pool = list(
      min_connections = 5,
      max_connections = 20,
      timeout = 30
    )
  ),
  api = list(
    base_url = "https://api.myapp.com",
    version = "v2",
    endpoints = list(
      users = "/users",
      orders = "/orders",
      products = "/products"
    ),
    rate_limits = list(
      requests_per_minute = 100,
      burst_limit = 150
    )
  ),
  logging = list(
    level = "INFO",
    file_path = "/var/log/myapp.log",
    max_file_size = "10MB",
    retention_days = 30,
    formats = list(
      console = "%(levelname)s - %(message)s",
      file = "%(asctime)s - %(levelname)s - %(message)s"
    )
  )
)

cat("Configuration Management Example:\n")
cat("Database connection string:", 
    paste0(app_config$database$host, ":", app_config$database$port, "/", app_config$database$name), "\n")
cat("API base URL:", app_config$api$base_url, "\n")
cat("Logging level:", app_config$logging$level, "\n")
cat("Max DB connections:", app_config$database$pool$max_connections, "\n\n")

cat("=== Tutorial Complete ===\n")
cat("You've mastered R lists!\n")
cat("Next: Study control structures and functions for programming logic\n")