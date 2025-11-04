# Interactive Visualizations in R
# This script demonstrates interactive plotting with plotly, DT, and leaflet
# Covers web-based interactive charts, tables, and maps

# Clear workspace
rm(list = ls())

cat("=== Interactive Visualizations in R ===\n")
cat("Comprehensive guide to interactive plots with plotly, DT, and leaflet\n\n")

# =============================================================================
# PACKAGE INSTALLATION AND LOADING
# =============================================================================

cat("1. PACKAGE SETUP\n")
cat("===============\n\n")

# Install and load required packages
required_packages <- c("plotly", "DT", "leaflet", "ggplot2", "dplyr", "htmlwidgets")

for(package in required_packages) {
  if (!require(package, character.only = TRUE)) {
    cat(sprintf("Installing %s...\n", package))
    install.packages(package)
    library(package, character.only = TRUE)
  }
}

cat("All required packages loaded successfully\n\n")

# =============================================================================
# PLOTLY BASICS
# =============================================================================

cat("2. PLOTLY BASICS\n")
cat("===============\n\n")

# Basic interactive scatter plot
cat("Creating basic interactive scatter plot...\n")
p1 <- plot_ly(data = iris, 
              x = ~Sepal.Length, 
              y = ~Sepal.Width,
              color = ~Species,
              type = 'scatter',
              mode = 'markers',
              marker = list(size = 10, opacity = 0.7)) %>%
  layout(title = "Interactive Iris Scatter Plot",
         xaxis = list(title = "Sepal Length"),
         yaxis = list(title = "Sepal Width"))

# Display plot (in RStudio/browser)
print(p1)

# Interactive line plot
cat("Creating interactive line plot...\n")
time_data <- data.frame(
  date = seq(as.Date("2020-01-01"), as.Date("2024-12-31"), by = "month"),
  value = cumsum(rnorm(60, 0, 2)) + 100,
  category = rep(c("A", "B"), 30)
)

p2 <- plot_ly(data = time_data, 
              x = ~date, 
              y = ~value,
              color = ~category,
              type = 'scatter',
              mode = 'lines+markers') %>%
  layout(title = "Interactive Time Series",
         xaxis = list(title = "Date"),
         yaxis = list(title = "Value"))

print(p2)

# Interactive bar chart
cat("Creating interactive bar chart...\n")
species_count <- iris %>% 
  count(Species)

p3 <- plot_ly(data = species_count,
              x = ~Species,
              y = ~n,
              type = 'bar',
              marker = list(color = c('#FF6B6B', '#4ECDC4', '#45B7D1'))) %>%
  layout(title = "Interactive Bar Chart - Species Count",
         xaxis = list(title = "Species"),
         yaxis = list(title = "Count"))

print(p3)

cat("\n")

# =============================================================================
# ADVANCED PLOTLY FEATURES
# =============================================================================

cat("3. ADVANCED PLOTLY FEATURES\n")
cat("===========================\n\n")

# 3D scatter plot
cat("Creating 3D interactive scatter plot...\n")
p4 <- plot_ly(data = iris,
              x = ~Sepal.Length,
              y = ~Sepal.Width,
              z = ~Petal.Length,
              color = ~Species,
              type = 'scatter3d',
              mode = 'markers',
              marker = list(size = 5)) %>%
  layout(title = "3D Interactive Scatter Plot",
         scene = list(
           xaxis = list(title = "Sepal Length"),
           yaxis = list(title = "Sepal Width"),
           zaxis = list(title = "Petal Length")
         ))

print(p4)

# Interactive heatmap
cat("Creating interactive heatmap...\n")
correlation_matrix <- cor(iris[,1:4])

p5 <- plot_ly(z = correlation_matrix,
              x = colnames(correlation_matrix),
              y = rownames(correlation_matrix),
              type = "heatmap",
              colorscale = "RdBu",
              zmin = -1, zmax = 1) %>%
  layout(title = "Interactive Correlation Heatmap")

print(p5)

# Subplot example
cat("Creating subplot with multiple charts...\n")
p6a <- plot_ly(iris, x = ~Sepal.Length, y = ~Sepal.Width, 
               color = ~Species, type = 'scatter', mode = 'markers') %>%
  layout(showlegend = FALSE)

