% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/filter_id.R
\name{filter_id}
\alias{filter_id}
\title{Return a taxonomic table matching the requested ids}
\usage{
filter_id(
  id,
  provider = getOption("taxadb_default_provider", "itis"),
  type = c("taxonID", "acceptedNameUsageID"),
  version = latest_version(),
  collect = TRUE,
  db = td_connect()
)
}
\arguments{
\item{id}{taxonomic id, in prefix format}

\item{provider}{from which provider should the hierarchy be returned?
Default is 'itis', which can also be configured using \verb{options(default_taxadb_provider=...")}.
See \verb{[td_create]} for a list of recognized providers.}

\item{type}{id type.  Can be \code{taxonID} or \code{acceptedNameUsageID},
see details.}

\item{version}{Which version of the taxadb provider database should we use?
defaults to latest.  See \link{tl_import} for details.}

\item{collect}{logical, default \code{TRUE}. Should we return an in-memory
data.frame (default, usually the most convenient), or a reference to
lazy-eval table on disk (useful for very large tables on which we may
first perform subsequent filtering operations.)}

\item{db}{a connection to the taxadb database. See details.}
}
\value{
a data.frame with id and name of all matching species
}
\description{
Return a taxonomic table matching the requested ids
}
\details{
Use \code{type="acceptedNameUsageID"} to return all rows
for which this ID is the accepted ID, including both synonyms and
and accepted names (since both all synonyms of a name share the
same \code{acceptedNameUsageID}.) Use \code{taxonID} (default) to only return
those rows for which the Scientific name corresponds to the \code{taxonID.}

Some providers (e.g. ITIS) assign taxonIDs to synonyms, most others
only assign IDs to accepted names.  In the latter case, this means
requesting \code{taxonID} will only match accepted names, while requesting
matches to the \code{acceptedNameUsageID} will also return any known synonyms.
See examples.
}
\examples{
\donttest{
  \dontshow{
   ## All examples use a temporary directory
   Sys.setenv(TAXADB_HOME=file.path(tempdir(), "taxadb"))
   options("taxadb_default_provider"="itis_test")
  }

filter_id(c("ITIS:1077358", "ITIS:175089"))
filter_id("ITIS:1077358", type="acceptedNameUsageID")

}
}
\seealso{
Other filter_by: 
\code{\link{filter_by}()},
\code{\link{filter_common}()},
\code{\link{filter_name}()},
\code{\link{filter_rank}()}
}
\concept{filter_by}
