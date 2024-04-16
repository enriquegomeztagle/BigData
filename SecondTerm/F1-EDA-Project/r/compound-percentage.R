library(ggplot2)
library(readr)
library(dplyr)

data <- read_csv("./csvs/total_laps_per_tire_compound.csv", 
                 col_names = c("Compound", "TotalLaps"))

data <- data %>%
  mutate(Percentage = TotalLaps / sum(TotalLaps) * 100)


levels(data$Compound) <- c("HARD", "INTERMEDIATE", "MEDIUM", "SOFT", "WET")


plot <- ggplot(data, aes(x = "", y = TotalLaps, fill = Compound)) +
  geom_bar(width = 1, stat = "identity", color = "black") +
  coord_polar(theta = "y") +
  geom_text(aes(label = sprintf("%1.1f%%", Percentage)), position = position_stack(vjust = 0.5)) +
  scale_fill_manual(values = c("HARD" = "white", "MEDIUM" = "yellow", "SOFT" = "red", "INTERMEDIATE" = "green", "WET" = "blue")) +
  guides(fill = guide_legend(override.aes = list(label = levels(data$Compound)))) + 
  theme_void() +
  labs(title = "Total Laps by Tire Compound")

print(plot)

ggsave("./graphs/total_laps_by_compound_pie_chart.png", plot, width = 10, height = 8, dpi = 300)
