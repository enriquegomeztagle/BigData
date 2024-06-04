# Instalar y cargar las librerías necesarias
install.packages("ggplot2")
library(ggplot2)

# Leer el archivo CSV
sector_accidents <- read.csv("/Users/mascenci/Desktop/BigDataGraphs/sectorAccidents.csv")

# Filtrar los circuitos especificados
filtered_sector_accidents <- sector_accidents[sector_accidents$circuitId %in% c(3, 77, 69, 22, 17, 79, 21, 6, 7, 4, 70, 9, 11, 13, 39, 14, 69, 32, 18, 44, 24), ]

# Crear el gráfico de burbujas con colores ajustados según el tamaño
p <- ggplot(filtered_sector_accidents, aes(x = reorder(sector, -total_accidents), y = circuit_name, size = total_accidents, color = total_accidents)) +
  geom_point(alpha = 0.7) +
  scale_color_gradientn(colors = c("blue", "orange", "red"), values = scales::rescale(c(500, 1000, 1500))) +
  labs(title = "Total Accidents by Circuit and Sector",
       x = "Sector",
       y = "Circuit",
       size = "Total Accidents",
       color = "Total Accidents") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Mostrar el gráfico
print(p)