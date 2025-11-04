# Variables and Data Types in R
# This script demonstrates R's fundamental data types and variable operations
# R is dynamically typed - variable types are determined at runtime

# Clear workspace
rm(list = ls())

cat("=== R Variables and Data Types Tutorial ===\n")
cat("Comprehensive guide to R's fundamental data types\n\n")

# =============================================================================
# BASIC DATA TYPES
# =============================================================================

cat("1. BASIC DATA TYPES\n")
cat("==================\n\n")

# Numeric (double precision floating point)
numeric_var <- 42.5
integer_var <- 25L        # L suffix for integer
complex_var <- 3 + 4i     # Complex numbers
logical_var <- TRUE       # Logical (boolean)
character_var <- "Hello R"

cat("Numeric variable:", numeric_var, "\n")
cat("Integer variable:", integer_var, "\n")
cat("Complex variable:", complex_var, "\n")
cat("Logical variable:", logical_var, "\n")
cat("Character variable:", character_var, "\n\n")

# Check types using class() and typeof()
cat("Type checking:\n")
cat("class(numeric_var):", class(numeric_var), "\n")
cat("typeof(numeric_var):", typeof(numeric_var), "\n")
cat("class(integer_var):", class(integer_var), "\n")
cat("typeof(integer_var):", typeof(integer_var), "\n")
cat("class(logical_var):", class(logical_var), "\n")
cat("class(character_var):", class(character_var), "\n\n")

# =============================================================================
# NUMERIC DATA TYPES
# =============================================================================

cat("2. NUMERIC DATA TYPES\n")
cat("====================\n\n")

# Different ways to create numeric variables
num1 <- 3.14159
num2 <- 2.71828
scientific_notation <- 1.23e-4
negative_num <- -99.99

cat("Regular numbers:\n")
cat("Pi approximation:", num1, "\n")
cat("Euler's number:", num2, "\n")
cat("Scientific notation:", scientific_notation, "\n")
cat("Negative number:", negative_num, "\n\n")

# Numeric operations
sum_result <- num1 + num2
diff_result <- num1 - num2
product_result <- num1 * num2
quotient_result <- num1 / num2
power_result <- num1^2
modulo_result <- 17 %% 5
integer_division <- 17 %/% 5

cat("Numeric operations:\n")
cat("Sum:", sum_result, "\n")
cat("Difference:", diff_result, "\n")
cat("Product:", product_result, "\n")
cat("Quotient:", quotient_result, "\n")
cat("Power (pi^2):", power_result, "\n")
cat("Modulo (17 %% 5):", modulo_result, "\n")
cat("Integer division (17 %/% 5):", integer_division, "\n\n")

# Special numeric values
infinity_pos <- Inf
infinity_neg <- -Inf
not_a_number <- NaN
missing_value <- NA

cat("Special numeric values:\n")
cat("Positive infinity:", infinity_pos, "\n")
cat("Negative infinity:", infinity_neg, "\n")
cat("Not a Number:", not_a_number, "\n")
cat("Missing value (NA):", missing_value, "\n\n")

# Testing for special values
cat("Testing special values:\n")
cat("is.infinite(Inf):", is.infinite(Inf), "\n")
cat("is.nan(NaN):", is.nan(NaN), "\n")
cat("is.na(NA):", is.na(NA), "\n")
cat("is.finite(42):", is.finite(42), "\n\n")

# =============================================================================
# INTEGER DATA TYPES
# =============================================================================

cat("3. INTEGER DATA TYPES\n")
cat("====================\n\n")

# Creating integers
int1 <- 10L
int2 <- as.integer(15.7)  # Conversion truncates
int3 <- as.integer("25")  # String to integer conversion

cat("Integer variables:\n")
cat("Direct integer:", int1, "- class:", class(int1), "\n")
cat("Converted from double:", int2, "- class:", class(int2), "\n")
cat("Converted from string:", int3, "- class:", class(int3), "\n\n")

# Integer sequences
sequence1 <- 1:10
sequence2 <- seq(from = 0, to = 20, by = 2)
sequence3 <- seq(length.out = 5, from = 1, to = 10)

cat("Integer sequences:\n")
cat("Simple sequence (1:10):", sequence1, "\n")
cat("Even numbers (0 to 20):", sequence2, "\n")
cat("Five values (1 to 10):", sequence3, "\n\n")

# Integer operations
int_sum <- int1 + int2
int_diff <- int2 - int1
int_product <- int1 * 3L

cat("Integer operations:\n")
cat("Sum:", int_sum, "- class:", class(int_sum), "\n")
cat("Difference:", int_diff, "- class:", class(int_diff), "\n")
cat("Product:", int_product, "- class:", class(int_product), "\n\n")

# =============================================================================
# LOGICAL DATA TYPES
# =============================================================================

cat("4. LOGICAL DATA TYPES\n")
cat("====================\n\n")

# Creating logical variables
bool1 <- TRUE
bool2 <- FALSE
bool3 <- T    # Shorthand for TRUE
bool4 <- F    # Shorthand for FALSE

