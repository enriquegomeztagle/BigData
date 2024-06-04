
# Load the ggplot2 package
library(ggplot2)

# Read the CSV data
data <- read.csv("new-season-drivers.csv")

# Create a bubble chart
ggplot(data, aes(x = AvgPointsPerSeason, y = Wins, size = Retirements, label = paste(FirstName, LastName))) +
  geom_point(stat="identity", aes(color = BestPerformanceTeam), alpha=0.6) +  # Bubble with transparency and color
  geom_text(aes(label=FirstName), vjust=-1.5, color="black", size=3.5) +  # Adding driver's first name as labels
  labs(title = "Bubble Chart: Average Points Per Season vs Wins",
       x = "Average Points Per Season",
       y = "Wins",
       size = "Retirements") +
  theme_minimal() +  # Minimal theme for better aesthetics
  theme(legend.position = "right", plot.title = element_text(hjust = 0.5))  # Adjust legend and title
