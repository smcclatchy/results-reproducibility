# load data
hippocampus <- read.csv(file = "data/small_sample_data.csv")

# Perform t-tests 
t_test_result <- t.test(Amyloid ~ Group, data = hippocampus)
print(t_test_result)

t_test_result <- t.test(Tau ~ Group, data = hippocampus)
print(t_test_result)

t_test_result <- t.test(HippocampalVolume ~ Group, data = hippocampus)
print(t_test_result)

# visualize biomarkers
boxplot(Amyloid ~ Group, data = hippocampus, main = "Amyloid Beta Levels", 
        ylab = "Level")
boxplot(Tau ~ Group, data = hippocampus, main = "Tau Protein Levels", ylab = "Level")
boxplot(HippocampalVolume ~ Group, data = hippocampus, main = "Hippocampal Volume", 
        ylab = "Volume (cm³)")
