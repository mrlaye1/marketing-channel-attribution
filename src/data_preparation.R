# --------------------------------------------------
# Data Preparation for Marketing Channel Attribution
# --------------------------------------------------

library(dplyr)
library(lubridate)

# Load raw data
channel_data <- read.csv("data/channel_raw_data.csv", stringsAsFactors = FALSE)

# Convert visit date to datetime
channel_data$VisitDate <- as.POSIXct(channel_data$VisitDate, tz = "UTC")

# Validate required columns
required_cols <- c("CustomerID", "Channel", "VisitDate", "Conversion")
missing_cols <- setdiff(required_cols, colnames(channel_data))

if (length(missing_cols) > 0) {
  stop(paste("Missing required columns:", paste(missing_cols, collapse = ", ")))
}

# Order touchpoints by customer and time
channel_data <- channel_data %>%
  arrange(CustomerID, VisitDate) %>%
  group_by(CustomerID) %>%
  mutate(Time = row_number()) %>%
  ungroup()

# Select modeling columns
model_data <- channel_data %>%
  select(CustomerID, Channel, Time, Conversion)

# Save prepared data
write.csv(model_data,
          "results/prepared_channel_data.csv",
          row.names = FALSE)

message("Data preparation complete. Output saved to results/prepared_channel_data.csv")
