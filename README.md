rbraries
========



[![cran checks](https://cranchecks.info/badges/worst/rbraries)](https://cranchecks.info/pkgs/rbraries)
[![R-CMD-check](https://github.com/ropensci/rbraries/workflows/R-CMD-check/badge.svg)](https://github.com/ropensci/rbraries/actions?query=workflow%3AR-CMD-check)
[![codecov.io](https://codecov.io/github/ropensci/rbraries/coverage.svg?branch=master)](https://codecov.io/github/ropensci/rbraries?branch=master)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/rbraries?color=2ECC71)](https://github.com/r-hub/cranlogs.app)
[![cran version](https://www.r-pkg.org/badges/version/rbraries)](https://cran.r-project.org/package=rbraries)


`rbraries` is a client for interacting with the Libraries.io API <https://libraries.io/api>


Package API:


```
Error in loadNamespace(name): there is no package called 'rbraries'
```

As you can see all functions are prefixed with `lio_` to avoid namespace conflicts with other R packages.

## Authentication

You need an API key to use this package. Get one by logging in to 
<https://libraries.io> (they have GitHub login and others), then go to your 
Settings page, then scroll down to API key section and grab your
key. 

You can pass the key into function calls, but that's not recommended.
Store your key by putting a `LIBRARIES_IO_KEY` entry in your .Renviron file or similar file like
e.g. .zshrc or .bash_profile, etc. We'll grab that key so that you 
don't have to pass it into each function call.

## Installation

CRAN version


```r
install.packages("rbraries")
```

Development version


```r
remotes::install_github("ropensci/rbraries")
```


```r
library('rbraries')
#> Error in library("rbraries"): there is no package called 'rbraries'
```

## platforms


```r
lio_platforms()$name
#> Error in lio_platforms(): could not find function "lio_platforms"
```

## projects


```r
lio_project_dependents('npm', 'grunt', per_page = 3)
```

## repositories


```r
lio_repo_projects('gruntjs', 'grunt', per_page = 2)
```

## subscriptions


```r
lio_subscribe("rubygems", "webmock")
```

## user methods


```r
lio_user('github')
```

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rbraries/issues).
* License: MIT
* Get citation information for `rbraries` in R doing `citation(package = 'rbraries')`
* Please note that this package is released with a [Contributor Code of Conduct](https://ropensci.org/code-of-conduct/). By contributing to this project, you agree to abide by its terms.
