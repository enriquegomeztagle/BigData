# Instalar y cargar las librerías necesarias
install.packages("ggplot2")
install.packages("gridExtra")
library(ggplot2)
library(gridExtra)

# Leer el archivo CSV
dangerous_tracks <- read.csv("/Users/mascenci/Desktop/BigDataGraphs/dangerous-tracks.csv")

# Filtrar los circuitos especificados
filtered_tracks <- dangerous_tracks[dangerous_tracks$circuitId %in% c(3, 77, 69, 22, 17, 79, 21, 6, 7, 4, 70, 9, 11, 13, 39, 14, 69, 32, 18, 44, 24), ]

# Calcular el promedio de incidentes
average_incidents <- mean(filtered_tracks$total_incidents)

# Dividir los datos en tres partes
split_data <- split(filtered_tracks, ceiling(seq_along(filtered_tracks$circuitId)/7))

# Crear los subplots
p1 <- ggplot(split_data[[1]], aes(x = reorder(circuit_name, total_incidents), y = total_incidents)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_hline(yintercept = average_incidents, linetype = "dotted", color = "red") +
  labs(title = "Above Average Danger",
       x = "Circuit",
       y = "Total Incidents") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  coord_flip()

p2 <- ggplot(split_data[[2]], aes(x = reorder(circuit_name, total_incidents), y = total_incidents)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_hline(yintercept = average_incidents, linetype = "dotted", color = "red") +
  labs(title = "Average Danger",
       x = "Circuit",
       y = "Total Incidents") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  coord_flip()

p3 <- ggplot(split_data[[3]], aes(x = reorder(circuit_name, total_incidents), y = total_incidents)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_hline(yintercept = average_incidents, linetype = "dotted", color = "red") +
  labs(title = "Below Average Danger",
       x = "Circuit",
       y = "Total Incidents") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  coord_flip()

# Combinar los subplots en una sola figura
grid.arrange(p1, p2, p3, ncol = 1)

ggsave("dangerous-tracks.png", plot = plot, width = 10, height = 8, units = "in") 