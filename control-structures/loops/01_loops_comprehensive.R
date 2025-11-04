# Control Structures: Loops in R
# This script demonstrates for loops, while loops, repeat loops, and apply functions
# Covers all forms of iteration and repetitive operations in R

# Clear workspace
rm(list = ls())

cat("=== R Loops Tutorial ===\n")
cat("Comprehensive guide to loops and iteration in R programming\n\n")

# =============================================================================
# FOR LOOPS
# =============================================================================

cat("1. FOR LOOPS\n")
cat("===========\n\n")

# Basic for loop
cat("Basic for loop (1 to 5):\n")
for (i in 1:5) {
  cat("Iteration:", i, "\n")
}
cat("\n")

# For loop with vector
colors <- c("red", "green", "blue", "yellow")
cat("Loop through vector:\n")
for (color in colors) {
  cat("Color:", color, "\n")
}
cat("\n")

# For loop with calculations
cat("Calculating squares:\n")
squares <- c()
for (i in 1:10) {
  squares[i] <- i^2
  cat(sprintf("%d^2 = %d\n", i, squares[i]))
}
cat("Squares vector:", squares, "\n\n")

# For loop with sequence functions
cat("Using seq() in for loop:\n")
for (x in seq(0, 1, by = 0.2)) {
  cat(sprintf("Value: %.1f, Sine: %.3f\n", x, sin(x)))
}
cat("\n")

# Nested for loops
cat("Nested for loops (multiplication table):\n")
for (i in 1:5) {
  for (j in 1:5) {
    cat(sprintf("%2d", i * j))
  }
  cat("\n")
}
cat("\n")

# For loop with data frame
students <- data.frame(
  name = c("Alice", "Bob", "Charlie"),
  score = c(85, 92, 78),
  grade = c("B", "A", "C")
)

cat("Looping through data frame rows:\n")
for (i in 1:nrow(students)) {
  cat(sprintf("Student %d: %s scored %d (%s)\n", 
              i, students$name[i], students$score[i], students$grade[i]))
}
cat("\n")

# =============================================================================
# WHILE LOOPS
# =============================================================================

cat("2. WHILE LOOPS\n")
cat("=============\n\n")

# Basic while loop
cat("Basic while loop (countdown):\n")
count <- 5
while (count > 0) {
  cat("Count:", count, "\n")
  count <- count - 1
}
cat("Finished!\n\n")

# While loop with user input simulation
cat("Simulating user input validation:\n")
attempts <- 0
max_attempts <- 3
success <- FALSE

# Simulate different passwords
passwords <- c("wrong1", "wrong2", "correct")

while (attempts < max_attempts && !success) {
  attempts <- attempts + 1
  current_password <- passwords[attempts]
  cat(sprintf("Attempt %d: Trying password '%s'\n", attempts, current_password))
  
  if (current_password == "correct") {
    success <- TRUE
    cat("Login successful!\n")
  } else {
    cat("Incorrect password\n")
  }
}

if (!success) {
  cat("Maximum attempts reached. Account locked.\n")
}
cat("\n")

# While loop for mathematical series
cat("Calculating Fibonacci sequence:\n")
fib <- c(1, 1)
while (length(fib) < 10) {
  next_fib <- fib[length(fib)] + fib[length(fib) - 1]
  fib <- c(fib, next_fib)
}
cat("First 10 Fibonacci numbers:", fib, "\n\n")

# While loop with tolerance checking
cat("Finding square root using Newton's method:\n")
target <- 25
guess <- target / 2
tolerance <- 0.001
iterations <- 0

cat(sprintf("Finding square root of %d\n", target))
while (abs(guess^2 - target) > tolerance) {
  iterations <- iterations + 1
  guess <- (guess + target / guess) / 2
  cat(sprintf("Iteration %d: guess = %.6f, error = %.6f\n", 
              iterations, guess, abs(guess^2 - target)))
}
cat(sprintf("Square root found: %.6f in %d iterations\n", guess, iterations))
cat(sprintf("Verification: %.6f^2 = %.6f\n", guess, guess^2))
cat("\n")

# =============================================================================
# REPEAT LOOPS
# =============================================================================

cat("3. REPEAT LOOPS\n")
cat("==============\n\n")

# Basic repeat loop
cat("Basic repeat loop with break:\n")
counter <- 1
repeat {
  cat("Counter:", counter, "\n")
  counter <- counter + 1
  if (counter > 5) {
    break
  }
}
cat("\n")

