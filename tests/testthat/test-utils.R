context("Utilities and helpers")

testdata <- data.frame(
    SID = rep(1:5, each = 4),
    VN = rep(1:4, times = 5),
    DM = c(rep(0, each = 4),
           c(0, 1, 1, 1),
           c(0, 0, 1, 1),
           c(0, 0, 0, 1),
           c(0, 1, NA, 1))
)

test_that("Cases over time", {
    expect_error(cases_at_each_time(testdata, "doesntexist"))
    expect_error(cases_at_each_time(testdata, 1))

    prev_dm <- cases_at_each_time(testdata, "DM")[2, 3:6]
    expect_equal(c(NA, 2, 2, 4), as.numeric(prev_dm))
})
