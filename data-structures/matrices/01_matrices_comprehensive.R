# Matrices in R
# This script demonstrates R matrices - 2D arrays for homogeneous data
# Covers creation, indexing, operations, and linear algebra applications

# Clear workspace
rm(list = ls())

cat("=== R Matrices Tutorial ===\n")
cat("Comprehensive guide to 2D matrices in R\n\n")

# =============================================================================
# MATRIX BASICS
# =============================================================================

cat("1. MATRIX BASICS\n")
cat("===============\n\n")

# Creating matrices using matrix() function
mat1 <- matrix(1:12, nrow = 3, ncol = 4)
mat2 <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
mat3 <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2)

cat("Matrix creation:\n")
cat("Matrix 1 (by column):\n")
print(mat1)
cat("\nMatrix 2 (by row):\n")
print(mat2)
cat("\nMatrix 3 (automatic columns):\n")
print(mat3)
cat("\n")

# Matrix properties
cat("Matrix properties:\n")
cat("Dimensions of mat1:", dim(mat1), "\n")
cat("Number of rows:", nrow(mat1), "\n")
cat("Number of columns:", ncol(mat1), "\n")
cat("Total elements:", length(mat1), "\n")
cat("Class:", class(mat1), "\n")
cat("Mode:", mode(mat1), "\n\n")

# Matrix with different data types
char_matrix <- matrix(letters[1:6], nrow = 2, ncol = 3)
logical_matrix <- matrix(c(TRUE, FALSE, TRUE, FALSE), nrow = 2)

cat("Different data types:\n")
cat("Character matrix:\n")
print(char_matrix)
cat("\nLogical matrix:\n")
print(logical_matrix)
cat("\n")

# =============================================================================
# MATRIX CREATION METHODS
# =============================================================================

cat("2. MATRIX CREATION METHODS\n")
cat("==========================\n\n")

# Using cbind() and rbind()
vec1 <- c(1, 2, 3)
vec2 <- c(4, 5, 6)
vec3 <- c(7, 8, 9)

cbind_matrix <- cbind(vec1, vec2, vec3)
rbind_matrix <- rbind(vec1, vec2, vec3)

cat("Using cbind() and rbind():\n")
cat("Column bind:\n")
print(cbind_matrix)
cat("\nRow bind:\n")
print(rbind_matrix)
cat("\n")

# Special matrices
zero_matrix <- matrix(0, nrow = 3, ncol = 3)
ones_matrix <- matrix(1, nrow = 2, ncol = 4)
identity_matrix <- diag(4)  # 4x4 identity matrix
diagonal_matrix <- diag(c(1, 2, 3, 4))

cat("Special matrices:\n")
cat("Zero matrix:\n")
print(zero_matrix)
cat("\nOnes matrix:\n")
print(ones_matrix)
cat("\nIdentity matrix:\n")
print(identity_matrix)
cat("\nDiagonal matrix:\n")
print(diagonal_matrix)
cat("\n")

# Random matrices
random_uniform <- matrix(runif(12), nrow = 3, ncol = 4)
random_normal <- matrix(rnorm(9, mean = 0, sd = 1), nrow = 3)

cat("Random matrices:\n")
cat("Uniform random [0,1]:\n")
print(round(random_uniform, 2))
cat("\nNormal random (mean=0, sd=1):\n")
print(round(random_normal, 2))
cat("\n")

# =============================================================================
# MATRIX INDEXING AND SUBSETTING
# =============================================================================

cat("3. MATRIX INDEXING AND SUBSETTING\n")
cat("=================================\n\n")

# Create test matrix
test_matrix <- matrix(1:20, nrow = 4, ncol = 5)
rownames(test_matrix) <- paste("Row", 1:4)
colnames(test_matrix) <- paste("Col", 1:5)

cat("Test matrix:\n")
print(test_matrix)
cat("\n")

# Single element access
element_23 <- test_matrix[2, 3]
cat("Element [2,3]:", element_23, "\n\n")

# Row and column access
row_2 <- test_matrix[2, ]
col_3 <- test_matrix[, 3]
multiple_rows <- test_matrix[1:2, ]
multiple_cols <- test_matrix[, 2:4]

