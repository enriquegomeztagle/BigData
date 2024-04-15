# Load necessary libraries
library(ggplot2)
library(readr)

# Load data from CSV, specifying column names directly, and suppress column type messages
data <- read_csv("./csvs/best_lap_times_per_gp.csv", 
                 col_names = c('GPName', 'BestLapTime'),
                 show_col_types = FALSE)

# Generate a dot plot treating lap times as categorical data
plot <- ggplot(data, aes(x = GPName, y = BestLapTime)) +
  geom_point() +
  theme_minimal() +
  labs(title = "Best Lap Times per Grand Prix",
       x = "Grand Prix",
       y = "Best Lap Time") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5),  # Rotate x labels for readability
        axis.text.y = element_text(angle = 0, hjust = 1))  # Adjust y labels for better visibility

# Display the plot
print(plot)

# Optionally, save the plot to a file
ggsave("./graphs/best_lap_times_per_gp_dotplot.png", plot, width = 12, height = 8, dpi = 300)
