% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/td_connect.R
\name{td_connect}
\alias{td_connect}
\title{Connect to the taxadb database}
\usage{
td_connect(dbdir = NULL, driver = NULL, read_only = NULL)
}
\arguments{
\item{dbdir}{Path to the database. no longer needed}

\item{driver}{deprecated, ignored.  driver will always be duckdb.}

\item{read_only}{deprecated, driver is always read-only.}
}
\value{
Returns a DBI \code{connection} to the default duckdb database
}
\description{
Connect to the taxadb database
}
\details{
This function provides a default database connection for
\code{taxadb}. Note that you can use \code{taxadb} with any DBI-compatible database
connection  by passing the connection object directly to \code{taxadb}
functions using the \code{db} argument. \code{td_connect()} exists only to provide
reasonable automatic defaults based on what is available on your system.

For performance reasons, this function will also cache and restore the
existing database connection, making repeated calls to \code{td_connect()} much
faster and more failsafe than repeated calls to \link[DBI:dbConnect]{DBI::dbConnect}
}
\examples{
\donttest{
## OPTIONAL: you can first set an alternative home location,
## such as a temporary directory:
Sys.setenv(TAXADB_HOME=file.path(tempdir(), "taxadb"))

## Connect to the database:
db <- td_connect()

}
}
