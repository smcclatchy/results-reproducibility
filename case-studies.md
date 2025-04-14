---
title: "Case Studies in Irreproducibility"
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- What are some common reasons for irreproducibility?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Describe a conceptual framework for reproducibility.
- Explain how and why adopting reproducible practices benefits research.

::::::::::::::::::::::::::::::::::::::::::::::::

## Problems and solutions to irreproducible research
From here we will look at some common problems in irreproducible research. We
will also discuss ways to overcome these problems. Recall that our definition of
reproducible research means that authors provide all data and code to run 
the analysis again, re-creating the results.

| *Methods*       | *Same Data*     | *Different Data* |
|---------------|:-------------:|------:|
| Same methods          | Reproducibility | Replicability |
| Different methods     | Robustness      | Generalizability |

We will also limit these examples to those that we can examine as analysts. The 
system of rewards and incentives is one that we must work within for the time
being, with an eye toward improving the culture of science. It is not something
that we can change in a day however. As analysts we also can't fix some of the 
human or technical issues that impact an experiment. We can investigate study 
design and statistics, however, in data analysis.

| *Factors*                  | *Examples*                                      |
|----------------------------|-------------------------------------------------|
| Technical                  | Bad reagents or cell lines, natural variability |
| Study design & statistics  | Design flaws, misused methods, batch effects    |
| Human                      | Poor record keeping or sharing, confirmation bias|
| Rewards & incentives       | Fraud, paywalls, perverse incentives            |

::::::::::::::::::::::::::::::::::::: challenge 

## Case 1: The gene set that characterizes early Alzheimer's disease 

K.Q. Watkins and coauthors describe a unique gene set characteristic of early
onset Alzheimer's Disease. The gene expression heatmap from their paper
clearly delineates Alzheimer's patients from a neurotypical control group. 

![heatmap of expression values](../fig/AD_expression_heatmap.png)
Watkins, K. Q., et al. (2022). A unique gene expression signature characterizes 
early Alzheimer's disease. _Nature Alzheimer's_, 33(3), 737-753.

Use the [R script](./code/AD_heatmap.R), the [data](./data/expr_matrix.csv), and 
the [metadata](./data/expr_metadata.csv) to reproduce this plot. 

Can you find other ways to present the (meta)data in the heatmap? 
What do alternate ways of presenting the data show you?

This is a simulated study and publication. Any resemblance to real persons or 
real studies is purely coincidental.

:::::::::::::::  solution

## Solution to Challenge 1

1. You can replace `Diagnosis` with `Batch` in the call the `pheatmap`.

```r
pheatmap(expr_matrix, 
         annotation_col = metadata["Batch"], 
         fontsize_row   = 5)
```

This will show the same heatmap, though in this one the genes delineate the 
batch rather than disease state. This is an example of complete confounding
between batch and disease state. All of the Alzheimer's samples were run in 
the first batch and all the controls in the second. There is no way to
disentangle disease state from batch.

:::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::





::::::::::::::::::::::::::::::::::::: keypoints 

- Reproducibility has many definitions.
- We define reproducibility here as using the same data and methods as the original study.
- Adopting reproducible practices strengthens science and makes it more rigorous.

::::::::::::::::::::::::::::::::::::::::::::::::
