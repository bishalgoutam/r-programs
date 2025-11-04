# Operators in R
# This script demonstrates all types of operators in R
# Covers arithmetic, comparison, logical, assignment, and special operators

# Clear workspace
rm(list = ls())

cat("=== R Operators Tutorial ===\n")
cat("Comprehensive guide to all R operators\n\n")

# =============================================================================
# ARITHMETIC OPERATORS
# =============================================================================

cat("1. ARITHMETIC OPERATORS\n")
cat("=======================\n\n")

# Basic arithmetic operations
a <- 15
b <- 4

addition <- a + b
subtraction <- a - b
multiplication <- a * b
division <- a / b
integer_division <- a %/% b
modulo <- a %% b
exponentiation <- a ^ b

cat("Variables: a =", a, ", b =", b, "\n\n")
cat("Basic arithmetic:\n")
cat("Addition (a + b):", addition, "\n")
cat("Subtraction (a - b):", subtraction, "\n")
cat("Multiplication (a * b):", multiplication, "\n")
cat("Division (a / b):", division, "\n")
cat("Integer division (a %/% b):", integer_division, "\n")
cat("Modulo (a %% b):", modulo, "\n")
cat("Exponentiation (a ^ b):", exponentiation, "\n\n")

# Mathematical functions (technically not operators, but commonly used)
sqrt_result <- sqrt(25)
abs_result <- abs(-10)
log_result <- log(10)
log10_result <- log10(100)
exp_result <- exp(1)

cat("Mathematical functions:\n")
cat("sqrt(25):", sqrt_result, "\n")
cat("abs(-10):", abs_result, "\n")
cat("log(10):", log_result, "\n")
cat("log10(100):", log10_result, "\n")
cat("exp(1):", exp_result, "\n\n")

# Operator precedence
precedence_example1 <- 2 + 3 * 4    # Multiplication first
precedence_example2 <- (2 + 3) * 4  # Parentheses override precedence
precedence_example3 <- 2^3^2         # Right associative

cat("Operator precedence:\n")
cat("2 + 3 * 4 =", precedence_example1, "(multiplication first)\n")
cat("(2 + 3) * 4 =", precedence_example2, "(parentheses override)\n")
cat("2^3^2 =", precedence_example3, "(right associative)\n\n")

# =============================================================================
# COMPARISON OPERATORS
# =============================================================================

cat("2. COMPARISON OPERATORS\n")
cat("=======================\n\n")

x <- 10
y <- 5
z <- 10

cat("Variables: x =", x, ", y =", y, ", z =", z, "\n\n")

# Basic comparisons
equal <- x == z
not_equal <- x != y
less_than <- y < x
less_equal <- y <= x
greater_than <- x > y
greater_equal <- x >= z

cat("Comparison results:\n")
cat("x == z:", equal, "\n")
cat("x != y:", not_equal, "\n")
cat("y < x:", less_than, "\n")
cat("y <= x:", less_equal, "\n")
cat("x > y:", greater_than, "\n")
cat("x >= z:", greater_equal, "\n\n")

# String comparisons
string1 <- "apple"
string2 <- "banana"
string3 <- "apple"

cat("String comparisons:\n")
cat("'apple' == 'apple':", string1 == string3, "\n")
cat("'apple' != 'banana':", string1 != string2, "\n")
cat("'apple' < 'banana':", string1 < string2, "(alphabetical order)\n")
cat("'banana' > 'apple':", string2 > string1, "(alphabetical order)\n\n")

# Floating point comparisons (be careful!)
float1 <- 0.1 + 0.2
float2 <- 0.3

cat("Floating point precision issues:\n")
cat("0.1 + 0.2 =", float1, "\n")
cat("0.3 =", float2, "\n")
cat("(0.1 + 0.2) == 0.3:", float1 == float2, "(FALSE due to precision!)\n")
cat("Better approach: abs((0.1 + 0.2) - 0.3) < 1e-10:", abs(float1 - float2) < 1e-10, "\n\n")

# =============================================================================
# LOGICAL OPERATORS
# =============================================================================

