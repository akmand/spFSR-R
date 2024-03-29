% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getBestModel.R
\name{getBestModel}
\alias{getBestModel}
\title{Extracting the wrapped model of the best performing features from a spFSR object}
\usage{
getBestModel(x)
}
\arguments{
\item{x}{a \code{spFSR} object}
}
\value{
A \code{WrappedModel} object of the best performing features.
}
\description{
A fitted model uses the best performing feature subsets. It inherits all methods or functions applied to a \code{WrappedModel} objects. For example, the \code{predict} function can be used on the fitted model. See \link[spFSR]{spFeatureSelection} for example.
}
\seealso{
\link[spFSR]{spFeatureSelection}
}
