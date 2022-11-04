
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggols

<!-- badges: start -->

<!-- badges: end -->

The goal of ggols is to …

## Installation

You can install the released version of ggols from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("ggols")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("EvaMaeRey/ggols")
```

## ggxmean gives us all the geom\_lm\_\* functions

``` r
library(tidyverse)
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──
#> ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
#> ✓ tibble  3.1.6     ✓ dplyr   1.0.8
#> ✓ tidyr   1.0.2     ✓ stringr 1.4.0
#> ✓ readr   1.3.1     ✓ forcats 0.5.0
#> Warning: package 'ggplot2' was built under R version 3.6.2
#> Warning: package 'tibble' was built under R version 3.6.2
#> Warning: package 'purrr' was built under R version 3.6.2
#> Warning: package 'dplyr' was built under R version 3.6.2
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
library(ggxmean)

ggplot(cars) +
  aes(x = speed, y = dist,) +
  geom_point() +
  geom_lm() +
  geom_lm_intercept(color = "blue") +
  geom_lm_intercept_label(hjust = -.2) +
  geom_lm_conf_int() +
  geom_lm_residuals() +
  geom_lm_fitted() +
  geom_lm_formula()
```

<img src="man/figures/README-example-1.png" width="100%" />

# Visualization with an indicator variable

``` r
library(ggols)
#> 
#> Attaching package: 'ggols'
#> The following objects are masked from 'package:ggxmean':
#> 
#>     geom_lm_indicator, good_digits

ggplot(cars) +
  aes(x = speed, y = dist, indicator = dist > 30,
  color = dist > 30) +
  geom_point() +
  geom_lm_indicator() +
  geom_lm_indicator_intercept(color = "blue") +
  geom_lm_indicator_intercept_label(hjust = -.2) +
  geom_lm_indicator_conf_int() +
  geom_lm_indicator_residuals() +
  geom_lm_indicator_fitted() +
  geom_lm_indicator_formula() +
  geom_lm_indicator_rsquared()
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

``` r


ggplot(cars) +
  aes(x = speed, y = dist, indicator = dist > 30,
  color = dist > 30) +
  geom_point() +
  geom_lm_interaction() +
  geom_lm_interaction_intercept(color = "blue") +
  geom_lm_interaction_intercept_label(hjust = -.2) +
  geom_lm_interaction_conf_int() +
  geom_lm_interaction_residuals() +
  geom_lm_interaction_fitted() +
  geom_lm_interaction_formula() +
  geom_lm_interaction_rsquared()
```

<img src="man/figures/README-unnamed-chunk-2-2.png" width="100%" />

``` r


ggplot(palmerpenguins::penguins) +
  aes(x = bill_length_mm, y = bill_depth_mm, indicator = species, indicator2 = sex,
  color = species, shape = sex) +
  geom_point() +
  geom_lm_indicator2() +
  geom_lm_indicator2_conf_int() + # buggy
  geom_lm_indicator2_residuals() +
  geom_lm_indicator2_fitted() +
  geom_lm_indicator2_formula() +
  geom_lm_indicator2_rsquared() +
  NULL
#> Warning: Removed 11 rows containing non-finite values (stat_lmindicator2).
#> Warning: Removed 2 rows containing non-finite values (stat_olsconfintind2).
#> Warning: Removed 11 rows containing non-finite values (stat_lmindicator2).
#> Removed 11 rows containing non-finite values (stat_lmindicator2).
#> Warning: Removed 11 rows containing non-finite values (stat_olsind2formula).
#> Warning: Removed 11 rows containing non-finite values (stat_olsindrsquared).
#> Warning: Removed 11 rows containing missing values (geom_point).
#> Warning in max(ids, na.rm = TRUE): no non-missing arguments to max; returning -
#> Inf

#> Warning in max(ids, na.rm = TRUE): no non-missing arguments to max; returning -
#> Inf
```

<img src="man/figures/README-unnamed-chunk-2-3.png" width="100%" />

``` r

last_plot() + 
  geom_lm_indicator2_intercept(color = "blue") +
  geom_lm_indicator2_intercept_label(hjust = -.2)
#> Warning: Removed 11 rows containing non-finite values (stat_lmindicator2).
#> Warning: Removed 2 rows containing non-finite values (stat_olsconfintind2).
#> Warning: Removed 11 rows containing non-finite values (stat_lmindicator2).
#> Removed 11 rows containing non-finite values (stat_lmindicator2).
#> Warning: Removed 11 rows containing non-finite values (stat_olsind2formula).
#> Warning: Removed 11 rows containing non-finite values (stat_olsindrsquared).
#> Warning: Removed 2 rows containing non-finite values (stat_olsinterceptind).
#> Removed 2 rows containing non-finite values (stat_olsinterceptind).
#> Warning: Removed 11 rows containing missing values (geom_point).
#> Warning in max(ids, na.rm = TRUE): no non-missing arguments to max; returning -
#> Inf

#> Warning in max(ids, na.rm = TRUE): no non-missing arguments to max; returning -
#> Inf
```

<img src="man/figures/README-unnamed-chunk-2-4.png" width="100%" />