cat("3. LOGICAL OPERATORS\n")
cat("===================\n\n")

# Element-wise logical operators
logical1 <- c(TRUE, FALSE, TRUE)
logical2 <- c(TRUE, TRUE, FALSE)

cat("Vectors: logical1 =", logical1, ", logical2 =", logical2, "\n\n")

# Element-wise AND (&) and OR (|)
and_result <- logical1 & logical2
or_result <- logical1 | logical2
not_result <- !logical1

cat("Element-wise logical operations:\n")
cat("logical1 & logical2:", and_result, "\n")
cat("logical1 | logical2:", or_result, "\n")
cat("!logical1:", not_result, "\n\n")

# Short-circuit logical operators (&& and ||)
# These work only with single values and stop evaluation when result is determined

condition1 <- TRUE
condition2 <- FALSE

short_and <- condition1 && condition2
short_or <- condition1 || condition2

cat("Short-circuit logical operations:\n")
cat("TRUE && FALSE:", short_and, "\n")
cat("TRUE || FALSE:", short_or, "\n\n")

# Practical example of short-circuit evaluation
x <- 5
y <- 0

# This is safe because the second condition won't be evaluated if y == 0
safe_division <- (y != 0) && (x / y > 2)
cat("Safe division check ((y != 0) && (x / y > 2)):", safe_division, "\n\n")

# XOR (exclusive OR)
xor_result <- xor(TRUE, FALSE)
xor_result2 <- xor(TRUE, TRUE)

cat("XOR operations:\n")
cat("xor(TRUE, FALSE):", xor_result, "\n")
cat("xor(TRUE, TRUE):", xor_result2, "\n\n")

# =============================================================================
# ASSIGNMENT OPERATORS
# =============================================================================

cat("4. ASSIGNMENT OPERATORS\n")
cat("=======================\n\n")

# Basic assignment
var1 <- 10
var2 = 20
30 -> var3

cat("Assignment methods:\n")
cat("var1 <- 10:", var1, "\n")
cat("var2 = 20:", var2, "\n")
cat("30 -> var3:", var3, "\n\n")

# Compound assignment (R doesn't have +=, -=, etc., but we can simulate)
num <- 10
cat("Starting value:", num, "\n")

# Manual compound operations
num <- num + 5    # Add 5
cat("After adding 5:", num, "\n")

num <- num * 2    # Multiply by 2
cat("After multiplying by 2:", num, "\n")

num <- num - 8    # Subtract 8
cat("After subtracting 8:", num, "\n")

num <- num / 2    # Divide by 2
cat("After dividing by 2:", num, "\n\n")

# Multiple assignment
a <- b <- c <- 100
cat("Multiple assignment (a <- b <- c <- 100):\n")
cat("a =", a, ", b =", b, ", c =", c, "\n\n")

# =============================================================================
# SPECIAL OPERATORS
# =============================================================================

cat("5. SPECIAL OPERATORS\n")
cat("===================\n\n")

# %in% operator (membership)
values <- c(1, 2, 3, 4, 5)
search_values <- c(2, 6, 4, 8)
membership <- search_values %in% values

cat("Membership operator (%in%):\n")
cat("Values:", values, "\n")
cat("Search values:", search_values, "\n")
cat("Membership results:", membership, "\n\n")

# Matrix multiplication operator (%*%)
matrix1 <- matrix(c(1, 2, 3, 4), nrow = 2)
matrix2 <- matrix(c(5, 6, 7, 8), nrow = 2)
matrix_product <- matrix1 %*% matrix2

cat("Matrix multiplication (%*%):\n")
cat("Matrix 1:\n")
print(matrix1)
cat("Matrix 2:\n")
print(matrix2)
cat("Product:\n")
print(matrix_product)
cat("\n")

# Outer product operator (%o%)
vector1 <- c(1, 2, 3)
vector2 <- c(4, 5)
outer_product <- vector1 %o% vector2

cat("Outer product (%o%):\n")
cat("Vector 1:", vector1, "\n")
cat("Vector 2:", vector2, "\n")
cat("Outer product:\n")
print(outer_product)
cat("\n")

