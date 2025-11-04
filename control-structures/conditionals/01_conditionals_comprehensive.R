# Control Structures: Conditionals in R
# This script demonstrates if-else statements, nested conditions, and vectorized operations
# Covers all forms of conditional logic in R programming

# Clear workspace
rm(list = ls())

cat("=== R Conditionals Tutorial ===\n")
cat("Comprehensive guide to if-else statements and conditional logic\n\n")

# =============================================================================
# BASIC IF STATEMENTS
# =============================================================================

cat("1. BASIC IF STATEMENTS\n")
cat("=====================\n\n")

# Simple if statement
x <- 10

if (x > 5) {
  cat("x is greater than 5\n")
}

# If statement with variable assignment
score <- 85
grade <- "Unknown"

if (score >= 90) {
  grade <- "A"
}

cat("Score:", score, "Grade:", grade, "\n\n")

# Multiple conditions in if
temperature <- 25
humidity <- 70

if (temperature > 20 && humidity < 80) {
  cat("Weather conditions are comfortable\n")
}

if (temperature > 30 || humidity > 90) {
  cat("Weather conditions are extreme\n")
} else {
  cat("Weather conditions are normal\n")
}
cat("\n")

# =============================================================================
# IF-ELSE STATEMENTS
# =============================================================================

cat("2. IF-ELSE STATEMENTS\n")
cat("====================\n\n")

# Basic if-else
age <- 18

if (age >= 18) {
  cat("You are an adult\n")
} else {
  cat("You are a minor\n")
}

# If-else with multiple conditions
income <- 45000

if (income < 30000) {
  tax_rate <- 0.10
  cat("Tax rate: 10%\n")
} else {
  tax_rate <- 0.20
  cat("Tax rate: 20%\n")
}

tax_amount <- income * tax_rate
cat("Income:", income, "Tax:", tax_amount, "\n\n")

# Character comparison
user_input <- "yes"

if (user_input == "yes") {
  cat("User confirmed the action\n")
} else {
  cat("User declined the action\n")
}

# Case-insensitive comparison
user_input_2 <- "YES"

if (tolower(user_input_2) == "yes") {
  cat("User confirmed (case-insensitive)\n")
} else {
  cat("User declined\n")
}
cat("\n")

# =============================================================================
# ELSE IF STATEMENTS
# =============================================================================

cat("3. ELSE IF STATEMENTS\n")
cat("====================\n\n")

# Grade classification
test_score <- 78

if (test_score >= 90) {
  letter_grade <- "A"
} else if (test_score >= 80) {
  letter_grade <- "B"
} else if (test_score >= 70) {
  letter_grade <- "C"
} else if (test_score >= 60) {
  letter_grade <- "D"
} else {
  letter_grade <- "F"
}

cat("Test score:", test_score, "Letter grade:", letter_grade, "\n\n")

# BMI classification
weight <- 70  # kg
height <- 1.75  # meters
bmi <- weight / (height^2)

if (bmi < 18.5) {
  classification <- "Underweight"
} else if (bmi < 25) {
  classification <- "Normal weight"
} else if (bmi < 30) {
  classification <- "Overweight"
} else {
  classification <- "Obese"
}

cat("BMI:", round(bmi, 1), "Classification:", classification, "\n\n")

# Time-based greeting
current_hour <- 14  # 2 PM

if (current_hour < 6) {
  greeting <- "Good night"
} else if (current_hour < 12) {
  greeting <- "Good morning"
} else if (current_hour < 17) {
  greeting <- "Good afternoon"
} else if (current_hour < 22) {
  greeting <- "Good evening"
} else {
  greeting <- "Good night"
}

cat("Hour:", current_hour, "Greeting:", greeting, "\n\n")

# =============================================================================
# NESTED CONDITIONS
# =============================================================================

cat("4. NESTED CONDITIONS\n")
cat("===================\n\n")

