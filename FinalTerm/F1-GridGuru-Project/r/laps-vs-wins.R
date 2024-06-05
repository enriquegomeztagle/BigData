# Instalar y cargar las librerías necesarias
install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)

# Leer el archivo CSV
teams_performance <- read.csv("/Users/mascenci/Desktop/BigDataGraphs/teams-performance.csv")

# Filtrar los equipos con total de victorias y total de vueltas mayor a 0
filtered_teams <- teams_performance %>%
  filter(totalWins > 0 & totalLap > 0)

# Calcular la tasa de rendimiento como porcentaje (total de victorias entre total de vueltas, multiplicado por 100)
filtered_teams <- filtered_teams %>%
  mutate(performance_rate = (totalWins / totalLap) * 100)

# Seleccionar los 10 equipos con la mayor tasa de rendimiento
top_teams <- filtered_teams %>%
  arrange(desc(performance_rate)) %>%
  head(10)

# Asegurarse de incluir a Red Bull
red_bull <- filtered_teams %>%
  filter(teamName == "Red Bull")

top_teams <- bind_rows(top_teams, red_bull) %>%
  distinct()  # Eliminar duplicados en caso de que Red Bull ya esté en el top 10

# Crear el gráfico de barras
p <- ggplot(top_teams, aes(x = reorder(teamName, -performance_rate), y = performance_rate, fill = teamName)) +
  geom_bar(stat = "identity") +
  labs(title = "Top 10 Teams by Performance Rate (Wins per Lap)",
       x = "Team",
       y = "Performance Rate (%)",
       fill = "Team") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Mostrar el gráfico
print(p)