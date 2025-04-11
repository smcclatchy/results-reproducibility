# generate a simulated expression matrix that demonstrates complete confounding
# between disease status and batch

set.seed(123)

# Metadata
n_samples <- 10
batch <- rep(c("Batch1", "Batch2"), each = 5)
diagnosis <- rep(c("AD", "Control"), each = 5)  # Completely confounded with batch

metadata <- data.frame(
  SampleID = paste0("Sample", 1:n_samples),
  Batch = batch,
  Diagnosis = diagnosis
)

# Simulate gene expression for 100 genes
n_genes <- 100
gene_ids <- paste0("Gene", 1:n_genes)

# Simulate baseline expression
expr_matrix <- matrix(rnorm(n_genes * n_samples, mean = 5, sd = 1), 
                      nrow = n_genes)

# Add batch effect (e.g., Batch1 expression is higher)
batch_effect <- ifelse(batch == "Batch1", 2, -2)
expr_matrix <- expr_matrix + matrix(batch_effect, 
                                    nrow = n_genes, 
                                    ncol = n_samples, 
                                    byrow = TRUE)

# Add row and column names
rownames(expr_matrix) <- gene_ids
colnames(expr_matrix) <- metadata$SampleID

# Export the matrix 
write.csv(expr_matrix, file = "../data/expr_matrix.csv", quote = FALSE)




