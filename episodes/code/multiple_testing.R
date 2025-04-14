# Load libraries
if (!require("dplyr")) install.packages("dplyr")
library(dplyr)

set.seed(1)

# Generate participant data
n <- 100
data <- data.frame(
  ID = 1:n,
  Group = sample(c("AD", "Control"), n, replace = TRUE),
  Age = round(rnorm(n, 75, 6), 1),
  Sex = sample(c("Male", "Female"), n, replace = TRUE),
  Amyloid = rnorm(n, 1, 0.3),
  Tau = rnorm(n, 1, 0.2),
  Hippocampus = rnorm(n, 3, 0.5),
  RandomBiomarker1 = rnorm(n, 0.2, 0.1),
  RandomBiomarker2 = rnorm(n, 0.5, 0.3),
  RandomBiomarker3 = rnorm(n, 0.1, 0.2),
  RandomBiomarker4 = rnorm(n, 0.8, 0.05),
  RandomBiomarker5 = rnorm(n, 0.05, 0.01),
  RandomBiomarker6 = rnorm(n, 0.6, 0.5),
  RandomBiomarker7 = rnorm(n, 0.08, 0.1 ),
  RandomBiomarker8 = rnorm(n, 0.1, 0.1)
)

# Intentionally misuse 1: Multiple uncorrected t-tests
cat("\n--- Multiple Testing Without Correction ---\n")
p_values <- sapply(data[ , 5:15], function(bio) {
  t.test(bio ~ data$Group)$p.value
})
print(p_values)

# Intentionally misuse 2: P-hacking - try many subgroups
cat("\n--- P-hacking with Subgroups ---\n")
data$AgeGroup <- ifelse(data$Age > 75, "Old", "Young")
young_group <- filter(data, AgeGroup == "Young")
t_test_p_hack <- t.test(young_group$Tau ~ young_group$Group)
print(t_test_p_hack)

# Intentionally misuse 3: Optional stopping (simulate sequential analysis)
cat("\n--- Optional Stopping (Sequential Testing) ---\n")
p_track <- c()
for (i in seq(20, 100, by = 10)) {
  partial_data <- data[1:i, ]
  p <- t.test(partial_data$Amyloid ~ partial_data$Group)$p.value
  p_track <- c(p_track, p)
}
print(p_track)

# Optional: Plot p-value trajectory (Optional Stopping Visualization)
plot(seq(20, 100, by = 10), p_track, type = "b", col = "red", pch = 19,
     main = "Optional Stopping: p-values over increasing sample size",
     xlab = "Sample Size", ylab = "p-value")
abline(h = 0.05, col = "blue", lty = 2)

# Summary
cat("\n--- Summary of Misuses ---\n")
cat("1. Multiple comparisons performed without any correction (e.g., Bonferroni).\n")
cat("2. Subgroup analysis conducted post hoc without proper justification.\n")
cat("3. Optional stopping inflates false positives by cherry-picking sample sizes.\n")
