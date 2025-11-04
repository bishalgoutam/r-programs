# Vectors in R
# This script demonstrates R's most fundamental data structure: vectors
# Covers creation, indexing, operations, and practical applications

# Clear workspace
rm(list = ls())

cat("=== R Vectors Tutorial ===\n")
cat("Comprehensive guide to vectors - R's fundamental data structure\n\n")

# =============================================================================
# VECTOR BASICS
# =============================================================================

cat("1. VECTOR BASICS\n")
cat("================\n\n")

# Creating vectors using c() function
numeric_vector <- c(1, 2, 3, 4, 5)
character_vector <- c("apple", "banana", "cherry")
logical_vector <- c(TRUE, FALSE, TRUE, FALSE)
mixed_attempt <- c(1, "two", TRUE)  # Will be coerced to character

cat("Basic vector creation:\n")
cat("Numeric vector:", numeric_vector, "\n")
cat("Character vector:", character_vector, "\n")
cat("Logical vector:", logical_vector, "\n")
cat("Mixed vector (coerced):", mixed_attempt, "- class:", class(mixed_attempt), "\n\n")

# Vector properties
cat("Vector properties:\n")
cat("Length of numeric vector:", length(numeric_vector), "\n")
cat("Class of numeric vector:", class(numeric_vector), "\n")
cat("Type of numeric vector:", typeof(numeric_vector), "\n")
cat("Structure of numeric vector:\n")
str(numeric_vector)
cat("\n")

# Empty vectors
empty_numeric <- numeric(0)
empty_character <- character(0)
empty_logical <- logical(0)

cat("Empty vectors:\n")
cat("Empty numeric:", length(empty_numeric), "elements\n")
cat("Empty character:", length(empty_character), "elements\n")
cat("Empty logical:", length(empty_logical), "elements\n\n")

# =============================================================================
# VECTOR CREATION METHODS
# =============================================================================

cat("2. VECTOR CREATION METHODS\n")
cat("==========================\n\n")

# Sequence creation
seq1 <- 1:10                    # Simple sequence
seq2 <- seq(from = 0, to = 20, by = 2)  # Even numbers
seq3 <- seq(0, 1, length.out = 11)     # 11 values from 0 to 1
seq4 <- seq_along(numeric_vector)       # Indices for existing vector

cat("Sequence creation:\n")
cat("1:10:", seq1, "\n")
cat("Even numbers 0-20:", seq2, "\n")
cat("11 values 0-1:", seq3, "\n")
cat("Indices for numeric_vector:", seq4, "\n\n")

# Repetition
rep1 <- rep(5, times = 4)           # Repeat value
rep2 <- rep(c(1, 2), times = 3)    # Repeat vector
rep3 <- rep(c(1, 2), each = 3)     # Repeat each element
rep4 <- rep(c("A", "B"), length.out = 7)  # Repeat to specific length

cat("Repetition:\n")
cat("rep(5, times = 4):", rep1, "\n")
cat("rep(c(1, 2), times = 3):", rep2, "\n")
cat("rep(c(1, 2), each = 3):", rep3, "\n")
cat("rep(c('A', 'B'), length.out = 7):", rep4, "\n\n")

# Specialized vector creation
zeros <- rep(0, 5)
ones <- rep(1, 5)
random_uniform <- runif(5)      # Random uniform [0,1]
random_normal <- rnorm(5, mean = 10, sd = 2)  # Random normal

cat("Specialized vectors:\n")
cat("Zeros:", zeros, "\n")
cat("Ones:", ones, "\n")
cat("Random uniform:", round(random_uniform, 3), "\n")
cat("Random normal:", round(random_normal, 2), "\n\n")

# Using vector() function
vec_numeric <- vector("numeric", length = 5)
vec_character <- vector("character", length = 3)
vec_logical <- vector("logical", length = 4)

cat("Using vector() function:\n")
cat("Numeric vector:", vec_numeric, "\n")
cat("Character vector:", paste("'", vec_character, "'", sep = "", collapse = " "), "\n")
cat("Logical vector:", vec_logical, "\n\n")

# =============================================================================
# VECTOR INDEXING AND SUBSETTING
# =============================================================================

cat("3. VECTOR INDEXING AND SUBSETTING\n")
cat("=================================\n\n")

