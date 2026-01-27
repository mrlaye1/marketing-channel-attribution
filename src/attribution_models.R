# --------------------------------------------------
# Attribution Models
# --------------------------------------------------

library(dplyr)
library(ChannelAttribution)

# Load prepared data
model_data <- read.csv("results/prepared_channel_data.csv",
                       stringsAsFactors = FALSE)

# Fit heuristic attribution models
heuristic_results <- heuristic_models(
  model_data,
  var_path = "Channel",
  var_conv = "Conversion"
)

# Fit Markov attribution model
markov_results <- markov_model(
  model_data,
  var_path = "Channel",
  var_conv = "Conversion"
)

# Merge results
attribution_summary <- heuristic_results %>%
  rename(channel_name = channel_name) %>%
  left_join(
    markov_results %>% select(channel_name, total_conversions),
    by = "channel_name"
  )

# Rename for clarity
colnames(attribution_summary) <- c(
  "channel",
  "first_touch",
  "last_touch",
  "linear_touch",
  "markov_attribution"
)

# Save results
write.csv(attribution_summary,
          "results/attribution_summary.csv",
          row.names = FALSE)

message("Attribution modeling complete. Results saved to results/attribution_summary.csv")