cat("Logical variables:\n")
cat("TRUE:", bool1, "\n")
cat("FALSE:", bool2, "\n")
cat("T (shorthand):", bool3, "\n")
cat("F (shorthand):", bool4, "\n\n")

# Logical operations
and_operation <- TRUE & FALSE
or_operation <- TRUE | FALSE
not_operation <- !TRUE
xor_operation <- xor(TRUE, FALSE)

cat("Logical operations:\n")
cat("TRUE & FALSE:", and_operation, "\n")
cat("TRUE | FALSE:", or_operation, "\n")
cat("!TRUE:", not_operation, "\n")
cat("xor(TRUE, FALSE):", xor_operation, "\n\n")

# Comparison operations (return logical values)
comparison1 <- 5 > 3
comparison2 <- 10 <= 10
comparison3 <- "apple" == "apple"
comparison4 <- 5 != 7

cat("Comparison operations:\n")
cat("5 > 3:", comparison1, "\n")
cat("10 <= 10:", comparison2, "\n")
cat("'apple' == 'apple':", comparison3, "\n")
cat("5 != 7:", comparison4, "\n\n")

# Logical indexing
numbers <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
even_mask <- numbers %% 2 == 0
even_numbers <- numbers[even_mask]

cat("Logical indexing:\n")
cat("Numbers:", numbers, "\n")
cat("Even mask:", even_mask, "\n")
cat("Even numbers:", even_numbers, "\n\n")

# =============================================================================
# CHARACTER DATA TYPES
# =============================================================================

cat("5. CHARACTER DATA TYPES\n")
cat("======================\n\n")

# Creating character variables
string1 <- "Hello, R!"
string2 <- 'Single quotes work too'
string3 <- "Numbers in strings: 123"
empty_string <- ""

cat("Character variables:\n")
cat("Double quotes:", string1, "\n")
cat("Single quotes:", string2, "\n")
cat("Mixed content:", string3, "\n")
cat("Empty string:", paste("'", empty_string, "'", sep = ""), "\n\n")

# String operations
concatenation <- paste("Hello", "World", sep = " ")
concatenation2 <- paste0("No", "Spaces")  # paste0 = paste with sep=""
repetition <- rep("R", 3)
uppercase <- toupper("make me uppercase")
lowercase <- tolower("MAKE ME LOWERCASE")

cat("String operations:\n")
cat("Concatenation:", concatenation, "\n")
cat("No spaces concat:", concatenation2, "\n")
cat("Repetition:", repetition, "\n")
cat("Uppercase:", uppercase, "\n")
cat("Lowercase:", lowercase, "\n\n")

# String properties
string_length <- nchar("Hello R")
substring_result <- substr("Hello R Programming", 1, 5)
position <- regexpr("R", "Hello R Programming")

cat("String properties:\n")
cat("Length of 'Hello R':", string_length, "\n")
cat("Substring (1-5):", substring_result, "\n")
cat("Position of 'R':", position, "\n\n")

# Escape characters
escaped_string <- "Line 1\nLine 2\tTabbed\n\"Quoted\""
cat("Escaped characters:\n")
cat(escaped_string, "\n\n")

# =============================================================================
# COMPLEX DATA TYPES
# =============================================================================

cat("6. COMPLEX DATA TYPES\n")
cat("====================\n\n")

# Creating complex numbers
complex1 <- 3 + 4i
complex2 <- complex(real = 2, imaginary = -1)
complex3 <- as.complex("1+2i")

cat("Complex numbers:\n")
cat("Standard form:", complex1, "\n")
cat("Using complex():", complex2, "\n")
cat("From string:", complex3, "\n\n")

# Complex number operations
complex_sum <- complex1 + complex2
complex_product <- complex1 * complex2
complex_conjugate <- Conj(complex1)
modulus <- Mod(complex1)
argument <- Arg(complex1)

cat("Complex operations:\n")
cat("Sum:", complex_sum, "\n")
cat("Product:", complex_product, "\n")
cat("Conjugate of", complex1, ":", complex_conjugate, "\n")
cat("Modulus:", modulus, "\n")
cat("Argument (radians):", argument, "\n\n")

# Real and imaginary parts
real_part <- Re(complex1)
imaginary_part <- Im(complex1)

cat("Components:\n")
cat("Real part:", real_part, "\n")
cat("Imaginary part:", imaginary_part, "\n\n")

# =============================================================================
# TYPE CONVERSION (COERCION)
# =============================================================================

cat("7. TYPE CONVERSION\n")
cat("=================\n\n")

# Explicit conversion
num_to_char <- as.character(123.45)
char_to_num <- as.numeric("67.89")
num_to_int <- as.integer(45.67)
logical_to_num <- as.numeric(c(TRUE, FALSE, TRUE))
char_to_logical <- as.logical(c("TRUE", "FALSE", "T", "F"))

