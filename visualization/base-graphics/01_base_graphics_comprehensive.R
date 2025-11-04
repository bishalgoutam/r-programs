# Base R Graphics and Visualization
# This script demonstrates R's built-in plotting capabilities
# Covers scatter plots, line plots, bar charts, histograms, and customization

# Clear workspace
rm(list = ls())

cat("=== R Base Graphics Tutorial ===\n")
cat("Comprehensive guide to visualization using base R graphics\n\n")

# =============================================================================
# BASIC PLOTTING FUNCTIONS
# =============================================================================

cat("1. BASIC PLOTTING FUNCTIONS\n")
cat("===========================\n\n")

# Create sample data
set.seed(123)
x <- 1:20
y <- x + rnorm(20, mean = 0, sd = 3)
categories <- sample(c("A", "B", "C"), 20, replace = TRUE)

# Basic scatter plot
cat("Creating basic scatter plot...\n")
plot(x, y, main = "Basic Scatter Plot", 
     xlab = "X Values", ylab = "Y Values")

# Add trend line
abline(lm(y ~ x), col = "red", lwd = 2)

# Line plot
cat("Creating line plot...\n")
time_series <- cumsum(rnorm(50))
plot(time_series, type = "l", main = "Time Series Plot",
     xlab = "Time", ylab = "Value", col = "blue", lwd = 2)

# Bar plot
cat("Creating bar plot...\n")
category_counts <- table(categories)
barplot(category_counts, main = "Category Distribution",
        xlab = "Category", ylab = "Count", col = c("red", "green", "blue"))

# Histogram
cat("Creating histogram...\n")
random_data <- rnorm(1000, mean = 50, sd = 15)
hist(random_data, main = "Distribution of Random Data",
     xlab = "Value", ylab = "Frequency", col = "lightblue", breaks = 30)

# Box plot
cat("Creating box plot...\n")
data_by_group <- list(
  Group_A = rnorm(50, mean = 10, sd = 2),
  Group_B = rnorm(50, mean = 15, sd = 3),
  Group_C = rnorm(50, mean = 12, sd = 2.5)
)
boxplot(data_by_group, main = "Box Plot Comparison",
        ylab = "Values", col = c("red", "green", "blue"))

cat("\n")

# =============================================================================
# PLOT CUSTOMIZATION
# =============================================================================

cat("2. PLOT CUSTOMIZATION\n")
cat("=====================\n\n")

# Advanced scatter plot with customization
cat("Creating customized scatter plot...\n")
plot(x, y, 
     main = "Customized Scatter Plot",
     sub = "Subtitle: Relationship between X and Y",
     xlab = "X Variable (units)", 
     ylab = "Y Variable (units)",
     pch = 19,              # Point character (solid circle)
     col = "darkblue",       # Point color
     cex = 1.2,             # Point size
     xlim = c(0, 25),       # X-axis limits
     ylim = c(-10, 30),     # Y-axis limits
     bg = "lightgray")      # Background color

# Add grid
grid(col = "white", lwd = 2)

# Add text annotations
text(5, 25, "High variability region", cex = 0.8, col = "red")
arrows(5, 23, 3, 18, col = "red", lwd = 2)

# Customized line plot
cat("Creating customized line plot...\n")
months <- 1:12
temperature <- c(2, 5, 10, 15, 20, 25, 28, 27, 23, 16, 8, 3)
rainfall <- c(80, 60, 50, 40, 30, 20, 15, 20, 35, 60, 75, 85)

# Create plot with first variable
plot(months, temperature, 
     type = "l", 
     col = "red", 
     lwd = 3,
     ylim = c(0, 100),
     main = "Climate Data", 
     xlab = "Month", 
     ylab = "Temperature (°C) / Rainfall (mm)",
     axes = FALSE)

# Add axes
axis(1, at = 1:12, labels = month.abb)
axis(2, at = seq(0, 100, 20))
box()

# Add second variable
lines(months, rainfall, col = "blue", lwd = 3, lty = 2)

# Add legend
legend("topright", 
       legend = c("Temperature", "Rainfall"),
       col = c("red", "blue"),
       lty = c(1, 2),
       lwd = 3,
       bg = "white")

cat("\n")

# =============================================================================
# MULTIPLE PLOTS IN ONE FIGURE
# =============================================================================

cat("3. MULTIPLE PLOTS IN ONE FIGURE\n")
cat("===============================\n\n")

cat("Creating multi-panel plot...\n")
# Set up 2x2 plot layout
par(mfrow = c(2, 2))

