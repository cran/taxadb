% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fuzzy_filter.R
\name{common_contains}
\alias{common_contains}
\title{common name starts with}
\usage{
common_contains(
  name,
  provider = getOption("taxadb_default_provider", "itis"),
  version = latest_version(),
  db = td_connect(),
  ignore_case = TRUE
)
}
\arguments{
\item{name}{vector of names (scientific or common, see \code{by})
to be matched against.}

\item{provider}{from which provider should the hierarchy be returned?
Default is 'itis', which can also be configured using \verb{options(default_taxadb_provider=...")}.
See \verb{[td_create]} for a list of recognized providers.}

\item{version}{Which version of the taxadb provider database should we use?
defaults to latest.  See \link{tl_import} for details.}

\item{db}{a connection to the taxadb database. See details.}

\item{ignore_case}{should we ignore case (capitalization) in matching names?
Can be significantly slower to run.}
}
\description{
common name starts with
}
\examples{
\donttest{
  \dontshow{
   ## All examples use a temporary directory
   Sys.setenv(TAXADB_HOME=file.path(tempdir(), "taxadb"))
   options("taxadb_default_provider"="itis_test")
  }
common_contains("monkey")
}
}
