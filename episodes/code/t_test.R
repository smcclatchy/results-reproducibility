# load data
data <- read.csv(file = "data/small_sample_data.csv")

# Perform t-tests (example: Amyloid)
t_test_result <- t.test(Amyloid ~ Group, data = data)
print(t_test_result)

# visualize biomarkers
boxplot(Amyloid ~ Group, data = data, main = "Amyloid Beta Levels", 
        ylab = "Level")
boxplot(Tau ~ Group, data = data, main = "Tau Protein Levels", ylab = "Level")
boxplot(HippocampalVolume ~ Group, data = data, main = "Hippocampal Volume", 
        ylab = "Volume (cm³)")