# Plot 1: Scatter plot
plot(iris$Sepal.Length, iris$Sepal.Width,
     main = "Sepal Dimensions",
     xlab = "Length", ylab = "Width",
     col = as.numeric(iris$Species),
     pch = 19)

# Plot 2: Histogram
hist(iris$Petal.Length,
     main = "Petal Length Distribution",
     xlab = "Petal Length", 
     col = "lightgreen",
     breaks = 15)

# Plot 3: Box plot
boxplot(Sepal.Length ~ Species, data = iris,
        main = "Sepal Length by Species",
        ylab = "Sepal Length",
        col = c("red", "green", "blue"))

# Plot 4: Bar plot
species_counts <- table(iris$Species)
barplot(species_counts,
        main = "Species Count",
        ylab = "Count",
        col = rainbow(3))

# Reset to single plot
par(mfrow = c(1, 1))

cat("\n")

# =============================================================================
# SPECIALIZED PLOTS
# =============================================================================

cat("4. SPECIALIZED PLOTS\n")
cat("===================\n\n")

# Pie chart
cat("Creating pie chart...\n")
expenses <- c(housing = 1200, food = 400, transport = 300, 
              entertainment = 200, utilities = 150, savings = 500)
pie(expenses, 
    main = "Monthly Budget Breakdown",
    col = rainbow(length(expenses)),
    labels = paste(names(expenses), "\n$", expenses))

# Dotchart
cat("Creating dot chart...\n")
performance <- c(Alice = 85, Bob = 92, Charlie = 78, Diana = 88, 
                Eve = 95, Frank = 82, Grace = 90)
dotchart(performance,
         main = "Employee Performance Scores",
         xlab = "Score",
         color = "blue",
         pch = 19,
         cex = 1.2)

# Stem-and-leaf plot
cat("Creating stem-and-leaf plot...\n")
test_scores <- c(78, 82, 85, 88, 90, 92, 95, 88, 85, 91, 
                87, 89, 93, 86, 84, 90, 88, 92, 87, 89)
stem(test_scores)

# Stripchart
cat("Creating strip chart...\n")
stripchart(list(Group1 = rnorm(20, 10, 2),
                Group2 = rnorm(20, 12, 2),
                Group3 = rnorm(20, 14, 2)),
           main = "Strip Chart Comparison",
           xlab = "Values",
           method = "jitter",
           col = c("red", "green", "blue"),
           pch = 19)

cat("\n")

# =============================================================================
# STATISTICAL PLOTS
# =============================================================================

cat("5. STATISTICAL PLOTS\n")
cat("===================\n\n")

# Q-Q plot for normality testing
cat("Creating Q-Q plot for normality testing...\n")
normal_data <- rnorm(100)
skewed_data <- rexp(100)

par(mfrow = c(1, 2))
qqnorm(normal_data, main = "Q-Q Plot: Normal Data")
qqline(normal_data, col = "red")

qqnorm(skewed_data, main = "Q-Q Plot: Skewed Data")
qqline(skewed_data, col = "red")

par(mfrow = c(1, 1))

# Density plot
cat("Creating density plot...\n")
plot(density(iris$Sepal.Length), 
     main = "Sepal Length Density",
     xlab = "Sepal Length",
     ylab = "Density",
     col = "blue",
     lwd = 2)

# Add normal curve for comparison
sepal_mean <- mean(iris$Sepal.Length)
sepal_sd <- sd(iris$Sepal.Length)
x_norm <- seq(min(iris$Sepal.Length), max(iris$Sepal.Length), length = 100)
y_norm <- dnorm(x_norm, mean = sepal_mean, sd = sepal_sd)
lines(x_norm, y_norm, col = "red", lwd = 2, lty = 2)

legend("topright", 
       legend = c("Actual Density", "Normal Curve"),
       col = c("blue", "red"),
       lty = c(1, 2),
       lwd = 2)

# Correlation plot (simple version)
cat("Creating correlation matrix plot...\n")
# Select numeric columns from iris
numeric_iris <- iris[, 1:4]
cor_matrix <- cor(numeric_iris)

# Create a simple correlation heatmap using image()
image(1:ncol(cor_matrix), 1:nrow(cor_matrix), 
      as.matrix(cor_matrix),
      main = "Correlation Matrix Heatmap",
      xlab = "", ylab = "",
      axes = FALSE,
      col = heat.colors(20))

# Add labels
axis(1, at = 1:ncol(cor_matrix), labels = colnames(cor_matrix), las = 2)
axis(2, at = 1:nrow(cor_matrix), labels = rownames(cor_matrix), las = 2)

