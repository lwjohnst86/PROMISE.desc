#' @keywords internal
"_PACKAGE"

#' Example dataset with disease status for subjects over time.
#'
#' This dataset is a modified version of the PROMISE dataset to highlight how to
#' use this package.
#'
#' @format A data frame with 1131 observations and 5 variables:
#'
#' - SID. Subject identification number. Each observation is a specific subject at a specific time.
#' - VN. Visit number, or the visit year when the subject came in for data collection.
#' - DM. Diabetes mellitus status (0 = does not have, 1 = does have).
#' - IFG. Impaired fasting glucose (0 = not have, 1 = has).
#' - IGT. Impaired glucose tolerance (0 = not have, 1 = has).
#'
#' @source Subsetted and sampled (with replacement) from the PROMISE dataset.
#' http://promise-cohort.gitlab.io/PROMISE
#'
"example_data"
