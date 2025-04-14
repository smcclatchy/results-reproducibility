# Load necessary libraries
if (!require("pwr")) install.packages(c("pwr", "effsize"), dependencies = TRUE)
library(pwr)
library(effsize)

set.seed(229)  # For reproducibility

# Simulate a small sample size
n_per_group <- 5  # Small sample size per group
total_n <- n_per_group * 2

# Groups: Mild cognitive impairment (MCI) and Control (CTL)
group <- factor(rep(c("MCI", "CTL"), each = n_per_group))

# Simulate biomarkers with small effect sizes
# Biomarker 1: Amyloid beta (lower in AD)
amyloid_ctl <- rnorm(n_per_group, mean = 1.0, sd = 0.3)
amyloid_mci <- rnorm(n_per_group, mean = 0.85, sd = 0.3)

# Biomarker 2: Tau protein (higher in AD)
tau_ctl <- rnorm(n_per_group, mean = 0.9, sd = 0.2)
tau_mci <- rnorm(n_per_group, mean = 1.05, sd = 0.2)

# Biomarker 3: Hippocampal volume (lower in AD)
hippo_ctl <- rnorm(n_per_group, mean = 3.2, sd = 0.5)
hippo_mci <- rnorm(n_per_group, mean = 3.1, sd = 0.5)

# Combine into data frame
data <- data.frame(
  Group = group,
  Amyloid = c(amyloid_mci, amyloid_ctl),
  Tau = c(tau_mci, tau_ctl),
  HippocampalVolume = c(hippo_mci, hippo_ctl)
)

# View first few rows
print(head(data))

# Perform t-tests 
t_test_result <- t.test(Amyloid ~ Group, data = data)
print(t_test_result)

# Estimate effect size (Cohen's d for Amyloid)
d_result <- cohen.d(Amyloid ~ Group, data = data)
print(d_result)

# Estimate power for Amyloid (small effect size)
# Using observed effect size or assume small (d = 0.3)
power_result <- pwr.t.test(
  d = d_result$estimate,
  n = n_per_group,
  sig.level = 0.05,
  type = "two.sample",
  alternative = "two.sided"
)
print(power_result)

# Optional: visualize biomarkers
boxplot(Amyloid ~ Group, data = data, main = "Amyloid Beta Levels", 
        ylab = "Level")
boxplot(Tau ~ Group, data = data, main = "Tau Protein Levels", ylab = "Level")
boxplot(HippocampalVolume ~ Group, data = data, main = "Hippocampal Volume", 
        ylab = "Volume (cm³)")

# Export the data
write.csv(data, 
          file = "data/small_sample_data.csv", 
          quote = FALSE)

# Export the boxplots
png(filename = "fig/boxplots.png")
boxplot(Amyloid ~ Group, data = data, main = "Amyloid Beta Levels", 
        ylab = "Level")
boxplot(Tau ~ Group, data = data, main = "Tau Protein Levels", ylab = "Level")
boxplot(HippocampalVolume ~ Group, data = data, main = "Hippocampal Volume", 
        ylab = "Volume (cm³)")
dev.off()
