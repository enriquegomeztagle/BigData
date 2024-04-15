library(ggplot2)
library(readr)

data <- read_csv("./csvs/average_laps_per_gp.csv", 
                 col_names = c('GP Name', 'Average Laps'),
                 show_col_types = FALSE)

plot <- ggplot(data, aes(x = `GP Name`, y = `Average Laps`, fill = `GP Name`)) +
  geom_bar(stat = "identity", color = "black", show.legend = FALSE) +
  theme_minimal() +
  labs(title = "Average Number of Laps per Grand Prix",
       x = "Grand Prix",
       y = "Average Laps Completed") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(plot)

ggsave("./graphs/average_laps_per_gp_plot.png", plot, width = 10, height = 6, dpi = 300)