# Add correlation values
for(i in 1:nrow(cor_matrix)) {
  for(j in 1:ncol(cor_matrix)) {
    text(j, i, round(cor_matrix[i,j], 2), cex = 0.8)
  }
}

cat("\n")

# =============================================================================
# SAVING PLOTS
# =============================================================================

cat("6. SAVING PLOTS\n")
cat("==============\n\n")

cat("Demonstrating how to save plots to files...\n")

# Save as PDF
pdf("sample_plot.pdf", width = 8, height = 6)
plot(iris$Sepal.Length, iris$Sepal.Width,
     col = iris$Species, pch = 19,
     main = "Iris Dataset - Sepal Dimensions",
     xlab = "Sepal Length", ylab = "Sepal Width")
legend("topright", legend = levels(iris$Species), 
       col = 1:3, pch = 19)
dev.off()

# Save as PNG
png("sample_plot.png", width = 800, height = 600)
hist(iris$Petal.Length, 
     main = "Distribution of Petal Length",
     xlab = "Petal Length", 
     col = "lightblue",
     breaks = 20)
dev.off()

# Save as JPEG
jpeg("sample_plot.jpg", width = 800, height = 600, quality = 90)
boxplot(Sepal.Length ~ Species, data = iris,
        main = "Sepal Length by Species",
        col = c("red", "green", "blue"))
dev.off()

cat("Plots saved as:\n")
cat("- sample_plot.pdf\n")
cat("- sample_plot.png\n") 
cat("- sample_plot.jpg\n\n")

# =============================================================================
# PRACTICAL EXAMPLES
# =============================================================================

cat("7. PRACTICAL EXAMPLES\n")
cat("=====================\n\n")

# Example 1: Business Dashboard
cat("Example 1: Sales Performance Dashboard\n")
# Simulate sales data
months <- month.abb
sales_2023 <- c(45000, 48000, 52000, 49000, 55000, 58000,
                62000, 60000, 57000, 53000, 50000, 65000)
sales_2024 <- sales_2023 * 1.15 + rnorm(12, 0, 2000)

# Create dashboard layout
par(mfrow = c(2, 2), mar = c(4, 4, 3, 2))

# Plot 1: Monthly sales comparison
plot(1:12, sales_2023, type = "l", col = "blue", lwd = 3,
     main = "Monthly Sales Comparison",
     xlab = "Month", ylab = "Sales ($)",
     ylim = c(40000, 80000),
     axes = FALSE)
lines(1:12, sales_2024, col = "red", lwd = 3)
axis(1, at = 1:12, labels = month.abb)
axis(2)
legend("topleft", legend = c("2023", "2024"), 
       col = c("blue", "red"), lwd = 3)
grid()

# Plot 2: Growth rate
growth_rate <- ((sales_2024 - sales_2023) / sales_2023) * 100
barplot(growth_rate, names.arg = month.abb,
        main = "Monthly Growth Rate",
        ylab = "Growth (%)",
        col = ifelse(growth_rate > 0, "green", "red"),
        las = 2)
abline(h = 0, col = "black", lwd = 2)

# Plot 3: Quarterly performance
quarters <- c("Q1", "Q2", "Q3", "Q4")
q_2023 <- c(sum(sales_2023[1:3]), sum(sales_2023[4:6]),
            sum(sales_2023[7:9]), sum(sales_2023[10:12]))
q_2024 <- c(sum(sales_2024[1:3]), sum(sales_2024[4:6]),
            sum(sales_2024[7:9]), sum(sales_2024[10:12]))

barplot(rbind(q_2023, q_2024), beside = TRUE,
        names.arg = quarters,
        main = "Quarterly Sales",
        ylab = "Sales ($)",
        col = c("lightblue", "lightcoral"),
        legend.text = c("2023", "2024"))

# Plot 4: Cumulative sales
cumulative_2023 <- cumsum(sales_2023)
cumulative_2024 <- cumsum(sales_2024)

plot(1:12, cumulative_2023, type = "l", col = "blue", lwd = 3,
     main = "Cumulative Sales",
     xlab = "Month", ylab = "Cumulative Sales ($)",
     axes = FALSE)
lines(1:12, cumulative_2024, col = "red", lwd = 3)
axis(1, at = 1:12, labels = month.abb)
axis(2)
legend("topleft", legend = c("2023", "2024"), 
       col = c("blue", "red"), lwd = 3)
grid()

par(mfrow = c(1, 1))

cat("\n")

# Example 2: Scientific Data Visualization
cat("Example 2: Experimental Results\n")
# Simulate experimental data
set.seed(456)
temperature <- seq(20, 80, by = 5)
enzyme_activity <- 0.5 * temperature - 0.005 * temperature^2 + 
                   rnorm(length(temperature), 0, 2)
