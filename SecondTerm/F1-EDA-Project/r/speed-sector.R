library(ggplot2)
library(readr)
library(tidyr)
library(dplyr)

data <- read_csv("./csvs/average_speeds_per_sector.csv", 
                 col_names = c('AvgSpeedSector1', 'AvgSpeedSector2', 'AvgSpeedFinalSector'),
                 show_col_types = FALSE)

data_long <- data %>%
  pivot_longer(cols = starts_with("AvgSpeed"),
               names_to = "Sector", values_to = "Average Speed") %>%
  mutate(Sector = factor(Sector, levels = names(data)))

plot <- ggplot(data_long, aes(x = Sector, y = `Average Speed`)) +
  geom_point(size = 4, color = "blue") +
  theme_minimal() +
  labs(title = "Average Speed per Sector",
       x = "Sector",
       y = "Average Speed (Km/h)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(plot)

ggsave("./graphs/average_speeds_per_sector_plot.png", plot, width = 10, height = 6, dpi = 300)
