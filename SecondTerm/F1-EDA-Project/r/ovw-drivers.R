library(ggplot2)
library(dplyr)

df <- read.csv("./csvs/driver_performance_analysis.csv", col.names = c("Driver", "Compound", "LapTime", "CompletionRate"))

dot_chart <- ggplot(df, aes(x = LapTime, y = CompletionRate, color = Compound)) +
  geom_point(alpha = 0.5, size = 3) + 
  scale_color_manual(values = c("HARD" = "black", "MEDIUM" = "yellow", "SOFT" = "red")) +
  labs(title = "Dot Chart of Lap Times by Driver",
       x = "Average Lap Time (minutes)",
       y = "Completion Rate (%)",
       color = "Most Used Compound") +
  theme_minimal()

print(dot_chart)

ggsave("./graphs/LapTimesDotChart.png", plot = dot_chart, width = 10, height = 8, dpi = 300)
