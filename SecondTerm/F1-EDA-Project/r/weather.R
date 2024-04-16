library(ggplot2)
library(readr)
library(dplyr)

data <- read_csv("./csvs/performance_under_weather_conditions.csv", 
                 col_names = c("EventName", "Compound", "AvgLapTime", "TemperatureCondition", "HumidityCondition"))

plot <- ggplot(data, aes(x = Compound, y = AvgLapTime, color = TemperatureCondition, shape = HumidityCondition)) +
  geom_point(size = 4) +
  facet_wrap(~EventName) + 
  theme_minimal() +
  labs(title = "Average Lap Time by Tire Compound under Weather Conditions",
       x = "Tire Compound",
       y = "Average Lap Time (min)",
       color = "Temperature",
       shape = "Humidity") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_color_manual(values = c("Hot" = "red", "Mild" = "orange", "Cold" = "blue")) # Aquí añadimos el signo +

print(plot)

ggsave("./graphs/performance_weather_conditions_interaction_plot.png", plot, width = 12, height = 8, dpi = 300)
