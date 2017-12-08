
#' Describe the prevalence of a disease/disorder.
#'
#' Input must be long format with subject id (SID), visit number (VN),
#' and the column(s) to determine the prevalence.
#'
#' @param .data Dataset with SID, VN, and the variable(s) of interest.
#' @param .variables Columns to apply the function to.
#'
#' @return Wide dataset with time across the top and various disease/disorder
#'   statuses below.
#' @export
#'
#' @examples
#'
#' example_data %>%
#' desc_prevalence("DM")
#'
desc_prevalence <- function(.data, .variables) {
    cases_at_each_time(.data = .data, .variables = .variables) %>%
        dplyr::mutate_at("Status", dplyr::funs(plyr::mapvalues(
            ., from = 0:1, to = c("Healthy", "Prevalent cases")
        )))
}
