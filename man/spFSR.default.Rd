% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spFSR.default.R
\name{spFSR.default}
\alias{spFSR.default}
\title{Default Function of SP-FSR for Feature Selection and Ranking}
\usage{
spFSR.default(
  task,
  wrapper = NULL,
  scoring = NULL,
  perturb.amount = 0.05,
  gain.min = 0.01,
  gain.max = 2,
  change.min = 0,
  change.max = 0.2,
  bb.bottom.threshold = 10^(-8),
  mon.gain.A = 100,
  mon.gain.a = 0.75,
  mon.gain.alpha = 0.6,
  hot.start.num.ft.factor = 15,
  hot.start.max.auto.num.ft = 150,
  use.hot.start = TRUE,
  hot.start.range = 0.2,
  rf.n.estimators = 50,
  gain.type = "bb",
  num.features.selected = 0L,
  iters.max = 100L,
  stall.limit = 35L,
  n.samples.max = 5000,
  ft.weighting = FALSE,
  encoding.type = "encode",
  is.debug = FALSE,
  stall.tolerance = 10^(-8),
  random.state = 1,
  rounding = 3,
  run.parallel = TRUE,
  n.jobs = NULL,
  show.info = TRUE,
  print.freq = 10L,
  num.cv.folds = 5L,
  num.cv.reps.eval = 3L,
  num.cv.reps.grad = 1L,
  num.grad.avg = 4L,
  perf.eval.method = "cv"
)
}
\arguments{
\item{task}{A task \code{tsk} object created using \pkg{mlr3} package. It must be either a \code{ClassifTask} or \code{RegrTask} object.}

\item{wrapper}{A Learner \code{lrn} object created using \pkg{mlr3} package or a \code{GraphLearner} object created using \pkg{mlr3pipelines} package. Multiple learners object is not supported. If left empty will select random forest by default.}

\item{scoring}{A performance measure \code{msr} within the \pkg{mlr3} package supported by the \code{task}. If left blank will select accuracy for classification and r-squared for regression.}

\item{perturb.amount}{Perturbation amount for feature importances during gradient approximation. It must be a value between 0.01 and 0.1. Default value is 0.05.}

\item{gain.min}{The minimum gain value. It must be greater than or equal to 0.001. Default value is 0.01.}

\item{gain.max}{The maximum gain value. It must be greater than or equal to \code{gain.min}.  Default value is 1.0.}

\item{change.min}{The minimum change value. It must be non-negative. Default value is 0.0.}

\item{change.max}{The maximum change value. It must be greater than \code{change.min}. Default is 0.2.}

\item{bb.bottom.threshold}{The threshold value of denominator for the Barzilai-Borwein gain sequence. It must be positive. Default is 1/10^8.}

\item{mon.gain.A}{Parameter for the monetone gain sequence. It must be a positive integer. Default is 100.}

\item{mon.gain.a}{Parameter for the monetone gain sequence. It must be positive. Default is 0.75.}

\item{mon.gain.alpha}{Parameter for the monetone gain sequence. It must be between (0, 1). Default is 0.6.}

\item{hot.start.num.ft.factor}{The factor of features to select for hot start. Must be an integer greater than 1. Default is 15.}

\item{hot.start.max.auto.num.ft}{The maximum initial number of features for automatic hot start. Must be an integer greater than 1. Default is 75.}

\item{use.hot.start}{Logical argument. Whether hot start should be used. Default is True.}

\item{hot.start.range}{Float, the initial range of imputations carried over from hot start. It must be between (0,1). Default is 0.2.}

\item{rf.n.estimators}{integer, The number of trees to use in the random forest hot start. The default is 50.}

\item{gain.type}{The gain sequence to use. Accepted methods are 'bb' for Barzilai-Borwein or 'mon' for a monetonic gain sequence. Default is 'bb'.}

\item{num.features.selected}{Number of features selected. It must be a nonnegative integer and must not exceed the total number of features in the task. A value of 0 results in automatic feature selection. Default value is 0L.}

\item{iters.max}{Maximum number of iterations to execute. The minimum value is 2L. Default value is 300L.}

\item{stall.limit}{Number of iterations to stall, that is, to continue without at least \code{stall.tolerance} improvement to the measure value. The mininum value is 2L. Default value is 100L.}

\item{n.samples.max}{The maximum number of samples to select from sampling. It must be a non-negative integer. Default is 2500.}

\item{ft.weighting}{Logical argument. Include simultaneous feature weighting and selection?. Default is FALSE.}

\item{encoding.type}{Encoding method for factor features for feature weighting, default is 'encoded'.}

\item{is.debug}{Logical argument. Print additional debug messages? Default value is FALSE.}

\item{stall.tolerance}{Value of stall tolerance. It must be strictly positive. Default value is 1/10^8.}

\item{random.state}{random state used. Default is 1.}

\item{rounding}{The number of digits to round results. It must be a positive integer. Default value is 3.}

\item{run.parallel}{Logical argument. Perform cross-validations in parallel? Default value is TRUE.}

\item{n.jobs}{Number of cores to use in case of a parallel run. It must be less than or equal to the total number of cores on the host machine. If set to \code{NULL} when \code{run.parallel} is \code{TRUE}, it is taken as one less of the total number of cores.}

\item{show.info}{If set to \code{TRUE}, iteration information is displayed at print frequency.}

\item{print.freq}{Iteration information printing frequency. It must be a positive integer. Default value is 10L.}

\item{num.cv.folds}{The number of cross-validation folds when 'cv' is selected as \code{perf.eval.method}. The minimum value is 3L. Default value is 5L.}

\item{num.cv.reps.eval}{The number of cross-validation repetitions for feature subset evaluation. It must be a positive integer. Default value is 3L.}

\item{num.cv.reps.grad}{The number of cross-validation repetitions for gradient averaging. It must be a positive integer. Default value is 1L.}

\item{num.grad.avg}{Number of gradients to average for gradient approximation. It must be a positive integer. Default value is 4L.}

\item{perf.eval.method}{Performance evaluation method. It must be either 'cv' for cross-validation or 'resub' for resubstitution. Default is 'cv'.}
}
\value{
\code{spFSR} returns an object of class "spFSR". An object of class "spFSR" consists of the following:

\item{task.spfs}{An \pkg{mlr3} package \code{tsk} object defined on the best performing features.}
\item{wrapper}{An \pkg{mlr3} package \code{lrn} object or a \pkg{mlr3pipelines} package \code{GraphLearner} object as specified by the user.}
\item{scoring}{An \pkg{mlr3} package \code{msr} as specified by the user.}
\item{param best.model}{An \pkg{mlr3} package \code{model} object trained by the \code{wrapper} using \code{task.spfs}.}
\item{iter.results}{A \code{data.frame} object containing detailed information on each iteration.}
\item{features}{Names of the best performing features.}
\item{num.features}{The number of best performing features.}
\item{importance}{A vector of importance ranks of the best performing features.}
\item{total.iters}{The total number of iterations executed.}
\item{best.iter}{The iteration where the best performing feature subset was encountered.}
\item{best.value}{The best measure value encountered during execution.}
\item{best.std}{The standard deviation corresponding to the best measure value encountered.}
\item{run.time}{Total run time in minutes.}
\item{results}{Dataframe with boolean of selected features, names and measure}
\item{call}{Call.}
}
\description{
This is the default function of \link[spFSR]{spFeatureSelection}. See \link[spFSR]{spFeatureSelection} for example.
}
\references{
David V. Akman et al. (2022) k-best feature selection and ranking via stochastic approximation,  \emph{Expert Systems with Applications}, \bold{Vol. 213}. See \doi{10.1016/j.eswa.2022.118864}

G.F.A Yeo and V. Aksakalli (2021) A stochastic approximation approach to simultaneous feature weighting and selection for nearest neighbour learners,  \emph{Expert Systems with Applications}, \bold{Vol. 185}. See \doi{10.1016/j.eswa.2021.115671}
}
\seealso{
\link[spFSR]{spFeatureSelection}.
}
