library(dplyr)
example_data <- PROMISE.data::PROMISE %>%
    select(SID, VN, DM, IFG, IGT) %>%
    sample_frac(.5, replace = TRUE)

devtools::use_data(example_data, overwrite = TRUE)
