library(tidyverse)

# load data
data <- read_csv(file = "data/multiple_testing_data.csv")

# apply t-tests across all variables and save the p-values
pvalues <- data %>% summarize(across(5:15, 
                                     function(bio) t.test(bio ~ data$Group)$p.value)) %>% 
  unlist()


# which p-values are less than 0.05?
pvalues[pvalues < 0.05]

# Success! You found a new biomarker! Time to publish!
