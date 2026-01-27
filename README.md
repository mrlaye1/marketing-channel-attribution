# Marketing Channel Attribution
Applied Marketing Analytics Project

---

## Overview

In multi-channel marketing environments, customers typically interact with several channels before converting. Despite this, performance measurement is often based on simple attribution rules such as last-touch or first-touch. These approaches can distort how value is assigned across channels and lead to suboptimal budget decisions.

This project compares heuristic attribution methods with a probabilistic Markov chain approach to better understand the contribution of each marketing channel across the full customer journey.

---

## Business Problem

Marketing teams must decide how to allocate budget across channels such as paid search, display, email, and social media. When attribution is overly simplistic, channels that appear late in the customer journey receive disproportionate credit, while channels that initiate or support demand are undervalued.

This can lead to:
- Over-investment in lower-funnel channels
- Under-investment in awareness and consideration channels
- Misleading performance reporting
- Inefficient budget allocation

---

## Objective

The objectives of this project are to:
- Quantify channel contributions using multiple attribution models
- Compare rule-based and probabilistic attribution approaches
- Demonstrate how attribution choice affects analytical conclusions
- Build a clean, reproducible analytics workflow

---

## Data Description

The dataset represents customer-level marketing journeys and includes the following variables:

| Variable | Description |
|---|---|
| CustomerID | Unique identifier for each customer |
| Channel | Marketing channel associated with the interaction |
| VisitDate | Timestamp of the interaction |
| Conversion | Binary indicator of conversion |

---

## Methodology

### Data Preparation

Customer journeys are reconstructed by ordering interactions chronologically for each customer. A sequential index is created to represent the order of touchpoints within each journey.

### Attribution Models

- Heuristic models: first-touch, last-touch, and linear attribution
- Probabilistic model: first-order Markov chain attribution using removal effects

---

## Results

Key findings:
- Last-touch attribution overweights terminal channels
- Upper-funnel and assistive channels gain importance under Markov attribution
- Attribution outcomes vary substantially by model choice

---

## Limitations

- Observational, not causal
- Channel spend not included
- No time-decay or saturation effects

---

## Project Structure

```text
marketing-channel-attribution/
├── README.md
├── data/
│   └── channel_raw_data.csv
├── src/
│   ├── data_preparation.R
│   ├── attribution_models.R
│   └── visualization.R
├── figures/
│   └── attribution_comparison.png
└── results/
    └── attribution_summary.csv

```
---

## Reproducibility

From the project root directory, run:

source("src/data_preparation.R")
source("src/attribution_models.R")
source("src/visualization.R")

Outputs are saved in the results and figures directories.

---

## Tools and Libraries

- R  
- dplyr  
- ggplot2  
- lubridate  
- ChannelAttribution  
- markovchain  

---

## Author

ABDOULAYE DIOP  
Marketing Analytics
