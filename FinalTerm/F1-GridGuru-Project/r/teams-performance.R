library(ggplot2)
library(dplyr)

# Cargar los datos desde un archivo CSV
data <- read.csv("teams-performance.csv")


# Filtrar los datos para incluir solo los constructores específicos
selected_constructors <- c("Mercedes", "Red Bull", "Ferrari", "McLaren", "Benetton", "Alfa Romeo")
filtered_data <- data %>% 
  filter(teamName %in% selected_constructors)

# Creando el gráfico de barras
ggplot(filtered_data, aes(x = teamName, y = totalWins, fill = teamName)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Total de Victorias de Carrera por Equipo",
       x = "Equipo",
       y = "Número de Victorias") +
  scale_fill_brewer(palette = "Set1")  # Usando una paleta de colores