p6b <- plot_ly(iris, x = ~Species, y = ~Sepal.Length, 
               color = ~Species, type = 'box') %>%
  layout(showlegend = FALSE)

p6 <- subplot(p6a, p6b, nrows = 1, shareY = FALSE) %>%
  layout(title = "Interactive Subplot Example")

print(p6)

# Animated plot
cat("Creating animated plot...\n")
# Create sample data for animation
anim_data <- data.frame(
  year = rep(2010:2020, each = 3),
  country = rep(c("USA", "China", "India"), 11),
  gdp = c(14.5, 5.9, 1.7, 15.0, 6.6, 1.8, 15.5, 7.3, 1.9,
          16.0, 8.0, 2.0, 16.5, 8.7, 2.1, 17.0, 9.4, 2.2,
          17.5, 10.1, 2.3, 18.0, 10.8, 2.4, 18.5, 11.5, 2.5,
          19.0, 12.2, 2.6, 19.5, 12.9, 2.7),
  population = rep(c(310, 1340, 1210), 11)
)

p7 <- anim_data %>%
  plot_ly(x = ~gdp, y = ~population, color = ~country,
          frame = ~year, type = 'scatter', mode = 'markers',
          marker = list(size = 15, opacity = 0.7)) %>%
  layout(title = "Animated GDP vs Population",
         xaxis = list(title = "GDP (Trillions USD)"),
         yaxis = list(title = "Population (Millions)"))

print(p7)

cat("\n")

# =============================================================================
# CONVERTING GGPLOT TO PLOTLY
# =============================================================================

cat("4. CONVERTING GGPLOT TO PLOTLY\n")
cat("==============================\n\n")

cat("Converting ggplot2 plots to interactive plotly...\n")

# Create ggplot
gg_plot <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, 
                           color = Species, size = Petal.Length)) +
  geom_point(alpha = 0.7) +
  theme_minimal() +
  labs(title = "Iris Dataset Visualization",
       x = "Sepal Length", y = "Sepal Width")

# Convert to plotly
p8 <- ggplotly(gg_plot)
print(p8)

# Advanced ggplot conversion
gg_facet <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(color = Species)) +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~Species) +
  theme_minimal()

p9 <- ggplotly(gg_facet)
print(p9)

cat("\n")

# =============================================================================
# INTERACTIVE DATA TABLES WITH DT
# =============================================================================

cat("5. INTERACTIVE DATA TABLES\n")
cat("==========================\n\n")

cat("Creating interactive data tables...\n")

# Basic interactive table
dt1 <- DT::datatable(iris,
                     caption = "Interactive Iris Dataset",
                     options = list(pageLength = 10,
                                   scrollX = TRUE))
print(dt1)

# Advanced table with formatting
sales_data <- data.frame(
  Product = c("Laptop", "Mouse", "Keyboard", "Monitor", "Printer"),
  Price = c(999.99, 25.50, 75.00, 299.99, 199.99),
  Sales = c(150, 500, 200, 75, 50),
  Revenue = c(149998.5, 12750, 15000, 22499.25, 9999.5),
  Growth = c(0.15, -0.05, 0.08, 0.12, -0.02)
)

dt2 <- DT::datatable(sales_data,
                     caption = "Sales Performance Dashboard",
                     options = list(
                       pageLength = 5,
                       scrollX = TRUE,
                       dom = 'Bfrtip',
                       buttons = c('copy', 'csv', 'excel', 'pdf')
                     )) %>%
  DT::formatCurrency(c("Price", "Revenue"), currency = "$") %>%
  DT::formatPercentage("Growth", digits = 1) %>%
  DT::formatStyle("Growth",
                  backgroundColor = DT::styleInterval(0, c("lightcoral", "lightgreen")))

print(dt2)

# Editable table
dt3 <- DT::datatable(head(iris, 10),
                     caption = "Editable Table",
                     editable = TRUE,
                     options = list(pageLength = 5))
print(dt3)

cat("\n")

# =============================================================================
# INTERACTIVE MAPS WITH LEAFLET
# =============================================================================

cat("6. INTERACTIVE MAPS\n")
cat("==================\n\n")

cat("Creating interactive maps...\n")