# Create test vector
test_vector <- c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100)
cat("Test vector:", test_vector, "\n\n")

# Positive indexing (1-based)
first_element <- test_vector[1]
third_element <- test_vector[3]
multiple_elements <- test_vector[c(1, 3, 5)]
range_elements <- test_vector[2:5]

cat("Positive indexing:\n")
cat("First element [1]:", first_element, "\n")
cat("Third element [3]:", third_element, "\n")
cat("Elements [1,3,5]:", multiple_elements, "\n")
cat("Range [2:5]:", range_elements, "\n\n")

# Negative indexing (exclusion)
exclude_first <- test_vector[-1]
exclude_multiple <- test_vector[-c(1, 3, 5)]
exclude_range <- test_vector[-(2:5)]

cat("Negative indexing (exclusion):\n")
cat("Exclude first [-1]:", exclude_first, "\n")
cat("Exclude multiple [-c(1,3,5)]:", exclude_multiple, "\n")
cat("Exclude range [-(2:5)]:", exclude_range, "\n\n")

# Logical indexing
greater_than_50 <- test_vector > 50
filtered_vector <- test_vector[greater_than_50]
direct_filter <- test_vector[test_vector > 50]
multiple_conditions <- test_vector[test_vector > 30 & test_vector < 80]

cat("Logical indexing:\n")
cat("Mask (> 50):", greater_than_50, "\n")
cat("Filtered (> 50):", filtered_vector, "\n")
cat("Direct filter (> 50):", direct_filter, "\n")
cat("Multiple conditions (30 < x < 80):", multiple_conditions, "\n\n")

# which() function for finding indices
indices_gt_50 <- which(test_vector > 50)
max_index <- which.max(test_vector)
min_index <- which.min(test_vector)

cat("Finding indices:\n")
cat("Indices where > 50:", indices_gt_50, "\n")
cat("Index of maximum:", max_index, "(value:", test_vector[max_index], ")\n")
cat("Index of minimum:", min_index, "(value:", test_vector[min_index], ")\n\n")

# =============================================================================
# NAMED VECTORS
# =============================================================================

cat("4. NAMED VECTORS\n")
cat("===============\n\n")

# Creating named vectors
ages <- c(Alice = 25, Bob = 30, Charlie = 35, Diana = 28)
cat("Named vector (ages):", ages, "\n\n")

# Alternative ways to create named vectors
scores <- c(85, 92, 78, 96)
names(scores) <- c("Math", "Science", "English", "History")
cat("Named after creation:", scores, "\n\n")

# Using setNames()
temperatures <- setNames(c(72, 68, 75, 70), c("Living Room", "Bedroom", "Kitchen", "Office"))
cat("Using setNames():", temperatures, "\n\n")

# Accessing named elements
alice_age <- ages["Alice"]
math_score <- scores["Math"]
multiple_temps <- temperatures[c("Kitchen", "Office")]

cat("Accessing named elements:\n")
cat("Alice's age:", alice_age, "\n")
cat("Math score:", math_score, "\n")
cat("Kitchen & Office temps:", multiple_temps, "\n\n")

# Working with names
all_names <- names(ages)
has_names <- !is.null(names(ages))
remove_names <- unname(ages)

cat("Working with names:\n")
cat("All names:", all_names, "\n")
cat("Has names:", has_names, "\n")
cat("Without names:", remove_names, "\n\n")

# =============================================================================
# VECTOR OPERATIONS
# =============================================================================

cat("5. VECTOR OPERATIONS\n")
cat("===================\n\n")

# Arithmetic operations
vec1 <- c(1, 2, 3, 4, 5)
vec2 <- c(2, 4, 6, 8, 10)

cat("Vectors: vec1 =", vec1, ", vec2 =", vec2, "\n\n")

addition <- vec1 + vec2
subtraction <- vec2 - vec1
multiplication <- vec1 * vec2
division <- vec2 / vec1
power <- vec1 ^ 2

cat("Arithmetic operations:\n")
cat("Addition:", addition, "\n")
cat("Subtraction:", subtraction, "\n")
cat("Multiplication:", multiplication, "\n")
cat("Division:", division, "\n")
cat("Power (vec1^2):", power, "\n\n")

