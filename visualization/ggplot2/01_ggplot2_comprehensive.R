# ggplot2: Advanced Data Visualization
# This script demonstrates the Grammar of Graphics using ggplot2
# Covers layers, aesthetics, geoms, facets, themes, and advanced visualizations

# Clear workspace
rm(list = ls())

cat("=== ggplot2 Advanced Visualization Tutorial ===\n")
cat("Comprehensive guide to professional data visualization with ggplot2\n\n")

# Load required libraries
if (!require(ggplot2)) {
  install.packages("ggplot2")
  library(ggplot2)
}

if (!require(dplyr)) {
  install.packages("dplyr")
  library(dplyr)
}

if (!require(gridExtra)) {
  install.packages("gridExtra")
  library(gridExtra)
}

if (!require(scales)) {
  install.packages("scales")
  library(scales)
}

cat("Required packages loaded successfully\n\n")

# =============================================================================
# GGPLOT2 BASICS
# =============================================================================

cat("1. GGPLOT2 BASICS\n")
cat("================\n\n")

# Basic ggplot syntax
cat("Basic ggplot2 syntax and components:\n")
print("ggplot(data) + aes(x, y) + geom_*() + additional_layers")

# Basic scatter plot
p1 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  labs(title = "Basic Scatter Plot",
       x = "Sepal Length", 
       y = "Sepal Width")

print(p1)

# Adding color by group
p2 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  labs(title = "Scatter Plot with Color by Species",
       x = "Sepal Length", 
       y = "Sepal Width")

print(p2)

# Adding shape and transparency
p3 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, 
                       color = Species, shape = Species)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "Enhanced Scatter Plot",
       x = "Sepal Length", 
       y = "Sepal Width",
       subtitle = "With color and shape aesthetics")

print(p3)

cat("\n")

# =============================================================================
# GEOMETRIC OBJECTS (GEOMS)
# =============================================================================

cat("2. GEOMETRIC OBJECTS (GEOMS)\n")
cat("============================\n\n")

# Create sample data
set.seed(123)
sample_data <- data.frame(
  x = 1:20,
  y = cumsum(rnorm(20)),
  group = rep(c("A", "B"), each = 10),
  size_var = sample(1:5, 20, replace = TRUE)
)

# Line plot
p4 <- ggplot(sample_data, aes(x = x, y = y, color = group)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(title = "Line Plot with Points",
       x = "Time", y = "Value")

print(p4)

# Bar plot
p5 <- ggplot(iris, aes(x = Species, fill = Species)) +
  geom_bar() +
  labs(title = "Bar Plot - Species Count",
       x = "Species", y = "Count") +
  theme(legend.position = "none")

print(p5)

# Histogram
p6 <- ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(bins = 20, alpha = 0.7, position = "identity") +
  labs(title = "Histogram of Sepal Length",
       x = "Sepal Length", y = "Frequency")

print(p6)

# Box plot
p7 <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot(alpha = 0.7) +
  geom_jitter(width = 0.2, alpha = 0.5) +
  labs(title = "Box Plot with Jittered Points",
       x = "Species", y = "Sepal Length") +
  theme(legend.position = "none")

print(p7)

# Violin plot
p8 <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_violin(alpha = 0.7) +
  geom_boxplot(width = 0.2, alpha = 0.8) +
  labs(title = "Violin Plot with Box Plot",
       x = "Species", y = "Sepal Length") +
  theme(legend.position = "none")

print(p8)

cat("\n")

# =============================================================================
# STATISTICAL TRANSFORMATIONS
# =============================================================================

cat("3. STATISTICAL TRANSFORMATIONS\n")
cat("==============================\n\n")

# Smooth lines and confidence intervals
p9 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(title = "Linear Regression Lines by Species",
       x = "Sepal Length", y = "Sepal Width")

print(p9)

# Density plots
p10 <- ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_density(alpha = 0.6) +
  labs(title = "Density Plot of Sepal Length",
       x = "Sepal Length", y = "Density")

print(p10)

# Statistical summary
p11 <- ggplot(iris, aes(x = Species, y = Sepal.Length)) +
  stat_summary(fun = mean, geom = "point", size = 4, color = "red") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
  geom_jitter(alpha = 0.3, width = 0.2) +
  labs(title = "Mean and Standard Error",
       x = "Species", y = "Sepal Length")

print(p11)

cat("\n")

# =============================================================================
# FACETING
# =============================================================================

cat("4. FACETING\n")
cat("===========\n\n")

# Create expanded dataset for faceting
iris_long <- iris %>%
  tidyr::pivot_longer(cols = c(Sepal.Length, Sepal.Width, 
                               Petal.Length, Petal.Width),
                      names_to = "Measurement", 
                      values_to = "Value")

# Facet wrap
p12 <- ggplot(iris_long, aes(x = Species, y = Value, fill = Species)) +
  geom_boxplot() +
  facet_wrap(~ Measurement, scales = "free_y") +
  labs(title = "Iris Measurements by Species",
       x = "Species", y = "Value") +
  theme(legend.position = "none",
        axis.text.x = element_text(angle = 45, hjust = 1))

print(p12)

# Facet grid
p13 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(color = Species), size = 2) +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(. ~ Species) +
  labs(title = "Sepal Dimensions by Species",
       x = "Sepal Length", y = "Sepal Width")

