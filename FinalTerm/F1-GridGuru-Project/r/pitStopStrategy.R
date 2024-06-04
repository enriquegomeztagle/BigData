library(ggplot2)

# Read the CSV data
data <- read.csv("pitStop-strategy.csv")

plot <- ggplot(data, aes(x = avgDuration, y = numberOfStops, label = constructorName)) +
  geom_point(aes(color = constructorName), alpha = 0.6) +  # Añadimos los puntos con color
  geom_text(vjust = 1.5, hjust = 0.5, color = "black", size = 3) +  # Añadimos etiquetas de texto por encima de los puntos con texto más pequeño
  labs(title = "Scatter Plot: Average Duration vs Number of Stops",
       x = "Average Duration (seconds)",
       y = "Number of Stops",
       color = "Constructor Name") +
  theme_minimal() +
  theme(legend.position = "right")  # Ajusta la posición de la leyenda

# Guardar la gráfica en un archivo con dimensiones más grandes
ggsave("scatter_plot_large.png", plot = plot, width = 10, height = 8, units = "in")  # Ajusta las