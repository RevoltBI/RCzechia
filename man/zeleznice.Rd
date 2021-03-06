% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/zeleznice.R
\name{zeleznice}
\alias{zeleznice}
\title{Railroad Network}
\format{\code{sf} data frame with 3.525 rows of 4 variables + geometry:

\describe{
  \item{ELEKTRIFIKACE}{is the railroad electrified?: yes = ano, no = ne}
  \item{KATEGORIE}{category: international = mezinárodní, local = vnitrostátní}
  \item{KOLEJNOST}{track: single = jednokolejní, double = dvojkolejní, more = tří a vícekolejní}
  \item{ROZCHODNOST}{gauge: standard = normální, narrow = úzkokolejka}
}}
\source{
\url{https://www.arcdata.cz/produkty/geograficka-data/arccr-500}
}
\usage{
zeleznice(method = "curl")
}
\arguments{
\item{method}{Method argument for `download.file()`. The default (i.e. "curl") should be appropriate in most situations.}
}
\description{
Function returning data frame of railorads of the Czech Republic as \code{sf} lines. It has no obligatory parameters.
}
\details{
Due to package size constraints the data are stored externally (and a working internet connection is required to use the package). Downloaded size is 285 KB.
}
