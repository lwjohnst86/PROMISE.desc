#' Create a table from the data frame.
#'
#' Simply a thin wrapper around [pander::pander].
#'
#' @param .data Dataset to create into a table.
#' @param caption Table caption.
#'
#' @return Output the results of some descriptions of the dataset.
#' @export
#'
#' @examples
#'
#' \dontrun{
#' example_data %>%
#' desc_prevalence("DM") %>%
#' desc_table()
#' }
#'
desc_table <- function(.data, caption = NULL) {
    if ("<NA>" %in% names(.data)) {
        .data <- .data %>%
            dplyr::rename_at("<NA>", dplyr::funs(paste0("Missing")))
    }
    pander::pander(
        .data,
        caption = caption,
        missing = "-",
        split.table = Inf,
        style = "rmarkdown"
        )
}

cases_at_each_time <- function(.data, .variables, prefix = NULL) {
    if (!is.null(prefix)) {
        .variables <- paste0(prefix, .variables)
    }

    stopifnot(is.character(.variables),
              all(c("SID", "VN", .variables) %in% names(.data)))

    .data %>%
        dplyr::select_at(c("SID", "VN", .variables)) %>%
        tidyr::gather_("Disease", "Status", .variables) %>%
        dplyr::count_(c("VN", "Disease", "Status")) %>%
        tidyr::spread("VN", "n")
}

#' @export
#' @importFrom magrittr %>%
magrittr::`%>%`

utils::globalVariables(".")
