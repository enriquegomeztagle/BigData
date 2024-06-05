# Instalar y cargar las librerías necesarias
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
library(ggplot2)
library(dplyr)
library(tidyr)

# Leer el archivo CSV
team_reliability <- read.csv("/path/to/team-reliability.csv")

# Filtrar las categorías relevantes para Red Bull
relevant_categories <- c("Accident", "Alternator", "Brakes", "Collision", "Collision damage", "Driveshaft", "Electrical", "Electronics", "Engine", "Fuel pressure", "Gearbox")

# Filtrar los datos para las categorías relevantes
filtered_data <- team_reliability %>%
  filter(Status %in% relevant_categories)

# Encontrar los valores máximos y mínimos para cada categoría
max_values <- filtered_data %>%
  group_by(Status) %>%
  summarize(ConstructorName_Max = ConstructorName[which.max(CountStatus)], MaxCount = max(CountStatus))

min_values <- filtered_data %>%
  group_by(Status) %>%
  summarize(ConstructorName_Min = ConstructorName[which.min(CountStatus)], MinCount = min(CountStatus))

# Filtrar los datos de Red Bull
red_bull_data <- filtered_data %>%
  filter(ConstructorName == "Red Bull")

# Combinar los datos de Red Bull con los valores máximos y mínimos
combined_data <- red_bull_data %>%
  left_join(max_values, by = "Status") %>%
  left_join(min_values, by = "Status")

# Preparar los datos para el gráfico usando pivot_longer
graph_data <- combined_data %>%
  pivot_longer(cols = c(CountStatus, MaxCount, MinCount), names_to = "Type", values_to = "Count") %>%
  mutate(Type = recode(Type, "CountStatus" = "Red Bull", "MaxCount" = "Max", "MinCount" = "Min"))

# Crear el gráfico de barras
p <- ggplot(graph_data, aes(x = Status, y = Count, fill = Type)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Red Bull Reliability Issues vs Max and Min Constructors",
       x = "Category",
       y = "Count of Issues",
       fill = "Constructor") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Mostrar el gráfico
print(p)