cat("Explicit conversions:\n")
cat("Number to character:", num_to_char, "- class:", class(num_to_char), "\n")
cat("Character to number:", char_to_num, "- class:", class(char_to_num), "\n")
cat("Number to integer:", num_to_int, "- class:", class(num_to_int), "\n")
cat("Logical to numeric:", logical_to_num, "\n")
cat("Character to logical:", char_to_logical, "\n\n")

# Implicit conversion (coercion)
mixed_vector <- c(1, 2, "three", 4)  # Everything becomes character
cat("Implicit coercion:\n")
cat("Mixed vector:", mixed_vector, "- class:", class(mixed_vector), "\n\n")

# Safe conversion with error handling
safe_conversion <- function(x, target_type) {
  tryCatch({
    switch(target_type,
           "numeric" = as.numeric(x),
           "integer" = as.integer(x),
           "character" = as.character(x),
           "logical" = as.logical(x),
           stop("Unknown target type"))
  }, error = function(e) {
    cat("Conversion error:", e$message, "\n")
    return(NA)
  })
}

cat("Safe conversions:\n")
cat("Valid conversion:", safe_conversion("123", "numeric"), "\n")
cat("Invalid conversion:", safe_conversion("abc", "numeric"), "\n\n")

# =============================================================================
# VARIABLE ASSIGNMENT AND NAMING
# =============================================================================

cat("8. VARIABLE ASSIGNMENT\n")
cat("=====================\n\n")

# Different assignment operators
x <- 10          # Most common
y = 20           # Also valid
30 -> z          # Right to left assignment
assign("w", 40)  # Using assign function

cat("Assignment methods:\n")
cat("x <- 10:", x, "\n")
cat("y = 20:", y, "\n")
cat("30 -> z:", z, "\n")
cat("assign('w', 40):", w, "\n\n")

# Variable naming conventions
camelCase <- "camelCase variable"
snake_case <- "snake_case variable"
PascalCase <- "PascalCase variable"
dot.notation <- "dot.notation variable"

cat("Naming conventions:\n")
cat("camelCase:", camelCase, "\n")
cat("snake_case:", snake_case, "\n")
cat("PascalCase:", PascalCase, "\n")
cat("dot.notation:", dot.notation, "\n\n")

# Multiple assignment
a <- b <- c <- 100
cat("Multiple assignment (a <- b <- c <- 100):\n")
cat("a =", a, ", b =", b, ", c =", c, "\n\n")

# =============================================================================
# WORKING WITH VARIABLES
# =============================================================================

cat("9. WORKING WITH VARIABLES\n")
cat("========================\n\n")

# List all variables in workspace
cat("Variables in workspace:\n")
print(ls())
cat("\n")

# Get information about variables
variable_info <- ls.str()
cat("Variable information:\n")
variable_info

# Check if variable exists
cat("Variable existence:\n")
cat("exists('numeric_var'):", exists("numeric_var"), "\n")
cat("exists('nonexistent'):", exists("nonexistent"), "\n\n")

# Remove specific variables
temp_var <- "temporary"
cat("Before removal - exists('temp_var'):", exists("temp_var"), "\n")
rm(temp_var)
cat("After removal - exists('temp_var'):", exists("temp_var"), "\n\n")

# =============================================================================
# PRACTICAL EXAMPLES
# =============================================================================

cat("10. PRACTICAL EXAMPLES\n")
cat("=====================\n\n")

# Example 1: Temperature conversion
celsius <- 25
fahrenheit <- (celsius * 9/5) + 32
kelvin <- celsius + 273.15

cat("Temperature conversion:\n")
cat(celsius, "°C =", fahrenheit, "°F =", kelvin, "K\n\n")

# Example 2: Personal information storage
name <- "Alice Smith"
age <- 30L
height_cm <- 165.5
is_student <- FALSE
subjects <- c("Math", "Science", "History")

cat("Personal information:\n")
cat("Name:", name, "\n")
cat("Age:", age, "years\n")
cat("Height:", height_cm, "cm\n")
cat("Student status:", is_student, "\n")
cat("Subjects:", paste(subjects, collapse = ", "), "\n\n")

# Example 3: Mathematical calculations
radius <- 5.0
pi_value <- 3.14159
area <- pi_value * radius^2
circumference <- 2 * pi_value * radius

cat("Circle calculations (radius =", radius, "):\n")
cat("Area:", area, "\n")
cat("Circumference:", circumference, "\n\n")

# Example 4: Data validation
user_input <- "25"
age_numeric <- as.numeric(user_input)

if (is.na(age_numeric)) {
  cat("Invalid age input\n")
} else if (age_numeric < 0) {
  cat("Age cannot be negative\n")
} else if (age_numeric > 150) {
  cat("Age seems unrealistic\n")
} else {
  cat("Valid age:", age_numeric, "\n")
}

cat("\n=== Tutorial Complete ===\n")
cat("You've learned about R's fundamental data types!\n")
cat("Next: Study data structures (vectors, matrices, lists)\n")