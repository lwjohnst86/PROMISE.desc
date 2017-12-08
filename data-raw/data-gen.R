library(dplyr)
example_data <- PROMISE.data::PROMISE %>%
    select(SID, VN, DM, IFG, IGT) %>%
    filter(VN %in% c(1, 3, 6)) %>%
    sample_frac(.5, replace = TRUE)

devtools::use_data(example_data, overwrite = TRUE)
