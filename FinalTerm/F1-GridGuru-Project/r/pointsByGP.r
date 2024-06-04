library(readr)
library(ggplot2)
library(cluster)

# Cargar los datos
gp_data <- read_csv("pointsByGP.csv")

scaled_points <- scale(gp_data$avg_points)

set.seed(123) 
clusters <- kmeans(scaled_points, centers=5)

gp_data$cluster <- as.factor(clusters$cluster)

avg_points_by_cluster <- tapply(gp_data$avg_points, gp_data$cluster, mean)
ordered_cluster_names <- names(sort(avg_points_by_cluster, decreasing = TRUE))
labels <- c("High", "Medium-High", "Medium", "Medium-Low", "Low")

gp_data$cluster_label <- factor(gp_data$cluster, levels = ordered_cluster_names, labels = labels)


plot <- ggplot(gp_data, aes(x=reorder(circuit_name, -avg_points), y=avg_points, fill=cluster_label)) +
  geom_bar(stat="identity") +
  scale_fill_manual(values=c("High"="red", "Medium-High"="orange", "Medium"="green", "Medium-Low"="blue", "Low"="purple")) +
  theme_minimal() +
  labs(title="Cluster Analysis of Circuits by Average Points",
       x="Circuit", y="Average Points", fill="Performance Tier") +
  theme(axis.text.x = element_text(angle=90, hjust=1))

ggsave("cluster_average_points_per_circuit.png", plot, width=10, height=8, dpi=300)