cat("Row and column access:\n")
cat("Row 2:", row_2, "\n")
cat("Column 3:", col_3, "\n")
cat("Rows 1-2:\n")
print(multiple_rows)
cat("Columns 2-4:\n")
print(multiple_cols)
cat("\n")

# Submatrix extraction
submatrix <- test_matrix[2:3, 2:4]
cat("Submatrix [2:3, 2:4]:\n")
print(submatrix)
cat("\n")

# Named indexing
row_by_name <- test_matrix["Row 2", ]
col_by_name <- test_matrix[, "Col 3"]
submatrix_named <- test_matrix[c("Row 1", "Row 3"), c("Col 2", "Col 4")]

cat("Named indexing:\n")
cat("Row 2 by name:", row_by_name, "\n")
cat("Column 3 by name:", col_by_name, "\n")
cat("Submatrix by names:\n")
print(submatrix_named)
cat("\n")

# Logical indexing
logical_mask <- test_matrix > 10
filtered_elements <- test_matrix[logical_mask]

cat("Logical indexing:\n")
cat("Elements > 10:", filtered_elements, "\n\n")

# =============================================================================
# MATRIX OPERATIONS
# =============================================================================

cat("4. MATRIX OPERATIONS\n")
cat("===================\n\n")

# Create matrices for operations
A <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2)
B <- matrix(c(7, 8, 9, 10, 11, 12), nrow = 2)

cat("Matrix A:\n")
print(A)
cat("Matrix B:\n")
print(B)
cat("\n")

# Element-wise operations
addition <- A + B
subtraction <- A - B
multiplication <- A * B  # Element-wise, not matrix multiplication
division <- A / B

cat("Element-wise operations:\n")
cat("Addition (A + B):\n")
print(addition)
cat("Subtraction (A - B):\n")
print(subtraction)
cat("Element-wise multiplication (A * B):\n")
print(multiplication)
cat("Element-wise division (A / B):\n")
print(round(division, 2))
cat("\n")

# Scalar operations
scalar_add <- A + 10
scalar_multiply <- A * 3
scalar_power <- A^2

cat("Scalar operations:\n")
cat("A + 10:\n")
print(scalar_add)
cat("A * 3:\n")
print(scalar_multiply)
cat("A^2:\n")
print(scalar_power)
cat("\n")

# =============================================================================
# MATRIX ALGEBRA
# =============================================================================

cat("5. MATRIX ALGEBRA\n")
cat("================\n\n")

# Matrix multiplication
C <- matrix(c(1, 2, 3, 4), nrow = 2)
D <- matrix(c(5, 6, 7, 8), nrow = 2)

matrix_product <- C %*% D  # Matrix multiplication
cross_product <- crossprod(C, D)  # t(C) %*% D
tcross_product <- tcrossprod(C, D)  # C %*% t(D)

cat("Matrix C:\n")
print(C)
cat("Matrix D:\n")
print(D)
cat("\nMatrix multiplication (C %*% D):\n")
print(matrix_product)
cat("Cross product (t(C) %*% D):\n")
print(cross_product)
cat("T-cross product (C %*% t(D)):\n")
print(tcross_product)
cat("\n")

# Matrix transpose
transpose_C <- t(C)
cat("Transpose of C:\n")
print(transpose_C)
cat("\n")

# Matrix determinant and inverse (for square matrices)
square_matrix <- matrix(c(4, 2, 7, 6), nrow = 2)
det_value <- det(square_matrix)
inverse_matrix <- solve(square_matrix)
verification <- square_matrix %*% inverse_matrix

cat("Square matrix:\n")
print(square_matrix)
cat("Determinant:", det_value, "\n")
cat("Inverse:\n")
print(round(inverse_matrix, 4))
cat("Verification (should be identity):\n")
print(round(verification, 10))
cat("\n")

# Eigenvalues and eigenvectors
eigen_result <- eigen(square_matrix)
eigenvalues <- eigen_result$values
eigenvectors <- eigen_result$vectors

