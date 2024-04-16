library(ggplot2)
library(readr)

data <- read_csv("./csvs/driver_lap_completion.csv", 
                 col_names = c('Driver', 'CompletedLaps', 'IncompleteLaps', 'PercentageCompleted', 'PercentageIncomplete'),
                 show_col_types = FALSE)

plot <- ggplot(data, aes(x = CompletedLaps, y = PercentageCompleted, label = Driver)) +
  geom_point() +
  geom_text(vjust = -0.5, hjust = 0.5, color = "blue", check_overlap = TRUE) +
  theme_minimal() +
  labs(title = "Correlation between Completed Laps and Percentage Completion",
       x = "Completed Laps",
       y = "Percentage of Laps Completed (%)") +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.text.x = element_text(angle = 45, vjust = 1))  

print(plot)

ggsave("./graphs/driver_lap_completion_scatter_plot.png", plot, width = 12, height = 8, dpi = 300)