ph_levels <- c(5.5, 6.0, 6.5, 7.0, 7.5, 8.0)
growth_rates <- c(2.1, 3.5, 4.8, 5.2, 4.1, 2.9)

par(mfrow = c(2, 2))

# Plot 1: Temperature vs Enzyme Activity
plot(temperature, enzyme_activity,
     main = "Enzyme Activity vs Temperature",
     xlab = "Temperature (°C)",
     ylab = "Activity (units/min)",
     pch = 19, col = "red", cex = 1.2)

# Fit polynomial model
poly_model <- lm(enzyme_activity ~ poly(temperature, 2))
temp_pred <- seq(min(temperature), max(temperature), length = 100)
activity_pred <- predict(poly_model, newdata = data.frame(temperature = temp_pred))
lines(temp_pred, activity_pred, col = "blue", lwd = 2)

# Plot 2: pH vs Growth Rate
plot(ph_levels, growth_rates,
     main = "Growth Rate vs pH",
     xlab = "pH Level",
     ylab = "Growth Rate (units/hour)",
     pch = 19, col = "darkgreen", cex = 1.5,
     type = "b", lwd = 2)
grid()

# Plot 3: Distribution of enzyme activity
hist(enzyme_activity,
     main = "Distribution of Enzyme Activity",
     xlab = "Activity (units/min)",
     ylab = "Frequency",
     col = "lightblue",
     breaks = 8)

# Add normal curve
x_seq <- seq(min(enzyme_activity), max(enzyme_activity), length = 100)
y_seq <- dnorm(x_seq, mean = mean(enzyme_activity), sd = sd(enzyme_activity))
y_scaled <- y_seq * length(enzyme_activity) * diff(range(enzyme_activity)) / 8
lines(x_seq, y_scaled, col = "red", lwd = 2)

# Plot 4: Error bars example
mean_growth <- tapply(rep(growth_rates, 3), rep(ph_levels, 3), mean)
sd_growth <- tapply(rep(growth_rates, 3), rep(ph_levels, 3), sd)

plot(ph_levels, growth_rates,
     main = "Growth Rate with Error Bars",
     xlab = "pH Level",
     ylab = "Growth Rate (units/hour)",
     pch = 19, col = "purple", cex = 1.2,
     ylim = c(0, 7))

# Add error bars (simulated)
arrows(ph_levels, growth_rates - 0.3, 
       ph_levels, growth_rates + 0.3,
       angle = 90, code = 3, length = 0.1, col = "black")

par(mfrow = c(1, 1))

cat("\n")

# Example 3: Financial Data Visualization
cat("Example 3: Stock Price Analysis\n")
# Simulate stock data
set.seed(789)
dates <- seq(as.Date("2024-01-01"), as.Date("2024-12-31"), by = "day")
prices <- 100 * cumprod(1 + rnorm(length(dates), 0.0005, 0.02))
volume <- sample(1000:5000, length(dates))

# Create a financial chart
plot(dates, prices, type = "l", col = "blue", lwd = 2,
     main = "Stock Price Over Time",
     xlab = "Date", ylab = "Price ($)",
     ylim = c(min(prices) * 0.95, max(prices) * 1.05))

# Add moving average
ma_20 <- filter(prices, rep(1/20, 20), sides = 1)
lines(dates, ma_20, col = "red", lwd = 2, lty = 2)

# Add support and resistance lines
support <- min(prices) * 1.02
resistance <- max(prices) * 0.98
abline(h = support, col = "green", lwd = 2, lty = 3)
abline(h = resistance, col = "red", lwd = 2, lty = 3)

# Add annotations
text(dates[50], max(prices) * 0.98, "Resistance", col = "red")
text(dates[50], min(prices) * 1.05, "Support", col = "green")

legend("topleft", 
       legend = c("Price", "20-day MA", "Support", "Resistance"),
       col = c("blue", "red", "green", "red"),
       lty = c(1, 2, 3, 3),
       lwd = 2)

cat("\n")

cat("=== Tutorial Complete ===\n")
cat("You've mastered base R graphics!\n")
cat("Next: Learn ggplot2 for advanced, professional visualizations\n\n")

# Clean up generated files
if(file.exists("sample_plot.pdf")) file.remove("sample_plot.pdf")
if(file.exists("sample_plot.png")) file.remove("sample_plot.png") 
if(file.exists("sample_plot.jpg")) file.remove("sample_plot.jpg")

cat("Note: Plot files were created and then cleaned up for demo purposes\n")