# Repeat loop for menu simulation
cat("Menu simulation with repeat loop:\n")
menu_choices <- c("1", "2", "3", "4")  # Simulating user choices
choice_index <- 1

repeat {
  # Simulate getting user input
  if (choice_index <= length(menu_choices)) {
    choice <- menu_choices[choice_index]
    choice_index <- choice_index + 1
  } else {
    choice <- "4"  # Exit choice
  }
  
  cat(sprintf("User selected: %s\n", choice))
  
  if (choice == "1") {
    cat("Processing option 1: View data\n")
  } else if (choice == "2") {
    cat("Processing option 2: Add data\n")
  } else if (choice == "3") {
    cat("Processing option 3: Delete data\n")
  } else if (choice == "4") {
    cat("Exiting program\n")
    break
  } else {
    cat("Invalid choice, please try again\n")
  }
}
cat("\n")

# Repeat loop for random number game
cat("Random number guessing game simulation:\n")
target_number <- 7
guesses <- c(3, 9, 5, 7)  # Simulated guesses
guess_index <- 1
attempts <- 0

repeat {
  attempts <- attempts + 1
  current_guess <- guesses[guess_index]
  guess_index <- guess_index + 1
  
  cat(sprintf("Attempt %d: Guessing %d\n", attempts, current_guess))
  
  if (current_guess == target_number) {
    cat(sprintf("Correct! You found the number in %d attempts\n", attempts))
    break
  } else if (current_guess < target_number) {
    cat("Too low!\n")
  } else {
    cat("Too high!\n")
  }
  
  if (guess_index > length(guesses)) {
    cat("No more guesses available\n")
    break
  }
}
cat("\n")

# =============================================================================
# LOOP CONTROL STATEMENTS
# =============================================================================

cat("4. LOOP CONTROL STATEMENTS\n")
cat("==========================\n\n")

# Using next (equivalent to continue)
cat("Using 'next' to skip iterations:\n")
for (i in 1:10) {
  if (i %% 2 == 0) {
    next  # Skip even numbers
  }
  cat("Odd number:", i, "\n")
}
cat("\n")

# Using break to exit early
cat("Using 'break' to exit early:\n")
for (i in 1:20) {
  if (i^2 > 100) {
    cat(sprintf("Breaking at i=%d because %d^2=%d > 100\n", i, i, i^2))
    break
  }
  cat(sprintf("%d^2 = %d\n", i, i^2))
}
cat("\n")

# Complex loop control example
cat("Finding prime numbers with break and next:\n")
primes <- c()
for (n in 2:30) {
  is_prime <- TRUE
  
  # Check if n is divisible by any number from 2 to sqrt(n)
  for (i in 2:floor(sqrt(n))) {
    if (n %% i == 0) {
      is_prime <- FALSE
      break  # Exit inner loop early
    }
  }
  
  if (!is_prime) {
    next  # Skip to next n
  }
  
  primes <- c(primes, n)
  cat("Prime found:", n, "\n")
}
cat("All primes:", primes, "\n\n")

# =============================================================================
# VECTORIZED OPERATIONS (ALTERNATIVES TO LOOPS)
# =============================================================================

cat("5. VECTORIZED OPERATIONS\n")
cat("========================\n\n")

# Vectorized vs loop comparison
numbers <- 1:1000000

# Time vectorized operation
cat("Timing vectorized operation:\n")
start_time <- Sys.time()
vectorized_result <- numbers^2
end_time <- Sys.time()
vectorized_time <- end_time - start_time
cat("Vectorized time:", vectorized_time, "\n")

# Time loop operation (using smaller dataset for demo)
small_numbers <- 1:10000
cat("Timing loop operation (smaller dataset):\n")
start_time <- Sys.time()
loop_result <- rep(0, length(small_numbers))
for (i in 1:length(small_numbers)) {
  loop_result[i] <- small_numbers[i]^2
}
end_time <- Sys.time()
loop_time <- end_time - start_time
cat("Loop time:", loop_time, "\n\n")

# Vectorized mathematical operations
x <- c(1, 4, 9, 16, 25)
y <- c(2, 3, 4, 5, 6)

cat("Vectorized operations:\n")
cat("x:", x, "\n")
cat("y:", y, "\n")
cat("x + y:", x + y, "\n")
cat("x * y:", x * y, "\n")
cat("sqrt(x):", sqrt(x), "\n")
cat("x^y:", x^y, "\n\n")