# %% and %/% (modulo and integer division)
dividend <- 17
divisor <- 5
quotient <- dividend %/% divisor
remainder <- dividend %% divisor

cat("Division operators:\n")
cat(dividend, "%/%", divisor, "=", quotient, "(integer division)\n")
cat(dividend, "%%", divisor, "=", remainder, "(modulo)\n")
cat("Verification:", quotient * divisor + remainder, "=", dividend, "\n\n")

# =============================================================================
# OPERATOR FUNCTIONS
# =============================================================================

cat("6. OPERATOR FUNCTIONS\n")
cat("====================\n\n")

# Many operators can be called as functions
func_add <- `+`(5, 3)
func_multiply <- `*`(4, 6)
func_equal <- `==`(10, 10)
func_and <- `&`(TRUE, FALSE)

cat("Operators as functions:\n")
cat("`+`(5, 3):", func_add, "\n")
cat("`*`(4, 6):", func_multiply, "\n")
cat("`==`(10, 10):", func_equal, "\n")
cat("`&`(TRUE, FALSE):", func_and, "\n\n")

# This is useful for functional programming
numbers <- c(1, 2, 3, 4, 5)
squared <- Map(`^`, numbers, 2)  # Square each number
cat("Squaring using Map and ^ operator:", unlist(squared), "\n\n")

# =============================================================================
# VECTORIZED OPERATIONS
# =============================================================================

cat("7. VECTORIZED OPERATIONS\n")
cat("========================\n\n")

# R operators work element-wise on vectors
vec1 <- c(1, 2, 3, 4, 5)
vec2 <- c(2, 3, 4, 5, 6)

cat("Vectors: vec1 =", vec1, ", vec2 =", vec2, "\n\n")

# Arithmetic operations on vectors
vec_add <- vec1 + vec2
vec_multiply <- vec1 * vec2
vec_power <- vec1 ^ 2

cat("Vectorized arithmetic:\n")
cat("vec1 + vec2:", vec_add, "\n")
cat("vec1 * vec2:", vec_multiply, "\n")
cat("vec1 ^ 2:", vec_power, "\n\n")

# Comparison operations on vectors
vec_greater <- vec1 > 3
vec_equal <- vec1 == vec2

cat("Vectorized comparisons:\n")
cat("vec1 > 3:", vec_greater, "\n")
cat("vec1 == vec2:", vec_equal, "\n\n")

# Vector recycling (shorter vector is repeated)
vec_short <- c(1, 2)
vec_long <- c(10, 20, 30, 40)
recycled_result <- vec_long + vec_short

cat("Vector recycling:\n")
cat("Long vector:", vec_long, "\n")
cat("Short vector:", vec_short, "\n")
cat("Addition result:", recycled_result, "(short vector recycled)\n\n")

# =============================================================================
# CONDITIONAL OPERATIONS
# =============================================================================

cat("8. CONDITIONAL OPERATIONS\n")
cat("=========================\n\n")

# ifelse() function for vectorized conditional operations
test_scores <- c(85, 92, 78, 95, 88, 73, 90)
pass_fail <- ifelse(test_scores >= 80, "Pass", "Fail")
grades <- ifelse(test_scores >= 90, "A", 
                ifelse(test_scores >= 80, "B",
                      ifelse(test_scores >= 70, "C", "F")))

cat("Conditional operations:\n")
cat("Test scores:", test_scores, "\n")
cat("Pass/Fail:", pass_fail, "\n")
cat("Letter grades:", grades, "\n\n")

# Using logical operators for filtering
high_scores <- test_scores[test_scores >= 90]
medium_scores <- test_scores[test_scores >= 80 & test_scores < 90]
low_scores <- test_scores[test_scores < 80]

cat("Score filtering:\n")
cat("High scores (>= 90):", high_scores, "\n")
cat("Medium scores (80-89):", medium_scores, "\n")
cat("Low scores (< 80):", low_scores, "\n\n")

# =============================================================================
# PRACTICAL EXAMPLES
# =============================================================================

