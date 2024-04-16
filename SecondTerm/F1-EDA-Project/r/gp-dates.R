library(ggplot2)
library(readr)
library(lubridate)

data <- read_csv("./csvs/gp_names_dates.csv", col_names = c("GPName", "EventDateTime"))

data$EventDateTime <- ymd_hms(data$EventDateTime)

data <- data[order(data$EventDateTime),]

data$ID <- seq_along(data$GPName)

plot <- ggplot(data, aes(xmin = EventDateTime, xmax = EventDateTime + hours(2), ymin = ID - 0.45, ymax = ID + 0.45)) +
  geom_rect(fill = "steelblue", color = "black") +
  scale_x_datetime(date_breaks = "1 month", date_labels = "%b %d") + 
  scale_y_continuous(breaks = data$ID, labels = data$GPName) + 
  labs(title = "F1 Grand Prix Schedule 2023",
       x = "Date",
       y = "Grand Prix") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.text.y = element_text(angle = 0, hjust = 1),
        axis.ticks.x = element_line(color = "black"))

print(plot)

ggsave("./graphs/schedule_gantt.png", plot, width = 16, height = 8, dpi = 300)
