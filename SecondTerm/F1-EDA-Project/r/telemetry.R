library(ggplot2)
library(readr)

data <- read_csv("./csvs/telemetry_analysis.csv",
                 col_names = c("Date", "RPM", "Speed", "nGear", "Throttle", "Brake", "DRS", "Time", "SessionTime", "RoundNumber", "DriverNumber", "EventName"))

correlation <- cor(data$RPM, data$Speed, use = "complete.obs")

plot <- ggplot(data, aes(x = RPM, y = Speed)) +
  geom_point() + 
  geom_smooth(method = "lm", col = "red") +
  annotate("text", x = max(data$RPM, na.rm = TRUE), y = min(data$Speed, na.rm = TRUE), 
           label = paste("R-squared:", round(correlation^2, digits = 2)), 
           hjust = 1, vjust = 1, color = "red") +
  labs(title = "RPM vs Speed with Trend Line",
       x = "RPM",
       y = "Speed (km/h)")

print(plot)

ggsave("./graphs/avg_speed_vs_rpm.png", plot, width = 12, height = 8, dpi = 300)