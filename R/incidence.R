
#' Add an incidence of disease/disorder column to the dataset.
#'
#' Input must be long format with subject id (SID), visit number (VN),
#' and the column(s) to determine the incidence.
#'
#' @inherit desc_incidence params return
#'
#' @export
#'
#' @examples
#'
#' example_data %>%
#' add_incidence("DM")
#'
#' example_data %>%
#' add_incidence("DM", prefix = "Incid_")
#'
add_incidence <- function(.data, .variables, prefix = NULL) {
    stopifnot(is.character(.variables),
              all(c("SID", "VN", .variables) %in% names(.data)))

    .data <- .data %>%
        dplyr::arrange_(.dots = c("SID", "VN"))
    incid <- .data %>%
        dplyr::group_by_("SID") %>%
        dplyr::mutate_at(.variables, dplyr::funs({
            previous <- dplyr::lag(.)
            current <- .
            incid <- current - previous
            ifelse(incid < 0 | is.na(incid), 0, incid)
        })) %>%
        dplyr::ungroup()

    if (!is.null(prefix)) {
        stopifnot(is.character(prefix))
        incid <- incid %>%
            dplyr::rename_at(.variables, dplyr::funs(gsub("^", prefix, .))) %>%
            dplyr::bind_cols(dplyr::select_at(.data, .variables))
    }

    return(incid)
}

#' Describe the incidence of new cases of disorders/diseases over time.
#'
#' Input must be long format with subject id (SID), visit number (VN),
#' and the column(s) to determine the incidence.
#'
#' @inherit desc_prevalence params return
#' @param prefix Add a prefix to the variable column names.
#'
#' @export
#'
#' @examples
#'
#' example_data %>%
#' desc_incidence("DM")
#'
#' example_data %>%
#' desc_incidence("DM", prefix = "Incid_")
#'
desc_incidence <- function(.data, .variables, prefix = NULL) {
    .data %>%
        add_incidence(.variables = .variables, prefix = prefix) %>%
        cases_at_each_time(.variables = .variables, prefix = prefix) %>%
        dplyr::mutate_at("Status", dplyr::funs(plyr::mapvalues(
            ., from = 0:1, to = c("Healthy/Prevalent", "Incident cases")
        )))
}