print(p13)

cat("\n")

# =============================================================================
# THEMES AND CUSTOMIZATION
# =============================================================================

cat("5. THEMES AND CUSTOMIZATION\n")
cat("===========================\n\n")

# Built-in themes
p14 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  labs(title = "Different Themes Comparison")

# Classic theme
p14_classic <- p14 + theme_classic() + ggtitle("Classic Theme")

# Minimal theme
p14_minimal <- p14 + theme_minimal() + ggtitle("Minimal Theme")

# Dark theme
p14_dark <- p14 + theme_dark() + ggtitle("Dark Theme")

# Void theme
p14_void <- p14 + theme_void() + ggtitle("Void Theme")

# Arrange multiple themes
grid.arrange(p14_classic, p14_minimal, p14_dark, p14_void, ncol = 2)

# Custom theme
custom_theme <- theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 12, hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 10),
    legend.title = element_text(size = 12, face = "bold"),
    legend.text = element_text(size = 10),
    panel.grid.major = element_line(color = "gray90", size = 0.5),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "white", color = "black"),
    strip.text = element_text(size = 11, face = "bold"),
    strip.background = element_rect(fill = "lightblue", color = "black")
  )

p15 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3, alpha = 0.8) +
  labs(title = "Custom Theme Example",
       subtitle = "Professional styling with custom elements",
       x = "Sepal Length (cm)", 
       y = "Sepal Width (cm)",
       color = "Iris Species") +
  custom_theme

print(p15)

cat("\n")

# =============================================================================
# SCALES AND COLORS
# =============================================================================

cat("6. SCALES AND COLORS\n")
cat("====================\n\n")

# Color scales
p16 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  scale_color_manual(values = c("setosa" = "#FF6B6B", 
                               "versicolor" = "#4ECDC4", 
                               "virginica" = "#45B7D1")) +
  labs(title = "Custom Color Palette")

print(p16)

# Gradient colors
sample_data_continuous <- data.frame(
  x = rnorm(100),
  y = rnorm(100),
  z = rnorm(100)
)

p17 <- ggplot(sample_data_continuous, aes(x = x, y = y, color = z)) +
  geom_point(size = 3) +
  scale_color_gradient2(low = "blue", mid = "white", high = "red",
                       midpoint = 0) +
  labs(title = "Gradient Color Scale",
       color = "Z Value")

print(p17)

# Scale transformations
economics_data <- data.frame(
  date = seq(as.Date("2020-01-01"), as.Date("2024-12-31"), by = "month"),
  value = exp(cumsum(rnorm(60, 0, 0.1))) * 1000
)

p18 <- ggplot(economics_data, aes(x = date, y = value)) +
  geom_line(color = "blue", size = 1.2) +
  scale_y_log10(labels = scales::dollar_format()) +
  scale_x_date(date_labels = "%Y", date_breaks = "1 year") +
  labs(title = "Log Scale Transformation",
       x = "Date", y = "Value (Log Scale)")

print(p18)

cat("\n")

# =============================================================================
# ADVANCED VISUALIZATIONS
# =============================================================================

