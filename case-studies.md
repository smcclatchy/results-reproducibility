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
|----------------------------|:-----------------------------------------------:|
| Technical                  | Bad reagents or cell lines, natural variability |
| Study design & statistics  | Design flaws, misused methods, batch effects    |
| Human                      | Poor record keeping or sharing, confirmation bias|
| Rewards & incentives       | Fraud, paywalls, perverse incentives            |

::::::::::::::::::::::::::::::::::::: challenge 

## Case 1: The gene set that characterizes early Alzheimer's disease 

Watkins, K. Q., et al. (2022). A unique gene expression signature characterizes 
early Alzheimer's disease. _Nature Alzheimer's_, 33(3), 737-753.

[heatmap of expression values](../fig/AD_expression_heatmap.png)

:::::::::::::::  solution

## Solution to Challenge 1

Since each treatment is run on only one day, the day effectively becomes
the experimental unit (explain this). Each experimental unit (day) has five
samples (mice), but only one replication of each treatment. There is no
valid way to compare treatments as a result. There is no way to separate
the treatment effect from the day-to-day differences in environment,
equipment setup, personnel, and other extraneous variables.  
This is an example of study design flaws that decrease reproducibility. It can
be remedied with training about batch effects.

:::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::



::::::::::::::::::::::::::::::::::::: callout

Challenge 1 describes a case of **batch effect**, which is a common problem in
biomedical studies. Data are collected in batches that confound treatment 
effects by running all of one category (e.g. treatment, sex, strain) at the same
time. This makes it impossible to quantify the effect of the treatment. 

"To consult the statistician after an experiment is finished is often merely to 
ask him to conduct a post mortem examination. He can perhaps say what the 
experiment died of." - *Sir Ronald A. Fisher, First Session of the Indian 
Statistical Conference, Calcutta, 1938*

::::::::::::::::::::::::::::::::::::::::::::::::



::::::::::::::::::::::::::::::::::::: keypoints 

- Reproducibility has many definitions.
- We define reproducibility here as using the same data and methods as the original study.
- Adopting reproducible practices strengthens science and makes it more rigorous.

::::::::::::::::::::::::::::::::::::::::::::::::
