
[![Travis-CI Build Status](https://travis-ci.org/lwjohnst86/PROMISE.desc.svg?branch=master)](https://travis-ci.org/lwjohnst86/PROMISE.desc) [![Coverage Status](https://img.shields.io/codecov/c/github/lwjohnst86/PROMISE.desc/master.svg)](https://codecov.io/github/lwjohnst86/PROMISE.desc?branch=master) [![GitLab pipeline status](https://gitlab.com/promise-cohort/PROMISE.desc/badges/master/pipeline.svg)](https://gitlab.com/promise-cohort/PROMISE.desc/commits/master)

<!-- README.md is generated from README.Rmd. Please edit that file -->
PROMISE.desc
============

The goal of PROMISE.desc is to provide functions commonly used to describe the PROMISE dataset (e.g. show incident cases, changes over time, etc).

Installation
============

``` r
# install.packages("devtools")
devtools::install_github("lwjohnst86/PROMISE.desc")
```

Usage
=====

Here is one function to show an example of a function from PROMISE.desc:

``` r
library(PROMISE.desc)
example_data %>% 
    desc_incidence("DM") %>% 
    desc_table(caption = "Example data of incident cases at each time.")
```

| Disease |     Status     |  1  |  3  |  6  |
|:-------:|:--------------:|:---:|:---:|:---:|
|    DM   |     Healthy    | 100 | 171 | 196 |
|    DM   | Incident cases |  -  |  8  |  4  |
|    DM   |        -       | 370 | 191 |  91 |

More information on specific use can be found in the vignette.