cat("7. ADVANCED VISUALIZATIONS\n")
cat("==========================\n\n")

# Heatmap
# Create correlation matrix
cor_matrix <- cor(iris[, 1:4])
cor_df <- expand.grid(Var1 = rownames(cor_matrix), 
                      Var2 = colnames(cor_matrix))
cor_df$value <- as.vector(cor_matrix)

p19 <- ggplot(cor_df, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", mid = "white", high = "red",
                      midpoint = 0, name = "Correlation") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Correlation Heatmap",
       x = "", y = "")

print(p19)

# Ridgeline plot (density by group)
if (!require(ggridges)) {
  install.packages("ggridges")
  library(ggridges)
}

p20 <- ggplot(iris, aes(x = Sepal.Length, y = Species, fill = Species)) +
  geom_density_ridges(alpha = 0.7) +
  labs(title = "Ridgeline Plot",
       x = "Sepal Length", y = "Species") +
  theme_ridges() +
  theme(legend.position = "none")

print(p20)

# Bubble chart
p21 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, 
                       size = Petal.Length, color = Species)) +
  geom_point(alpha = 0.7) +
  scale_size_continuous(range = c(2, 10), name = "Petal Length") +
  labs(title = "Bubble Chart",
       x = "Sepal Length", y = "Sepal Width")

print(p21)

cat("\n")

# =============================================================================
# PRACTICAL EXAMPLES
# =============================================================================

cat("8. PRACTICAL EXAMPLES\n")
cat("=====================\n\n")

# Example 1: Business Dashboard
cat("Example 1: Sales Performance Dashboard\n")
# Create business data
business_data <- data.frame(
  month = rep(month.abb, 2),
  year = rep(c(2023, 2024), each = 12),
  sales = c(runif(12, 45000, 65000), runif(12, 50000, 70000)),
  region = rep(c("North", "South", "East", "West"), 6),
  product = rep(c("Product A", "Product B", "Product C"), 8)
)

# Multi-panel dashboard
p22 <- ggplot(business_data, aes(x = month, y = sales, color = factor(year))) +
  geom_line(aes(group = year), size = 1.2) +
  geom_point(size = 2) +
  facet_grid(region ~ .) +
  scale_y_continuous(labels = scales::dollar_format()) +
  labs(title = "Regional Sales Performance",
       subtitle = "Year-over-year comparison by region",
       x = "Month", y = "Sales Revenue",
       color = "Year") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        strip.text.y = element_text(angle = 0))

print(p22)

# Example 2: Scientific Publication Plot
cat("\nExample 2: Scientific Publication Quality Plot\n")
# Create experimental data
experimental_data <- data.frame(
  dose = rep(c(0, 5, 10, 25, 50, 100), each = 6),
  response = c(rnorm(6, 10, 2), rnorm(6, 15, 2), rnorm(6, 25, 3),
               rnorm(6, 40, 4), rnorm(6, 55, 5), rnorm(6, 65, 4)),
  treatment = rep(c("Control", "Treatment A", "Treatment B"), 12)
)

p23 <- ggplot(experimental_data, aes(x = dose, y = response, color = treatment)) +
  geom_point(position = position_jitter(width = 2), alpha = 0.6, size = 2) +
  stat_summary(fun = mean, geom = "line", size = 1.2) +
  stat_summary(fun = mean, geom = "point", size = 3, shape = 21, 
               fill = "white", stroke = 1.5) +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 3) +
  scale_x_continuous(breaks = c(0, 5, 10, 25, 50, 100)) +
  scale_color_manual(values = c("#E74C3C", "#3498DB", "#2ECC71")) +
  labs(title = "Dose-Response Relationship",
       subtitle = "Effect of treatment on cellular response",
       x = "Dose (μg/mL)", 
       y = "Response (arbitrary units)",
       color = "Treatment Group",
       caption = "Error bars represent standard error of the mean") +
  theme_classic() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    plot.subtitle = element_text(size = 12),
    axis.title = element_text(size = 12),
    legend.position = "bottom",
    panel.grid.major.y = element_line(color = "gray90", size = 0.5)
  )

print(p23)