cat("9. PRACTICAL EXAMPLES\n")
cat("=====================\n\n")

# Example 1: BMI Calculator
height_m <- c(1.75, 1.68, 1.82, 1.65, 1.90)
weight_kg <- c(70, 65, 85, 60, 95)
bmi <- weight_kg / (height_m ^ 2)
bmi_category <- ifelse(bmi < 18.5, "Underweight",
                      ifelse(bmi < 25, "Normal",
                            ifelse(bmi < 30, "Overweight", "Obese")))

cat("BMI Calculator:\n")
cat("Heights (m):", height_m, "\n")
cat("Weights (kg):", weight_kg, "\n")
cat("BMI values:", round(bmi, 1), "\n")
cat("Categories:", bmi_category, "\n\n")

# Example 2: Grade Point Average
credits <- c(3, 4, 3, 2, 1)
grades <- c(3.7, 4.0, 3.3, 3.0, 3.7)
total_credits <- sum(credits)
weighted_sum <- sum(credits * grades)
gpa <- weighted_sum / total_credits

cat("GPA Calculation:\n")
cat("Credits:", credits, "\n")
cat("Grades:", grades, "\n")
cat("Total credits:", total_credits, "\n")
cat("Weighted sum:", weighted_sum, "\n")
cat("GPA:", round(gpa, 2), "\n\n")

# Example 3: Financial calculations
principal <- 1000
rate <- 0.05
time <- c(1, 2, 3, 4, 5)
simple_interest <- principal * rate * time
compound_amount <- principal * (1 + rate) ^ time
compound_interest <- compound_amount - principal

cat("Interest Calculations (Principal: $", principal, ", Rate: ", rate * 100, "%):\n", sep = "")
cat("Time (years):", time, "\n")
cat("Simple Interest:", simple_interest, "\n")
cat("Compound Amount:", round(compound_amount, 2), "\n")
cat("Compound Interest:", round(compound_interest, 2), "\n\n")

# Example 4: Data quality checks
data <- c(1, 2, NA, 4, 5, -1, 1000, 3.5)
valid_data <- !is.na(data)
positive_data <- data > 0 & !is.na(data)
reasonable_range <- data >= 0 & data <= 100 & !is.na(data)

cat("Data Quality Checks:\n")
cat("Data:", data, "\n")
cat("Valid (not NA):", valid_data, "\n")
cat("Positive:", positive_data, "\n")
cat("Reasonable range (0-100):", reasonable_range, "\n")
cat("Clean data:", data[reasonable_range], "\n\n")

# =============================================================================
# OPERATOR SUMMARY
# =============================================================================

cat("10. OPERATOR SUMMARY\n")
cat("===================\n\n")

cat("Arithmetic Operators:\n")
cat("  +   Addition\n")
cat("  -   Subtraction\n")
cat("  *   Multiplication\n")
cat("  /   Division\n")
cat("  ^   Exponentiation\n")
cat("  %%  Modulo\n")
cat("  %/% Integer division\n\n")

cat("Comparison Operators:\n")
cat("  ==  Equal to\n")
cat("  !=  Not equal to\n")
cat("  <   Less than\n")
cat("  <=  Less than or equal to\n")
cat("  >   Greater than\n")
cat("  >=  Greater than or equal to\n\n")

cat("Logical Operators:\n")
cat("  &   Element-wise AND\n")
cat("  |   Element-wise OR\n")
cat("  !   NOT\n")
cat("  &&  Scalar AND (short-circuit)\n")
cat("  ||  Scalar OR (short-circuit)\n")
cat("  xor() Exclusive OR\n\n")

cat("Assignment Operators:\n")
cat("  <-  Left assignment (preferred)\n")
cat("  =   Assignment\n")
cat("  ->  Right assignment\n\n")

cat("Special Operators:\n")
cat("  %in%  Membership\n")
cat("  %*%   Matrix multiplication\n")
cat("  %o%   Outer product\n\n")

cat("=== Tutorial Complete ===\n")
cat("You've mastered R operators!\n")
cat("Next: Study control structures (if/else, loops)\n")