# Nested if-else for complex logic
student_score <- 85
attendance <- 0.92  # 92%
has_extra_credit <- TRUE

if (student_score >= 60) {
  cat("Student passed the course\n")
  
  if (attendance >= 0.90) {
    cat("Excellent attendance\n")
    
    if (has_extra_credit) {
      final_grade <- student_score + 5  # Bonus points
      cat("Extra credit applied\n")
    } else {
      final_grade <- student_score
    }
  } else {
    cat("Poor attendance - grade penalty\n")
    final_grade <- student_score - 10
  }
} else {
  cat("Student failed the course\n")
  final_grade <- student_score
}

cat("Final grade:", final_grade, "\n\n")

# Complex business logic
employee_years <- 5
performance_rating <- "Excellent"
department <- "Engineering"

if (employee_years >= 3) {
  if (performance_rating == "Excellent") {
    if (department == "Engineering" || department == "Sales") {
      bonus_percentage <- 0.15
      promotion_eligible <- TRUE
    } else {
      bonus_percentage <- 0.10
      promotion_eligible <- FALSE
    }
  } else if (performance_rating == "Good") {
    bonus_percentage <- 0.08
    promotion_eligible <- FALSE
  } else {
    bonus_percentage <- 0.00
    promotion_eligible <- FALSE
  }
} else {
  bonus_percentage <- 0.05
  promotion_eligible <- FALSE
}

cat("Employee evaluation:\n")
cat("Years:", employee_years, "\n")
cat("Rating:", performance_rating, "\n")
cat("Department:", department, "\n")
cat("Bonus percentage:", bonus_percentage * 100, "%\n")
cat("Promotion eligible:", promotion_eligible, "\n\n")

# =============================================================================
# LOGICAL OPERATORS IN CONDITIONS
# =============================================================================

cat("5. LOGICAL OPERATORS IN CONDITIONS\n")
cat("==================================\n\n")

# AND operator (&&)
username <- "admin"
password <- "secret123"

if (username == "admin" && password == "secret123") {
  cat("Login successful\n")
} else {
  cat("Invalid credentials\n")
}

# OR operator (||)
membership_type <- "Premium"
days_since_purchase <- 5

if (membership_type == "Premium" || days_since_purchase <= 7) {
  cat("Free shipping available\n")
} else {
  cat("Standard shipping charges apply\n")
}

# NOT operator (!)
is_weekend <- FALSE

if (!is_weekend) {
  cat("It's a weekday - office is open\n")
} else {
  cat("It's weekend - office is closed\n")
}
cat("\n")

# Complex logical combinations
temperature_c <- 22
humidity_percent <- 65
is_raining <- FALSE

if ((temperature_c >= 20 && temperature_c <= 25) && 
    (humidity_percent >= 40 && humidity_percent <= 70) && 
    !is_raining) {
  cat("Perfect weather for outdoor activities\n")
} else {
  cat("Weather conditions are not ideal\n")
}
cat("\n")

# =============================================================================
# VECTORIZED CONDITIONS
# =============================================================================

cat("6. VECTORIZED CONDITIONS\n")
cat("=======================\n\n")

# Working with vectors and conditions
scores <- c(85, 92, 78, 96, 73, 88, 91)

# Using ifelse() for vectorized conditions
grades <- ifelse(scores >= 90, "A", 
                ifelse(scores >= 80, "B",
                      ifelse(scores >= 70, "C", "F")))

cat("Scores:", scores, "\n")
cat("Grades:", grades, "\n\n")

# Multiple vectorized conditions
temperatures <- c(15, 25, 35, 10, 40, 20, 30)

weather_desc <- ifelse(temperatures < 10, "Very Cold",
                      ifelse(temperatures < 20, "Cold",
                            ifelse(temperatures < 30, "Warm", "Hot")))

cat("Temperatures:", temperatures, "\n")
cat("Descriptions:", weather_desc, "\n\n")