# Scalar operations
scalar_add <- vec1 + 10
scalar_multiply <- vec1 * 3
scalar_divide <- vec1 / 2

cat("Scalar operations:\n")
cat("Add 10:", scalar_add, "\n")
cat("Multiply by 3:", scalar_multiply, "\n")
cat("Divide by 2:", scalar_divide, "\n\n")

# Vector recycling
short_vec <- c(1, 2)
long_vec <- c(10, 20, 30, 40, 50, 60)
recycled_result <- long_vec + short_vec

cat("Vector recycling:\n")
cat("Short vector:", short_vec, "\n")
cat("Long vector:", long_vec, "\n")
cat("Addition result:", recycled_result, "(short vector recycled)\n\n")

# =============================================================================
# STATISTICAL FUNCTIONS
# =============================================================================

cat("6. STATISTICAL FUNCTIONS\n")
cat("========================\n\n")

data <- c(85, 92, 78, 96, 88, 73, 90, 85, 79, 94)
cat("Data:", data, "\n\n")

# Basic statistics
mean_val <- mean(data)
median_val <- median(data)
mode_val <- as.numeric(names(sort(table(data), decreasing = TRUE))[1])
min_val <- min(data)
max_val <- max(data)
range_val <- range(data)
var_val <- var(data)
sd_val <- sd(data)

cat("Descriptive statistics:\n")
cat("Mean:", round(mean_val, 2), "\n")
cat("Median:", median_val, "\n")
cat("Mode:", mode_val, "\n")
cat("Minimum:", min_val, "\n")
cat("Maximum:", max_val, "\n")
cat("Range:", range_val, "\n")
cat("Variance:", round(var_val, 2), "\n")
cat("Standard deviation:", round(sd_val, 2), "\n\n")

# Quantiles and percentiles
quantiles <- quantile(data)
percentiles <- quantile(data, probs = c(0.25, 0.5, 0.75, 0.9))

cat("Quantiles and percentiles:\n")
cat("Quartiles:", quantiles, "\n")
cat("Selected percentiles:", percentiles, "\n\n")

# Summary function
cat("Summary statistics:\n")
print(summary(data))
cat("\n")

# =============================================================================
# VECTOR MANIPULATION
# =============================================================================

cat("7. VECTOR MANIPULATION\n")
cat("======================\n\n")

original <- c(3, 1, 4, 1, 5, 9, 2, 6)
cat("Original vector:", original, "\n\n")

# Sorting
sorted_asc <- sort(original)
sorted_desc <- sort(original, decreasing = TRUE)
sort_indices <- order(original)

cat("Sorting:\n")
cat("Ascending:", sorted_asc, "\n")
cat("Descending:", sorted_desc, "\n")
cat("Sort indices:", sort_indices, "\n")
cat("Verification:", original[sort_indices], "\n\n")

# Reversing
reversed <- rev(original)
cat("Reversed:", reversed, "\n\n")

# Unique values
with_duplicates <- c(1, 2, 2, 3, 3, 3, 4, 4, 4, 4)
unique_values <- unique(with_duplicates)
duplicated_mask <- duplicated(with_duplicates)

cat("Handling duplicates:\n")
cat("With duplicates:", with_duplicates, "\n")
cat("Unique values:", unique_values, "\n")
cat("Duplicated mask:", duplicated_mask, "\n\n")

# Combining vectors
vec_a <- c(1, 2, 3)
vec_b <- c(4, 5, 6)
combined <- c(vec_a, vec_b)
appended <- append(vec_a, vec_b, after = 2)

cat("Combining vectors:\n")
cat("Vector A:", vec_a, "\n")
cat("Vector B:", vec_b, "\n")
cat("Combined:", combined, "\n")
cat("Appended (after position 2):", appended, "\n\n")

# =============================================================================
# MISSING VALUES
# =============================================================================

cat("8. MISSING VALUES\n")
cat("================\n\n")

# Creating vector with missing values
data_with_na <- c(10, 20, NA, 40, 50, NA, 70)
cat("Data with NA:", data_with_na, "\n\n")

# Detecting missing values
is_missing <- is.na(data_with_na)
na_count <- sum(is.na(data_with_na))
complete_cases <- complete.cases(data_with_na)

