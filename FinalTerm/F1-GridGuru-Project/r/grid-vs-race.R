# Instalar y cargar las librerías necesarias
install.packages("ggplot2")
library(ggplot2)

# Leer el archivo CSV
quali_vs_race <- read.csv("/Users/mascenci/Desktop/BigDataGraphs/quali-vs-race.csv")

# Filtrar los pilotos activos en 2024
active_drivers_2024 <- c(1, 846, 822, 857, 844, 830, 842, 817, 832, 4, 839, 825, 852, 847, 858, 840, 855, 815, 807, 848)
filtered_quali_vs_race <- filtered_quali_vs_race <- quali_vs_race[quali_vs_race$driverId %in% active_drivers_2024, ]

# Crear el gráfico de puntos con colores
p <- ggplot(filtered_quali_vs_race, aes(x = reorder(driver_name, avg_position_change), y = avg_position_change, color = avg_position_change)) +
  geom_point(size = 5) +
  scale_color_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  labs(title = "Average Position Change from Starting grid to Race end for Active Drivers in 2024",
       x = "Driver",
       y = "Average Position Change",
       color = "Position Change") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Mostrar el gráfico
print(p)