# Logical indexing with conditions
ages <- c(16, 22, 35, 17, 28, 45, 19)
names <- c("Alice", "Bob", "Charlie", "Diana", "Eve", "Frank", "Grace")

# Find adults (age >= 18)
adults <- names[ages >= 18]
cat("Adults:", adults, "\n")

# Find people in age range 20-40
working_age <- names[ages >= 20 & ages <= 40]
cat("Working age (20-40):", working_age, "\n\n")

# =============================================================================
# SWITCH STATEMENTS
# =============================================================================

cat("7. SWITCH STATEMENTS\n")
cat("===================\n\n")

# Basic switch statement
day_number <- 3

day_name <- switch(day_number,
                  "1" = "Monday",
                  "2" = "Tuesday", 
                  "3" = "Wednesday",
                  "4" = "Thursday",
                  "5" = "Friday",
                  "6" = "Saturday",
                  "7" = "Sunday",
                  "Invalid day")

cat("Day number:", day_number, "Day name:", day_name, "\n\n")

# Switch with character input
operation <- "multiply"
a <- 10
b <- 5

result <- switch(operation,
                "add" = a + b,
                "subtract" = a - b,
                "multiply" = a * b,
                "divide" = a / b,
                "Invalid operation")

cat("Operation:", operation, "Result:", result, "\n\n")

# Switch for grade point calculation
letter_grade <- "B"

grade_points <- switch(letter_grade,
                      "A" = 4.0,
                      "B" = 3.0,
                      "C" = 2.0,
                      "D" = 1.0,
                      "F" = 0.0,
                      NA)

cat("Letter grade:", letter_grade, "Grade points:", grade_points, "\n\n")

# =============================================================================
# PRACTICAL EXAMPLES
# =============================================================================

cat("8. PRACTICAL EXAMPLES\n")
cat("=====================\n\n")

# Example 1: Data Validation System
validate_email <- function(email) {
  if (is.null(email) || is.na(email) || email == "") {
    return("Email is required")
  } else if (!grepl("@", email)) {
    return("Email must contain @ symbol")
  } else if (!grepl("\\.", email)) {
    return("Email must contain a domain")
  } else {
    return("Valid email")
  }
}

test_emails <- c("user@example.com", "invalid-email", "", "user@domain")
cat("Email validation results:\n")
for (email in test_emails) {
  cat(sprintf("'%s': %s\n", email, validate_email(email)))
}
cat("\n")

# Example 2: Financial Calculator
calculate_loan_eligibility <- function(income, credit_score, debt_ratio, employment_years) {
  if (income < 30000) {
    return(list(eligible = FALSE, reason = "Insufficient income"))
  }
  
  if (credit_score < 600) {
    return(list(eligible = FALSE, reason = "Poor credit score"))
  }
  
  if (debt_ratio > 0.4) {
    return(list(eligible = FALSE, reason = "High debt-to-income ratio"))
  }
  
  if (employment_years < 2) {
    return(list(eligible = FALSE, reason = "Insufficient employment history"))
  }
  
  # Determine loan amount based on qualifications
  if (credit_score >= 750 && debt_ratio <= 0.2) {
    max_loan <- income * 5
    interest_rate <- 0.035
  } else if (credit_score >= 700 && debt_ratio <= 0.3) {
    max_loan <- income * 4
    interest_rate <- 0.045
  } else {
    max_loan <- income * 3
    interest_rate <- 0.055
  }
  
  return(list(
    eligible = TRUE,
    max_loan = max_loan,
    interest_rate = interest_rate,
    reason = "Approved"
  ))
}

# Test loan eligibility
applicants <- data.frame(
  name = c("Alice", "Bob", "Charlie", "Diana"),
  income = c(75000, 45000, 25000, 90000),
  credit_score = c(780, 650, 580, 720),
  debt_ratio = c(0.15, 0.35, 0.25, 0.20),
  employment_years = c(5, 3, 1, 7)
)