# Vectorized logical operations
ages <- c(16, 22, 35, 17, 28, 45, 19)
cat("Ages:", ages, "\n")
cat("Adults (>= 18):", ages >= 18, "\n")
cat("Count of adults:", sum(ages >= 18), "\n")
cat("Adult ages:", ages[ages >= 18], "\n\n")

# =============================================================================
# APPLY FAMILY FUNCTIONS
# =============================================================================

cat("6. APPLY FAMILY FUNCTIONS\n")
cat("=========================\n\n")

# lapply - returns list
numbers_list <- list(
  group1 = c(10, 15, 20),
  group2 = c(5, 25, 30, 35),
  group3 = c(12, 18, 22, 28, 32)
)

cat("Using lapply (returns list):\n")
means_list <- lapply(numbers_list, mean)
print(means_list)
cat("\n")

# sapply - returns vector/matrix when possible
cat("Using sapply (returns vector):\n")
means_vector <- sapply(numbers_list, mean)
print(means_vector)
cat("\n")

# Multiple statistics with lapply
cat("Multiple statistics with lapply:\n")
stats_list <- lapply(numbers_list, function(x) {
  c(mean = mean(x), 
    median = median(x), 
    sd = sd(x), 
    min = min(x), 
    max = max(x))
})
print(stats_list)
cat("\n")

# sapply with multiple statistics
cat("Multiple statistics with sapply:\n")
stats_matrix <- sapply(numbers_list, function(x) {
  c(mean = mean(x), median = median(x), sd = sd(x))
})
print(round(stats_matrix, 2))
cat("\n")

# vapply - type-safe version
cat("Using vapply (type-safe):\n")
means_vapply <- vapply(numbers_list, mean, FUN.VALUE = numeric(1))
print(means_vapply)
cat("\n")

# mapply - multiple argument version
cat("Using mapply with multiple arguments:\n")
x_vals <- c(1, 2, 3, 4)
y_vals <- c(2, 3, 4, 5)
z_vals <- c(1, 1, 2, 2)

result <- mapply(function(x, y, z) x + y * z, x_vals, y_vals, z_vals)
cat("x + y * z results:", result, "\n\n")

# apply on matrices
cat("Using apply on matrices:\n")
test_matrix <- matrix(1:12, nrow = 3, ncol = 4)
print(test_matrix)

# Row sums and means
row_sums <- apply(test_matrix, 1, sum)  # 1 = rows
row_means <- apply(test_matrix, 1, mean)

# Column sums and means  
col_sums <- apply(test_matrix, 2, sum)  # 2 = columns
col_means <- apply(test_matrix, 2, mean)

cat("Row sums:", row_sums, "\n")
cat("Row means:", row_means, "\n")
cat("Column sums:", col_sums, "\n")
cat("Column means:", col_means, "\n\n")

# =============================================================================
# PRACTICAL EXAMPLES
# =============================================================================

cat("7. PRACTICAL EXAMPLES\n")
cat("=====================\n\n")

# Example 1: Data Processing Pipeline
cat("Example 1: Data Processing Pipeline\n")
raw_data <- data.frame(
  id = 1:20,
  value = c(15, NA, 23, 18, NA, 31, 27, 19, NA, 25,
            33, 21, NA, 29, 26, NA, 22, 30, 24, 28),
  category = sample(c("A", "B", "C"), 20, replace = TRUE)
)

cat("Original data (first 10 rows):\n")
print(head(raw_data, 10))

# Process data using loops
processed_data <- raw_data
missing_count <- 0
imputed_values <- c()

cat("\nProcessing missing values:\n")
for (i in 1:nrow(processed_data)) {
  if (is.na(processed_data$value[i])) {
    missing_count <- missing_count + 1
    
    # Impute with mean of same category
    same_category <- processed_data[processed_data$category == processed_data$category[i] & 
                                   !is.na(processed_data$value), ]
    
    if (nrow(same_category) > 0) {
      imputed_value <- round(mean(same_category$value))
      processed_data$value[i] <- imputed_value
      imputed_values <- c(imputed_values, imputed_value)
      cat(sprintf("Row %d: Imputed %d for category %s\n", 
                  i, imputed_value, processed_data$category[i]))
    }
  }
}

cat(sprintf("\nTotal missing values processed: %d\n", missing_count))
cat("Imputed values:", imputed_values, "\n\n")

# Example 2: Simulation Study
cat("Example 2: Monte Carlo Simulation\n")
set.seed(123)  # For reproducible results