# Example 3: Time Series Analysis
cat("\nExample 3: Time Series Visualization\n")
# Create time series data
dates <- seq(as.Date("2020-01-01"), as.Date("2024-12-31"), by = "week")
ts_data <- data.frame(
  date = dates,
  value = cumsum(rnorm(length(dates), 0, 1)) + 
          10 * sin(2 * pi * as.numeric(dates) / 365.25) + 100,
  trend = seq(100, 120, length.out = length(dates)),
  seasonal = 10 * sin(2 * pi * as.numeric(dates) / 365.25)
)

p24 <- ggplot(ts_data, aes(x = date)) +
  geom_ribbon(aes(ymin = value - 5, ymax = value + 5), 
              alpha = 0.3, fill = "lightblue") +
  geom_line(aes(y = value), color = "darkblue", size = 1) +
  geom_line(aes(y = trend), color = "red", linetype = "dashed", size = 1) +
  scale_x_date(date_labels = "%Y", date_breaks = "1 year") +
  labs(title = "Time Series Analysis",
       subtitle = "Observed values with trend and confidence interval",
       x = "Date", y = "Value",
       caption = "Blue line: observed data, Red dashed: trend, 
                  Shaded area: confidence interval") +
  theme_minimal() +
  theme(plot.caption = element_text(size = 9, color = "gray60"))

print(p24)

cat("\n")

# =============================================================================
# SAVING HIGH-QUALITY PLOTS
# =============================================================================

cat("9. SAVING HIGH-QUALITY PLOTS\n")
cat("============================\n\n")

cat("Demonstrating how to save publication-quality plots...\n")

# Create a final polished plot
final_plot <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, 
                              color = Species, shape = Species)) +
  geom_point(size = 3, alpha = 0.8) +
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed") +
  scale_color_manual(values = c("#E74C3C", "#3498DB", "#2ECC71"),
                    name = "Species") +
  scale_shape_manual(values = c(16, 17, 18), name = "Species") +
  labs(title = "Relationship between Sepal Length and Width",
       subtitle = "Data from the famous iris dataset",
       x = "Sepal Length (cm)", 
       y = "Sepal Width (cm)",
       caption = "Source: Fisher's Iris Dataset") +
  theme_classic() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 12, hjust = 0.5),
    axis.title = element_text(size = 12),
    legend.position = "bottom",
    legend.box = "horizontal"
  )

print(final_plot)

# Save in different formats
ggsave("iris_analysis.png", final_plot, width = 10, height = 8, dpi = 300)
ggsave("iris_analysis.pdf", final_plot, width = 10, height = 8)
ggsave("iris_analysis.eps", final_plot, width = 10, height = 8)

cat("High-quality plots saved as:\n")
cat("- iris_analysis.png (300 DPI)\n")
cat("- iris_analysis.pdf (vector format)\n")
cat("- iris_analysis.eps (publication format)\n\n")

# =============================================================================
# ANIMATION WITH GGANIMATE (OPTIONAL)
# =============================================================================

cat("10. ANIMATION CAPABILITIES\n")
cat("==========================\n\n")

cat("Note: For animations, install and load gganimate package\n")
cat("Example animation code:\n")
cat("library(gganimate)\n")
cat("animated_plot <- ggplot(data) + geom_*() + transition_*()\n")
cat("anim <- animate(animated_plot)\n")
cat("anim_save('animation.gif', anim)\n\n")

cat("=== Tutorial Complete ===\n")
cat("You've mastered ggplot2 visualization!\n")
cat("Key concepts covered:\n")
cat("- Grammar of Graphics principles\n")
cat("- Aesthetic mappings and geoms\n")
cat("- Statistical transformations\n")
cat("- Faceting and themes\n")
cat("- Color scales and customization\n")
cat("- Professional publication-quality plots\n\n")

# Clean up generated files
if(file.exists("iris_analysis.png")) file.remove("iris_analysis.png")
if(file.exists("iris_analysis.pdf")) file.remove("iris_analysis.pdf")
if(file.exists("iris_analysis.eps")) file.remove("iris_analysis.eps")

cat("Note: Example files were created and cleaned up for demo purposes\n")
cat("In practice, save your visualizations for reports and presentations!\n")