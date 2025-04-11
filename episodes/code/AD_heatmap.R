# generate a heatmap of expression data that demonstrates a gene set 
# that discriminates between a diagnosis of AD or control

library(pheatmap)

# familiarize yourself with the data a bit
head(metadata)
head(expr_matrix[, 1:5])  # Show first few genes and samples

# Create a heatmap without annotation of diagnosis
pheatmap(expr_matrix)

# Use metadata as annotation to heatmap
# Use diagnosis in annotation
rownames(metadata) <- metadata$SampleID
pheatmap(expr_matrix, 
         annotation_col = metadata["Diagnosis"], 
         fontsize_row   = 5)

# Save the heatmap as a png file
# Remember to turn the graphics device off afterwards
png(filename = "../fig/AD_expression_heatmap.png")
pheatmap(expr_matrix, 
         annotation_col = metadata["Diagnosis"], 
         fontsize_row   = 5)
dev.off()
