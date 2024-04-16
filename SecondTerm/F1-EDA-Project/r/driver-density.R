library(ggplot2)
library(readr)

data <- read_csv("./csvs/number_of_drivers_per_gp.csv", 
                 col_names = c("GPName", "Number_Of_Drivers"))

plot <- ggplot(data, aes(x = Number_Of_Drivers)) +
  geom_density(aes(y = after_stat(density)), fill = "steelblue", alpha = 0.7) +
  labs(title = "Density of Number of Drivers in Grand Prix Events",
       x = "Number of Drivers",
       y = "Density") +
  theme_minimal()

print(plot)


ggsave("./graphs/drivers_density.png", plot, width = 12, height = 8, dpi = 300)