cat("Loan eligibility results:\n")
for (i in 1:nrow(applicants)) {
  applicant <- applicants[i, ]
  result <- calculate_loan_eligibility(
    applicant$income, 
    applicant$credit_score, 
    applicant$debt_ratio, 
    applicant$employment_years
  )
  
  cat(sprintf("%s: %s", applicant$name, 
              ifelse(result$eligible, 
                     sprintf("Approved - $%s at %.1f%%", 
                            format(result$max_loan, big.mark = ","), 
                            result$interest_rate * 100),
                     paste("Denied -", result$reason))))
  cat("\n")
}
cat("\n")

# Example 3: Student Grade Processing System
process_student_grades <- function(scores, attendance_rate, assignments_completed) {
  # Calculate base grade
  avg_score <- mean(scores, na.rm = TRUE)
  
  # Apply attendance penalty/bonus
  if (attendance_rate < 0.7) {
    attendance_modifier <- -10
  } else if (attendance_rate >= 0.95) {
    attendance_modifier <- 5
  } else {
    attendance_modifier <- 0
  }
  
  # Apply assignment completion penalty/bonus
  assignment_rate <- assignments_completed / 10  # Assuming 10 total assignments
  if (assignment_rate < 0.8) {
    assignment_modifier <- -5
  } else if (assignment_rate == 1.0) {
    assignment_modifier <- 3
  } else {
    assignment_modifier <- 0
  }
  
  # Calculate final grade
  final_grade <- avg_score + attendance_modifier + assignment_modifier
  final_grade <- max(0, min(100, final_grade))  # Ensure grade is between 0-100
  
  # Determine letter grade
  if (final_grade >= 97) {
    letter <- "A+"
  } else if (final_grade >= 93) {
    letter <- "A"
  } else if (final_grade >= 90) {
    letter <- "A-"
  } else if (final_grade >= 87) {
    letter <- "B+"
  } else if (final_grade >= 83) {
    letter <- "B"
  } else if (final_grade >= 80) {
    letter <- "B-"
  } else if (final_grade >= 77) {
    letter <- "C+"
  } else if (final_grade >= 73) {
    letter <- "C"
  } else if (final_grade >= 70) {
    letter <- "C-"
  } else if (final_grade >= 60) {
    letter <- "D"
  } else {
    letter <- "F"
  }
  
  return(list(
    avg_score = round(avg_score, 1),
    attendance_modifier = attendance_modifier,
    assignment_modifier = assignment_modifier,
    final_grade = round(final_grade, 1),
    letter_grade = letter,
    passed = final_grade >= 60
  ))
}

# Test grade processing
students <- list(
  Alice = list(scores = c(88, 92, 85, 90, 87), attendance = 0.98, assignments = 10),
  Bob = list(scores = c(78, 72, 80, 75, 77), attendance = 0.85, assignments = 8),
  Charlie = list(scores = c(95, 88, 92, 90, 94), attendance = 0.65, assignments = 9),
  Diana = list(scores = c(65, 70, 68, 72, 69), attendance = 0.92, assignments = 7)
)

cat("Student grade processing results:\n")
for (student_name in names(students)) {
  student <- students[[student_name]]
  result <- process_student_grades(student$scores, student$attendance, student$assignments)
  
  cat(sprintf("%s:\n", student_name))
  cat(sprintf("  Average Score: %.1f\n", result$avg_score))
  cat(sprintf("  Attendance Modifier: %+d\n", result$attendance_modifier))
  cat(sprintf("  Assignment Modifier: %+d\n", result$assignment_modifier))
  cat(sprintf("  Final Grade: %.1f (%s)\n", result$final_grade, result$letter_grade))
  cat(sprintf("  Status: %s\n", ifelse(result$passed, "PASSED", "FAILED")))
  cat("\n")
}

cat("=== Tutorial Complete ===\n")
cat("You've mastered R conditional statements!\n")
cat("Next: Study loops and iteration for repetitive operations\n")