cat("Eigenanalysis:\n")
cat("Eigenvalues:", eigenvalues, "\n")
cat("Eigenvectors:\n")
print(round(eigenvectors, 4))
cat("\n")

# =============================================================================
# MATRIX FUNCTIONS
# =============================================================================

cat("6. MATRIX FUNCTIONS\n")
cat("==================\n\n")

data_matrix <- matrix(c(1, 4, 7, 2, 5, 8, 3, 6, 9), nrow = 3)
cat("Data matrix:\n")
print(data_matrix)
cat("\n")

# Row and column operations
row_sums <- rowSums(data_matrix)
col_sums <- colSums(data_matrix)
row_means <- rowMeans(data_matrix)
col_means <- colMeans(data_matrix)

cat("Row and column operations:\n")
cat("Row sums:", row_sums, "\n")
cat("Column sums:", col_sums, "\n")
cat("Row means:", row_means, "\n")
cat("Column means:", round(col_means, 2), "\n\n")

# Apply functions
row_max <- apply(data_matrix, 1, max)  # Apply to rows
col_min <- apply(data_matrix, 2, min)  # Apply to columns
matrix_var <- apply(data_matrix, 2, var)  # Variance of columns

cat("Apply functions:\n")
cat("Row maximums:", row_max, "\n")
cat("Column minimums:", col_min, "\n")
cat("Column variances:", round(matrix_var, 2), "\n\n")

# Matrix summary
cat("Matrix summary:\n")
print(summary(data_matrix))
cat("\n")

# =============================================================================
# MATRIX MANIPULATION
# =============================================================================

cat("7. MATRIX MANIPULATION\n")
cat("======================\n\n")

original_matrix <- matrix(1:12, nrow = 3)
cat("Original matrix:\n")
print(original_matrix)
cat("\n")

# Adding rows and columns
new_row <- c(13, 14, 15, 16)
new_col <- c(17, 18, 19)

expanded_rows <- rbind(original_matrix, new_row)
expanded_cols <- cbind(original_matrix, new_col)

cat("Adding new row:\n")
print(expanded_rows)
cat("Adding new column:\n")
print(expanded_cols)
cat("\n")

# Removing rows and columns
removed_row <- original_matrix[-2, ]  # Remove row 2
removed_col <- original_matrix[, -3]  # Remove column 3

cat("Removing row 2:\n")
print(removed_row)
cat("Removing column 3:\n")
print(removed_col)
cat("\n")

# Matrix reshaping
reshaped <- matrix(as.vector(original_matrix), nrow = 2)
cat("Reshaped to 2 rows:\n")
print(reshaped)
cat("\n")

# =============================================================================
# NAMED MATRICES
# =============================================================================

cat("8. NAMED MATRICES\n")
cat("================\n\n")

# Creating matrices with names
sales_data <- matrix(c(120, 135, 110, 125,
                      145, 150, 160, 140,
                      130, 125, 155, 135), 
                    nrow = 3, byrow = TRUE)

rownames(sales_data) <- c("Product A", "Product B", "Product C")
colnames(sales_data) <- c("Q1", "Q2", "Q3", "Q4")

cat("Sales data matrix:\n")
print(sales_data)
cat("\n")

# Accessing by names
product_a_sales <- sales_data["Product A", ]
q2_sales <- sales_data[, "Q2"]
specific_quarters <- sales_data[c("Product A", "Product C"), c("Q1", "Q3")]

cat("Named access:\n")
cat("Product A sales:", product_a_sales, "\n")
cat("Q2 sales:", q2_sales, "\n")
cat("Specific quarters:\n")
print(specific_quarters)
cat("\n")

# Adding names after creation
unnamed_matrix <- matrix(1:6, nrow = 2)
dimnames(unnamed_matrix) <- list(c("Row1", "Row2"), c("Col1", "Col2", "Col3"))

cat("Adding names after creation:\n")
print(unnamed_matrix)
cat("\n")

# =============================================================================
# MATRIX APPLICATIONS
# =============================================================================

cat("9. MATRIX APPLICATIONS\n")
cat("======================\n\n")

