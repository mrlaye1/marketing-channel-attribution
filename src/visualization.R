# --------------------------------------------------
# Attribution Visualization
# --------------------------------------------------

library(ggplot2)
library(tidyr)

# Load attribution results
attribution_summary <- read.csv("results/attribution_summary.csv",
                                stringsAsFactors = FALSE)

# Convert to long format
plot_data <- attribution_summary %>%
  pivot_longer(
    cols = c(first_touch, last_touch, linear_touch, markov_attribution),
    names_to = "model",
    values_to = "attribution"
  )

# Create comparison bar chart
plot <- ggplot(plot_data,
               aes(x = channel,
                   y = attribution,
                   fill = model)) +
  geom_col(position = "dodge") +
  labs(
    title = "Marketing Channel Attribution Comparison",
    subtitle = "Heuristic Models vs Markov Attribution",
    x = "Marketing Channel",
    y = "Attributed Conversions",
    fill = "Attribution Model"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save figure
ggsave(
  filename = "figures/attribution_comparison.png",
  plot = plot,
  width = 10,
  height = 6
)

message("Visualization complete. Figure saved to figures/attribution_comparison.png")