# Basic map
map1 <- leaflet() %>%
  addTiles() %>%
  setView(lng = -98.5795, lat = 39.8283, zoom = 4) %>%
  addMarkers(lng = -74.0059, lat = 40.7128, 
             popup = "New York City") %>%
  addMarkers(lng = -118.2437, lat = 34.0522, 
             popup = "Los Angeles") %>%
  addMarkers(lng = -87.6298, lat = 41.8781, 
             popup = "Chicago")

print(map1)

# Map with custom markers and data
cities_data <- data.frame(
  city = c("New York", "Los Angeles", "Chicago", "Houston", "Phoenix"),
  lat = c(40.7128, 34.0522, 41.8781, 29.7604, 33.4484),
  lng = c(-74.0059, -118.2437, -87.6298, -95.3698, -112.0740),
  population = c(8175133, 3971883, 2695598, 2320268, 1680992),
  state = c("NY", "CA", "IL", "TX", "AZ")
)

# Create color palette based on population
pal <- colorNumeric(palette = "YlOrRd", domain = cities_data$population)

map2 <- leaflet(cities_data) %>%
  addTiles() %>%
  addCircleMarkers(
    lng = ~lng, lat = ~lat,
    radius = ~sqrt(population)/1000,
    color = ~pal(population),
    stroke = FALSE,
    fillOpacity = 0.7,
    popup = ~paste(city, "<br>Population:", 
                   format(population, big.mark = ","))
  ) %>%
  addLegend(
    position = "bottomright",
    pal = pal,
    values = ~population,
    title = "Population"
  )

print(map2)

# Choropleth map example (conceptual)
cat("For choropleth maps, you would typically:\n")
cat("1. Load geographic data (shapefiles, GeoJSON)\n")
cat("2. Join with your data\n")
cat("3. Use addPolygons() with fillColor based on data\n\n")

cat("\n")

# =============================================================================
# DASHBOARD CREATION
# =============================================================================

cat("7. CREATING INTERACTIVE DASHBOARDS\n")
cat("==================================\n\n")

cat("Dashboard components example:\n")

# Create multiple interactive elements
# Sales overview
monthly_sales <- data.frame(
  month = month.abb,
  sales_2023 = runif(12, 40000, 80000),
  sales_2024 = runif(12, 45000, 85000)
)

dashboard_plot1 <- plot_ly(monthly_sales) %>%
  add_trace(x = ~month, y = ~sales_2023, type = 'scatter', mode = 'lines+markers',
            name = '2023', line = list(color = '#1f77b4')) %>%
  add_trace(x = ~month, y = ~sales_2024, type = 'scatter', mode = 'lines+markers',
            name = '2024', line = list(color = '#ff7f0e')) %>%
  layout(title = "Monthly Sales Comparison",
         xaxis = list(title = "Month"),
         yaxis = list(title = "Sales ($)"))

print(dashboard_plot1)

# Regional performance
regional_data <- data.frame(
  region = c("North", "South", "East", "West"),
  revenue = c(250000, 180000, 320000, 200000),
  growth = c(0.15, 0.08, 0.22, 0.12)
)

dashboard_plot2 <- plot_ly(regional_data,
                          x = ~region, y = ~revenue,
                          type = 'bar',
                          marker = list(color = ~growth,
                                      colorscale = 'RdYlGn',
                                      showscale = TRUE,
                                      colorbar = list(title = "Growth Rate"))) %>%
  layout(title = "Revenue by Region",
         xaxis = list(title = "Region"),
         yaxis = list(title = "Revenue ($)"))

print(dashboard_plot2)

cat("Note: For full dashboard creation, consider using:\n")
cat("- shiny: For interactive web applications\n")
cat("- flexdashboard: For dashboard layouts\n")
cat("- shinydashboard: For professional dashboards\n\n")

# =============================================================================
# CUSTOMIZATION AND STYLING
# =============================================================================

cat("8. CUSTOMIZATION AND STYLING\n")
cat("============================\n\n")

cat("Advanced customization examples...\n")

