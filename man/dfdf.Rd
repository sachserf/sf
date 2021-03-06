% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dfdf.R
\name{dfdf}
\alias{dfdf}
\title{dfdf - differences between dataframes}
\usage{
dfdf(
  df1,
  df2,
  df1target = "/tmp/R2meld1.csv",
  df2target = "/tmp/R2meld2.csv",
  software = "meld"
)
}
\arguments{
\item{df1}{A dataframe}

\item{df2}{Another dataframe (similar but probably not the identical to df1)}

\item{df1target}{Character. Optional. Specify filepath to write df1.}

\item{df2target}{Character. Optional. Specify filepath to write df2.}

\item{software}{Character. Specify system command to invoke external software. Tested only with Meld (see http://meldmerge.org/).}
}
\description{
dfdf - differences between dataframes
}
