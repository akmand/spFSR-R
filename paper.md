---
title: 'spFSR: An R Package for Feature Selection, Weighting and Ranking'
tags:
  - R
  - Feature Selection
  - Feature Weighting
  - Feature Ranking
  - Supervised Machine Learning
authors:
  - name: Guo Feng Anders Yeo
    affiliation: 1
  - name: David Akman
    affiliation: 1
  - name: YongKai Wong
    affiliation: 1
  - names: Irene Hudson
    affiliation: 1
affiliations:
 - name: Royal Melbourne Institute of Technology, Australia
   index: 1
date: 21 February 2024

bibliography: paper.bib

---

# Summary


The `spFSR` package is an open source `R` [@R] package available from the Comprehensive `R` Archive Network [@SPpackage]. The package provides feature selection for supervised machine learning problems using an implementation of the spFSR algorithm [@Akm22; @Aks16] with options for simultaneous feature weighting [@Yeo21] as a wrapper method through stochastic optimisation. The spFSR algorithm is an extension to the simultaneous perturbation stochastic approximation (SPSA) algorithm [@Spa92] into the machine learning domain, specifically within the feature space as an optimisation-based wrapper method. SPSA is a stochastic pseudo-gradient descent method which initialises on a real valued solution vector and approximates the gradient through simultaneously perturbing the current solution vector by random offsets from a suitable probability distribution. 

The function `spFeatureSelection()` is an implementation of the spFSR algorithm designed to optimise the feature space, in the form of feature selection, feature weighting and ranking, for both machine learning models and entire machine learning pipelines with respect to any corresponding performance metric. The `spFSR` package has been implemented and designed to be consistent with the syntax and work-flow of the `mlr3` [@mlr3] and `mlr3pipelines` [@mlr3pipelines] `R` packages. Specifically, three specifications are required of the data, model/ wrapper and metric which correspond to the `mlr3` objects the `task`, `learner` and `measure`. The wrapper can be a user-specified machine learning model or pipelines defined with `mlr3pipelines`. If the wrapper is unspecified, the wrapper will select a random forests learner with default parameters from the `mlr3learners` package [@mlr3learners] corresponding to the `task_type`. Moreover, the number of features to select can be specified and utility functions such as `print.spFSR`, `getBestModel()` and `getImportance()`, with additional plotting functions such as `plotImportance()` and `plot.spFSR()`.



# Statement of need

Within the context of supervised machine learning, feature selection is the process of selecting a subset of features which maximise the predictive power of a model. The inclusion of unimportant or noisy features presents two primary drawbacks. The first drawback is technical and pertains to the computational bloat in which excessive features are impractical such that the learning algorithm require additional resources and time, and more importantly the second drawback pertains to reduced model performance due to the inclusion of unimportant features, when the number of features is significantly higher than the optimal [@Koh97]. 

Furthermore, the features considered important for a given classification or regression task provide insight into the factors which contribute to the prediction. Machine learning is not limited to producing black-box predictions but may also reveal retrospective information, mechanisms or patterns for the given task at hand [@Spe20].

Feature selection, often only considered for preprocessing or model selection, now possesses additional importance from both a predictive and explanatory lens. Given the modern usage of predictive machine learning, a method which can optimise the usage of high-quality data, in the form of features, for existing machine learning models rather than training a model from the ground up is necessary.

R offers other packages which implement feature selection methods. The `caret` package [@caret] offers a useful toolbox for machine learning, including models with inherent feature selection such as `rpart2`, traditional wrapper methods such as recursive feature elimination and regularisation filter methods such as lasso. The `Boruta` package [@boruta] implements the Boruta algorithm, which is another wrapper feature selection algorithm and the `FSelector` [@fselector] provides implementations of more classical wrapper and filter methods such as best first search and hill climbing. `SpFSR` as a wrapper offers the means to optimise the feature space with respect to both a machine learning model and pipeline. 

Additional variations of the spFSR algorithm which perform feature ranking and the simultaneous feature selection and weighting [@Yeo21] are implemented. These neighbouring applications in feature weighting and feature ranking which further delve into the aims of performance enhancement and providing insight respectively. Feature weighting and ranking work symbiotically with feature selection such that many wrapper feature selection methods are able to perform simultaneous feature weighting or feature ranking.




# Ongoing research

Ongoing research involves expanding the methodology into the instance space of supervised machine learning, specifically instance selection, class imbalance and simultaneous instance and feature selection. Moreover, a Python package with similar functionality is also planned for the future.

# References