# Simulate coin flips
n_simulations <- 1000
n_flips_per_sim <- 100
results <- c()

cat("Running coin flip simulations...\n")
for (sim in 1:n_simulations) {
  # Simulate coin flips (1 = heads, 0 = tails)
  flips <- sample(c(0, 1), n_flips_per_sim, replace = TRUE)
  heads_count <- sum(flips)
  heads_proportion <- heads_count / n_flips_per_sim
  results <- c(results, heads_proportion)
  
  if (sim %% 200 == 0) {
    cat(sprintf("Simulation %d: %.3f proportion of heads\n", sim, heads_proportion))
  }
}

# Analyze results
mean_proportion <- mean(results)
sd_proportion <- sd(results)
theoretical_mean <- 0.5
theoretical_sd <- sqrt(0.5 * 0.5 / n_flips_per_sim)

cat(sprintf("\nSimulation results (%d simulations of %d flips each):\n", 
            n_simulations, n_flips_per_sim))
cat(sprintf("Mean proportion: %.4f (theoretical: %.4f)\n", mean_proportion, theoretical_mean))
cat(sprintf("SD proportion: %.4f (theoretical: %.4f)\n", sd_proportion, theoretical_sd))
cat(sprintf("Range: [%.4f, %.4f]\n", min(results), max(results)))
cat("\n")

# Example 3: Text Processing
cat("Example 3: Text Processing with Loops\n")
text_data <- c(
  "The quick brown fox jumps over the lazy dog",
  "R programming is powerful and flexible",
  "Data science requires statistical knowledge",
  "Machine learning algorithms process large datasets",
  "Visualization helps communicate insights effectively"
)

# Analyze text using loops
word_counts <- c()
unique_words <- c()
total_characters <- 0

cat("Analyzing text data:\n")
for (i in 1:length(text_data)) {
  sentence <- text_data[i]
  words <- strsplit(sentence, " ")[[1]]
  word_count <- length(words)
  word_counts <- c(word_counts, word_count)
  
  # Collect unique words (simple approach)
  for (word in words) {
    clean_word <- tolower(gsub("[[:punct:]]", "", word))
    if (!(clean_word %in% unique_words) && clean_word != "") {
      unique_words <- c(unique_words, clean_word)
    }
  }
  
  char_count <- nchar(sentence)
  total_characters <- total_characters + char_count
  
  cat(sprintf("Sentence %d: %d words, %d characters\n", i, word_count, char_count))
}

cat(sprintf("\nText analysis summary:\n"))
cat(sprintf("Total sentences: %d\n", length(text_data)))
cat(sprintf("Total words: %d\n", sum(word_counts)))
cat(sprintf("Average words per sentence: %.1f\n", mean(word_counts)))
cat(sprintf("Total characters: %d\n", total_characters))
cat(sprintf("Unique words found: %d\n", length(unique_words)))
cat("Sample unique words:", head(unique_words, 10), "\n\n")

# Example 4: Iterative Algorithm (Gradient Descent)
cat("Example 4: Simple Gradient Descent\n")
# Minimize f(x) = (x - 3)^2, which has minimum at x = 3

# Function and its derivative
f <- function(x) (x - 3)^2
df_dx <- function(x) 2 * (x - 3)

# Gradient descent parameters
x <- 0  # Starting point
learning_rate <- 0.1
tolerance <- 0.001
max_iterations <- 100
iteration <- 0

cat(sprintf("Minimizing f(x) = (x - 3)^2 starting from x = %.1f\n", x))
cat("Iteration | x       | f(x)    | gradient\n")
cat("----------|---------|---------|----------\n")

while (iteration < max_iterations) {
  gradient <- df_dx(x)
  
  if (iteration %% 10 == 0 || abs(gradient) < tolerance) {
    cat(sprintf("%9d | %7.3f | %7.3f | %8.3f\n", iteration, x, f(x), gradient))
  }
  
  if (abs(gradient) < tolerance) {
    cat(sprintf("Converged after %d iterations\n", iteration))
    break
  }
  
  x <- x - learning_rate * gradient
  iteration <- iteration + 1
}

cat(sprintf("Final result: x = %.4f, f(x) = %.6f\n", x, f(x)))
cat(sprintf("True minimum: x = 3, f(x) = 0\n"))

cat("\n=== Tutorial Complete ===\n")
cat("You've mastered R loops and iteration!\n")
cat("Next: Study functions and functional programming concepts\n")