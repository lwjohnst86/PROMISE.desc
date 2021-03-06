% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/incidence.R
\name{add_incidence}
\alias{add_incidence}
\title{Add an incidence of disease/disorder column to the dataset.}
\usage{
add_incidence(.data, .variables, prefix = NULL)
}
\arguments{
\item{.data}{Dataset with SID, VN, and the variable(s) of interest.}

\item{.variables}{Columns to apply the function to.}

\item{prefix}{Add a prefix to the variable column names.}
}
\value{
Wide dataset with time across the top and various disease/disorder
statuses below.
}
\description{
Input must be long format with subject id (SID), visit number (VN),
and the column(s) to determine the incidence.
}
\examples{

example_data \%>\%
add_incidence("DM")

example_data \%>\%
add_incidence("DM", prefix = "Incid_")

}