cat("Missing value detection:\n")
cat("Missing mask:", is_missing, "\n")
cat("Number of NAs:", na_count, "\n")
cat("Complete cases:", complete_cases, "\n\n")

# Handling missing values
remove_na <- data_with_na[!is.na(data_with_na)]
remove_na_alt <- na.omit(data_with_na)
replace_na <- data_with_na
replace_na[is.na(replace_na)] <- mean(remove_na)

cat("Handling missing values:\n")
cat("Remove NA (manual):", remove_na, "\n")
cat("Remove NA (na.omit):", as.vector(remove_na_alt), "\n")
cat("Replace with mean:", replace_na, "\n\n")

# Statistics with missing values
mean_with_na <- mean(data_with_na)  # Returns NA
mean_without_na <- mean(data_with_na, na.rm = TRUE)
sum_without_na <- sum(data_with_na, na.rm = TRUE)

cat("Statistics with NAs:\n")
cat("Mean with NA:", mean_with_na, "\n")
cat("Mean (na.rm = TRUE):", mean_without_na, "\n")
cat("Sum (na.rm = TRUE):", sum_without_na, "\n\n")

# =============================================================================
# PRACTICAL EXAMPLES
# =============================================================================

cat("9. PRACTICAL EXAMPLES\n")
cat("=====================\n\n")

# Example 1: Grade analysis
grades <- c(85, 92, 78, 96, 88, 73, 90, 85, 79, 94)
names(grades) <- paste("Student", 1:length(grades))

cat("Grade Analysis:\n")
cat("Grades:", grades, "\n")
cat("Class average:", round(mean(grades), 1), "\n")
cat("Students above average:", sum(grades > mean(grades)), "\n")
cat("Top 3 students:", names(grades[order(grades, decreasing = TRUE)[1:3]]), "\n")
cat("Passing grade (>= 80):", sum(grades >= 80), "out of", length(grades), "\n\n")

# Example 2: Temperature analysis
temperatures <- c(72, 75, 68, 82, 79, 71, 77, 85, 73, 76, 80, 74)
months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", 
           "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
names(temperatures) <- months

cat("Temperature Analysis (°F):\n")
cat("Annual average:", round(mean(temperatures), 1), "°F\n")
cat("Hottest month:", names(which.max(temperatures)), "(", max(temperatures), "°F)\n")
cat("Coldest month:", names(which.min(temperatures)), "(", min(temperatures), "°F)\n")
cat("Summer months (Jun-Aug):", temperatures[c("Jun", "Jul", "Aug")], "\n")
cat("Above 75°F:", names(temperatures[temperatures > 75]), "\n\n")

# Example 3: Stock price analysis
stock_prices <- c(150.25, 148.30, 152.80, 155.60, 149.90, 
                 153.45, 158.20, 156.75, 161.30, 159.85)
days <- 1:length(stock_prices)

cat("Stock Price Analysis:\n")
cat("Prices:", stock_prices, "\n")
cat("Opening price:", stock_prices[1], "\n")
cat("Closing price:", stock_prices[length(stock_prices)], "\n")
cat("Total return:", round(((stock_prices[length(stock_prices)] / stock_prices[1]) - 1) * 100, 2), "%\n")
cat("Highest price:", max(stock_prices), "\n")
cat("Lowest price:", min(stock_prices), "\n")
cat("Average price:", round(mean(stock_prices), 2), "\n")
cat("Days above $155:", sum(stock_prices > 155), "\n\n")

# Example 4: Survey responses
responses <- c("Agree", "Disagree", "Neutral", "Agree", "Strongly Agree",
              "Disagree", "Agree", "Neutral", "Strongly Agree", "Agree")

cat("Survey Response Analysis:\n")
cat("Responses:", responses, "\n")

response_counts <- table(responses)
cat("Response counts:\n")
print(response_counts)

most_common <- names(which.max(response_counts))
cat("Most common response:", most_common, "\n")
cat("Agreement rate:", round(sum(responses %in% c("Agree", "Strongly Agree")) / length(responses) * 100, 1), "%\n\n")

cat("=== Tutorial Complete ===\n")
cat("You've mastered R vectors!\n")
cat("Next: Study matrices and arrays for multi-dimensional data\n")