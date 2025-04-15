library(tidyverse)

# load data
data <- read.csv(file = "data/multiple_testing_data.csv")

# apply a t-test across all variables from columns 5 to 15
p_values <- data %>% summarize(across(5:15, 
                                      function(bio)
                                        t.test(bio ~ data$Group)$p.value))
print(p_values)