# Custom styled plot
custom_plot <- plot_ly(iris, x = ~Sepal.Length, y = ~Sepal.Width,
                      color = ~Species, type = 'scatter', mode = 'markers',
                      marker = list(size = 12, opacity = 0.8,
                                   line = list(width = 2, color = 'white'))) %>%
  layout(
    title = list(text = "Custom Styled Interactive Plot",
                font = list(size = 20, color = '#2c3e50')),
    xaxis = list(title = "Sepal Length (cm)",
                titlefont = list(size = 16),
                tickfont = list(size = 12),
                gridcolor = '#ecf0f1'),
    yaxis = list(title = "Sepal Width (cm)",
                titlefont = list(size = 16),
                tickfont = list(size = 12),
                gridcolor = '#ecf0f1'),
    plot_bgcolor = '#f8f9fa',
    paper_bgcolor = '#ffffff',
    legend = list(orientation = "h",
                 x = 0.5, xanchor = 'center',
                 y = -0.2),
    margin = list(l = 80, r = 80, t = 100, b = 80)
  )

print(custom_plot)

# Add annotations and shapes
annotated_plot <- plot_ly(iris, x = ~Sepal.Length, y = ~Sepal.Width,
                         color = ~Species, type = 'scatter', mode = 'markers') %>%
  layout(title = "Plot with Annotations") %>%
  add_annotations(
    x = 6.5, y = 4.0,
    text = "Outlier Region",
    showarrow = TRUE,
    arrowhead = 2,
    arrowsize = 1,
    arrowwidth = 2,
    arrowcolor = "red"
  ) %>%
  add_shapes(
    type = "circle",
    x0 = 6.0, x1 = 7.0, y0 = 3.5, y1 = 4.5,
    line = list(color = "red", dash = "dash")
  )

print(annotated_plot)

cat("\n")

# =============================================================================
# SAVING AND SHARING
# =============================================================================

cat("9. SAVING AND SHARING INTERACTIVE PLOTS\n")
cat("=======================================\n\n")

cat("Methods for saving interactive visualizations:\n")

# Save as HTML
final_interactive_plot <- plot_ly(iris, x = ~Sepal.Length, y = ~Sepal.Width,
                                 color = ~Species, type = 'scatter', mode = 'markers') %>%
  layout(title = "Final Interactive Visualization")

# Save methods (examples)
cat("# Save as standalone HTML file:\n")
cat("htmlwidgets::saveWidget(plot, 'interactive_plot.html')\n\n")

cat("# Save as static image:\n")
cat("orca(plot, 'plot.png')\n")
cat("orca(plot, 'plot.pdf')\n\n")

cat("# Embed in R Markdown:\n")
cat("Simply include the plot object in your R Markdown document\n\n")

cat("# Share via web:\n")
cat("- Upload HTML file to web server\n")
cat("- Use Plotly's online service\n")
cat("- Embed in Shiny applications\n\n")

# =============================================================================
# PERFORMANCE TIPS
# =============================================================================

cat("10. PERFORMANCE TIPS\n")
cat("===================\n\n")

cat("Tips for better performance with interactive plots:\n")
cat("1. Limit data points for large datasets (sampling/aggregation)\n")
cat("2. Use WebGL rendering for many points: add_trace(..., mode = 'markers+lines')\n")
cat("3. Optimize color scales and reduce unnecessary styling\n")
cat("4. Consider data preprocessing before plotting\n")
cat("5. Use appropriate plot types for your data size\n\n")

# Example with large dataset optimization
large_data <- data.frame(
  x = rnorm(10000),
  y = rnorm(10000),
  category = sample(letters[1:5], 10000, replace = TRUE)
)

# Sample for better performance
sampled_data <- large_data[sample(nrow(large_data), 1000), ]

optimized_plot <- plot_ly(sampled_data, x = ~x, y = ~y, color = ~category,
                         type = 'scattergl', mode = 'markers',
                         marker = list(size = 4)) %>%
  layout(title = "Optimized Plot (Sampled Data)")

print(optimized_plot)

cat("\n=== Tutorial Complete ===\n")
cat("You've mastered interactive visualizations in R!\n\n")
cat("Key packages and concepts covered:\n")
cat("- plotly: Interactive web-based plots\n")
cat("- DT: Interactive data tables\n")
cat("- leaflet: Interactive maps\n")
cat("- ggplotly: Convert ggplot2 to interactive\n")
cat("- htmlwidgets: Save and share interactive content\n\n")

cat("Next steps:\n")
cat("- Explore shiny for full interactive applications\n")
cat("- Learn flexdashboard for dashboard creation\n")
cat("- Practice with real-world datasets\n")
cat("- Experiment with advanced plotly features\n")