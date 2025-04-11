# https://cran.r-project.org/web/packages/batchtma/vignettes/batchtma.html

library(tidyverse)

# We construct a toy dataset of 10 individuals (e.g., tumors), each with 40 
# measurements (e.g., cores on tissue microarrays) per batch. Unlike perhaps in 
# the real world, for each individual tumor, we also have measurements on all 
# the other batches.

df <- tibble(
  # Batches:
  batch = rep(paste0("batch", LETTERS[1:4]), times = 100),
  batchnum = rep(c(1, 5, 2, 3), times = 100),
  # Participants:
  sample = rep(letters[1:10], each = 40),
  # Instead of a confounder, we will use a random variable for now:
  random = runif(n = 400, min = -2, max = 2),
  # The true (usually unobservable biomarker value):
  true = rep(c(2, 2.5, 3, 5, 6, 8, 10, 12, 15, 12), each = 40),
  # The observed biomarker value with random error ("noise"):
  noisy = true + runif(max = true / 3, n = 400) * 4)

# We plot the biomarker values (y-axis) by batch (x-axis). Color/shape 
# symbolizes which participant/tumor the measurements came from. Boxes span from 
# the 25th to the 75th percentile (interquartile range); thick lines indicate 
# medians; red dots indicate means.

df %>% ggplot(aes(batch, noisy)) + 
  geom_boxplot() + 
  geom_jitter(aes(color = sample), alpha=0.5) + 
  stat_summary(fun = "mean", colour = "red", size = 2, geom = "point")


# Add batch effects
# We add systematic differences between batches such that there is differential 
# measurement error between batches in terms of mean and variance. As shown 
# above, true values were the same beyond random error.

df <- df %>%
  # Multiply by batch number to differentially change variance by batch,
  # divide by mean batch number to keep overall variance the same:
  mutate(noisy_batch = noisy * batchnum / mean(batchnum) + 
           # Similarly, change mean value per batch, 
           # keeping overall mean the same:
           batchnum * 3 - mean(batchnum) * 3)

df %>% ggplot(aes(batch, noisy_batch)) + 
  geom_boxplot() + 
  geom_jitter(aes(color = sample), alpha=0.5) + 
  stat_summary(fun = "mean", colour = "red", size = 2, geom = "point") 


# Set up example data with confounding present
# In general, confounding means that exposure and outcome share common causes. 
# Necessary—but not sufficient—properties of a confounder are that it needs to 
# be associated with the exposure (batch) and associated with the outcome(s) 
# (markers). For example, if systematically higher biomarker values due to batch 
# effects occur in a tissue microarray with a higher proportion of aggressive 
# tumors, then batch effect-adjusted biomarker values should account for the 
# differences in proportions of aggressive tumors.

# In the example, a new variable for the biomarker is generated that is affected 
# by both confounding and batch effects. First, biomarker values with random 
# error, noisy, are forced to be associated with the confounder, which in turn 
# is associated with batch. These values, noisy_conf, should be considered the 
# new “ground truth.”

set.seed(123)  # for reproducibility
df <- df %>%
  # Make confounder associated with batch:
  mutate(confounder = round(batchnum + runif(n = 200, max = 2)),
         # Make biomarker values associated with confounder:
         noisy_conf = noisy + confounder * 3 - mean(confounder) * 3)

df %>% ggplot(aes(batch, noisy_conf)) + 
  geom_boxplot() + 
  geom_jitter(aes(color = sample), alpha=0.5) + 
  stat_summary(fun = "mean", colour = "red", size = 2, geom = "point") 

df %>% ggplot(aes(batch, noisy_conf)) + 
  geom_boxplot() + 
  geom_jitter(aes(color = confounder), alpha=0.5) + 
  stat_summary(fun = "mean", colour = "red", size = 2, geom = "point") 

# Second, batch effects for mean and variance are added.

df <- df %>% 
  # Add batch effects to confounded biomarker values:
  mutate(noisy_conf_batch = noisy_conf * batchnum / mean(batchnum) + 
           batchnum * 3 - mean(batchnum) * 3)

df %>% ggplot(aes(batch, noisy_conf_batch)) + 
  geom_boxplot() + 
  geom_jitter(aes(color = sample), alpha=0.5) + 
  stat_summary(fun = "mean", colour = "red", size = 2, geom = "point") 

df %>% ggplot(aes(batch, noisy_conf_batch)) + 
  geom_boxplot() + 
  geom_jitter(aes(color = confounder), alpha=0.5) + 
  stat_summary(fun = "mean", colour = "red", size = 2, geom = "point") 

# label samples a-e as "cases" and the others as "controls"
df <- df %>% 
  # label cases and controls:
  mutate(status = if_else(sample %in% letters[1:5], "case", "control" ))

# reassign the controls in batchC (batch 2) to cases
df <- df %>% mutate(status = ifelse(batchnum == 2 & status == "control",
                                    "case",
                                    status))

df %>% ggplot(aes(status, noisy_conf_batch)) +
  geom_boxplot() +
  geom_jitter(aes(color = batch), alpha=0.5) +
  stat_summary(fun = "mean", colour = "red", size = 2, geom = "point") 
