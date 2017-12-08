context("Descriptions of prevalence and incidence")

testdata <- data.frame(
    SID = rep(1:5, each = 4),
    VN = rep(1:4, times = 5),
    DM = c(rep(0, each = 4),
           c(0, 1, 1, 1),
           c(0, 0, 1, 1),
           c(0, 0, 0, 1),
           c(0, 1, NA, 1)),
    IFG = c(rep(0, each = 4),
           c(1, 1, 0, 1),
           c(0, 0, 1, 1),
           c(0, NA, 1, 1),
           c(0, 1, NA, 1))
)

test_that("Prevalence rate", {
    expect_error(desc_prevalence(testdata, "doesntexist"))
    expect_error(desc_prevalence(testdata, 1))

    prev_dm <- desc_prevalence(testdata, "DM")[2, 3:6]
    expect_equal(c(NA, 2, 2, 4), as.numeric(prev_dm))

    prev_ifg <- desc_prevalence(testdata, "IFG")[2, 3:6]
    expect_equal(c(1, 2, 2, 4), as.numeric(prev_ifg))
})

test_that("Incidence rates", {
    expect_error(add_incidence(testdata, "doesntexist"))
    expect_error(add_incidence(testdata, 1))

    incid_dm <- desc_incidence(testdata, "DM", prefix = "incid_")
    expect_equal(c(NA, 2, 1, 1), as.numeric(incid_dm[2, 3:6]))
    expect_match(incid_dm[[1]], "incid_")

    incid_ifg <- desc_incidence(testdata, "IFG")[2, 3:6]
    expect_equal(c(NA, 1, 1, 1), as.numeric(incid_ifg))
})


