---
title: "Many Facets of Reproducibility"
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- What is reproducibility?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Describe a conceptual framework for reproducibility.
- Explain how and why adopting reproducible practices benefits research.

::::::::::::::::::::::::::::::::::::::::::::::::

## Introduction

What does reproducibility mean? This is not and easy question to answer because 
it has different definitions depending on the discipline. Reproducibility is 
distinct from replicability, although the two are often used interchangeably 
([Barba, 2018](https://arxiv.org/abs/1802.03311), 
[Schloss, 2018](10.1128/mBio.00525-18)).To start we need to state our definition 
so that we can all be on the same page.

**Reproducible research** Authors provide all the necessary data and code to run 
the analysis again, re-creating the results.

**Replication** A study that arrives at the same scientific findings as another 
study, collecting new data and completing new analyses.

Replication requires reproducibility but has a higher goal to re-run an entire 
study rather than only re-create original results using the same data and code. 
In replication you're running a whole new study, obtaining new data, and running 
a new analysis. 

| *Methods*       | *Same Data*     | *Different Data* |
|---------------|:-------------:|------:|
| Same methods          | Reproducibility | Replicability |
| Different methods     | Robustness      | Generalizability |

The table above is adapted from [The Turing Way](https://the-turing-way.netlify.app/).
When you use the same methods and the same data as the original study and get 
the same results, that is reproducibility. If you get the same results using the 
same data but different methods, such as using a different statistical approach, 
that is robustness. That means the study’s findings are robust to changes in the 
methods. If you are gathering new data and rerunning another study with the same 
methods and get the same findings, that study is replicable. Finally, what we 
all are hoping to be able to achieve is to be able to not only replicate a study 
and get the same results, but to have those results replicate to different 
populations or different analysis methods. That is the gold standard of 
reproducibility and means you are making a big contribution to research.
([Reproducibility for Everyone](https://www.repro4everyone.org/),
[Schloss, 2018](10.1128/mBio.00525-18))

## Reproducibility is not all that matters
Reproducibility is only one aspect we need to try to improve in science. There
are several others as well that influence scientific rigor. We should aim to do 
a little better every time we carry out a study and be aware of these other
aspects of rigorous science.

![Elements of rigorous science from [Reproducibility for Everyone](https://www.repro4everyone.org/)](fig/scientific-rigor.png){alt='A pentagram showing five elements of scientific rigor - logic, experimental redundancy, error analysis, intellectual honesty, and probability and statistics.'}

## Factors that decrease reproducibility
There are many 
[factors affecting reproducibility](https://www.nature.com/articles/d42473-019-00004-y):
technical, human, study design and statistics, and problems with rewards and 
incentives. It's complex in that issues with reproducibility arise out of many 
smaller decisions and environments that we encounter in research.

| *Factors*                  | *Examples*                                      |
|----------------------------|-------------------------------------------------|
| Technical                  | Bad reagents or cell lines, natural variability |
| Study design & statistics  | Design flaws, misused methods, batch effects    |
| Human                      | Poor record keeping or sharing, confirmation bias|
| Rewards & incentives       | Fraud, paywalls, perverse incentives            |

Other examples, like mistakes and lack of training, encompass all of these 
factors - technical, study design, statistical, human, and rewards and 
incentives. It's best to think of this this as an opportunity for us to do 
better, as a community and as as individuals over time, rather than being 
overwhelmed by what has been described as a reproducibility crisis. We need to 
learn a little bit about how to do science better with the new methods, 
information, and understanding that we gain. Think about reproducibility as an 
incremental process. Every time you start a new project, you can make one change 
to make it a little bit more reproducible, to make it a little bit more 
transparent. Then you’re on the right path towards improving and accelerating 
your work. So better methods, more data, more power. Larger studies, less 
pressure to publish, fewer incentives to be first rather than right, sharing 
reagents and code, and sharing all of your information about your statistical 
packages.

We need more incentives to actually reproduce each other's work, and for labs to 
reproduce each other's work. In this lesson we will stay with the simple case
of results reproducibility - using the same data and code to generate the same
results (or not!). This gives us the opportunity to look at some of issues that
prevent even the simplest case of results reproducibility, so that we might
adopt some new practices or change our existing ones a bit.



::::::::::::::::::::::::::::::::::::: challenge 

## Challenge 1: The efficient technician

Your technician colleague finds a way to simplify and expedite an experiment.
The experiment applies four different wheel-running treatments to twenty
different mice over the course of five days. Four mice are treated
individually each day for two hours each with a random selection of the four
treatments. Your clever colleague decides that a simplified protocol would
work just as well and save time. Run treatment 1 five times on day 1,
treatment 2 five times on day 2, and so on. Some overtime would be required
each day but the experiment would be completed in only four days, and then
they can take Friday off!
Does this adjustment make sense to you?  
Can you foresee any problems with the experimental results?  
Which factor(s) decreasing reproducibility does this example demonstrate?

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