# Example 1: Correlation matrix
set.seed(123)  # For reproducible results
data_vars <- matrix(rnorm(50), nrow = 10, ncol = 5)
colnames(data_vars) <- paste("Var", 1:5)

correlation_matrix <- cor(data_vars)
cat("Correlation matrix:\n")
print(round(correlation_matrix, 3))
cat("\n")

# Example 2: Distance matrix
coordinates <- matrix(c(0, 0, 1, 1, 2, 0, 1, 2, 3, 1), nrow = 5, ncol = 2)
rownames(coordinates) <- paste("Point", 1:5)
colnames(coordinates) <- c("X", "Y")

distance_matrix <- dist(coordinates)
cat("Coordinates:\n")
print(coordinates)
cat("Distance matrix:\n")
print(round(distance_matrix, 2))
cat("\n")

# Example 3: Transition matrix (Markov chain)
transition_matrix <- matrix(c(0.7, 0.2, 0.1,
                             0.3, 0.4, 0.3,
                             0.1, 0.3, 0.6), 
                           nrow = 3, byrow = TRUE)
rownames(transition_matrix) <- c("State A", "State B", "State C")
colnames(transition_matrix) <- c("To A", "To B", "To C")

cat("Transition matrix (Markov chain):\n")
print(transition_matrix)
cat("Row sums (should be 1):", rowSums(transition_matrix), "\n\n")

# Steady state (eigenvector with eigenvalue 1)
steady_state <- eigen(t(transition_matrix))$vectors[, 1]
steady_state <- abs(steady_state) / sum(abs(steady_state))
names(steady_state) <- rownames(transition_matrix)
cat("Steady state probabilities:\n")
print(round(steady_state, 3))
cat("\n")

# =============================================================================
# PRACTICAL EXAMPLES
# =============================================================================

cat("10. PRACTICAL EXAMPLES\n")
cat("======================\n\n")

# Example 1: Student grades matrix
students <- c("Alice", "Bob", "Charlie", "Diana", "Eve")
subjects <- c("Math", "Science", "English", "History")

grades <- matrix(c(85, 92, 78, 88,
                  90, 87, 82, 85,
                  78, 85, 90, 80,
                  92, 89, 85, 91,
                  88, 84, 87, 89), 
                nrow = 5, byrow = TRUE)

rownames(grades) <- students
colnames(grades) <- subjects

cat("Student grades:\n")
print(grades)
cat("\n")

# Calculate averages
student_averages <- rowMeans(grades)
subject_averages <- colMeans(grades)

cat("Student averages:", round(student_averages, 1), "\n")
cat("Subject averages:", round(subject_averages, 1), "\n")

# Find top performer
top_student <- names(which.max(student_averages))
hardest_subject <- names(which.min(subject_averages))

cat("Top student:", top_student, "(", round(max(student_averages), 1), ")\n")
cat("Hardest subject:", hardest_subject, "(", round(min(subject_averages), 1), ")\n\n")

# Example 2: Portfolio returns
stocks <- c("AAPL", "GOOGL", "MSFT", "TSLA")
months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun")

returns <- matrix(c(0.05, 0.02, -0.01, 0.03, 0.04, 0.01,
                   0.03, 0.04, 0.02, -0.02, 0.05, 0.03,
                   0.04, 0.01, 0.03, 0.02, 0.02, 0.04,
                   0.08, -0.05, 0.10, -0.03, 0.06, -0.02), 
                 nrow = 4, byrow = TRUE)

rownames(returns) <- stocks
colnames(returns) <- months

cat("Monthly returns matrix:\n")
print(round(returns, 3))
cat("\n")

# Portfolio analysis
portfolio_weights <- c(0.3, 0.3, 0.25, 0.15)
portfolio_returns <- portfolio_weights %*% returns

cat("Portfolio weights:", portfolio_weights, "\n")
cat("Portfolio monthly returns:", round(portfolio_returns, 3), "\n")
cat("Annual return:", round(sum(portfolio_returns) * 2, 3), "(6 months × 2)\n\n")

cat("=== Tutorial Complete ===\n")
cat("You've mastered R matrices!\n")
cat("Next: Study data frames for mixed-type data structures\n")