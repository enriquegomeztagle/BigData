library(ggplot2)
library(readr)

data <- read_csv("./csvs/best_lap_times_per_gp.csv", 
                 col_names = c('GPName', 'BestLapTime'),
                 show_col_types = FALSE)

plot <- ggplot(data, aes(x = GPName, y = BestLapTime)) +
  geom_point() +
  theme_minimal() +
  labs(title = "Best Lap Times per Grand Prix",
       x = "Grand Prix",
       y = "Best Lap Time") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5),
        axis.text.y = element_text(angle = 0, hjust = 1))

print(plot)

ggsave("./graphs/best_lap_times_per_gp_dotplot.png", plot, width = 12, height = 8, dpi = 300)
