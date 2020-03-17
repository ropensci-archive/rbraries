rbraries
========



[![cran checks](https://cranchecks.info/badges/worst/rbraries)](https://cranchecks.info/pkgs/rbraries)
[![Build Status](https://travis-ci.org/ropensci/rbraries.svg?branch=master)](https://travis-ci.org/ropensci/rbraries)
[![codecov.io](https://codecov.io/github/ropensci/rbraries/coverage.svg?branch=master)](https://codecov.io/github/ropensci/rbraries?branch=master)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/grand-total/rbraries?color=2ECC71)](https://github.com/metacran/cranlogs.app)
[![cran version](https://www.r-pkg.org/badges/version/rbraries)](https://cran.r-project.org/package=rbraries)


`rbraries` is a client for interacting with the Libraries.io API <https://libraries.io/api>


Package API:

 - `lio_project_contribs`
 - `lio_subscriptions`
 - `lio_platforms`
 - `lio_project_dependents`
 - `lio_project_sourcerank`
 - `lio_repo_projects`
 - `lio_user_repositories`
 - `lio_user_repo_contributions`
 - `lio_user_pkg_contributions`
 - `lio_user_dependencies`
 - `lio_repo_dependencies`
 - `lio_project_dependent_repos`
 - `lio_user_pkgs`
 - `lio_subscribed`
 - `lio_repo`
 - `lio_project_dependencies`
 - `lio_subscription_delete`
 - `lio_subscription_update`
 - `lio_project_search`
 - `lio_subscribe`
 - `lio_project`
 - `lio_user`

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
```

## platforms


```r
lio_platforms()$name
#>  [1] "Go"         "NPM"        "Packagist"  "Pypi"       "NuGet"     
#>  [6] "Maven"      "Rubygems"   "Bower"      "CocoaPods"  "Wordpress" 
#> [11] "Cargo"      "CPAN"       "Clojars"    "CRAN"       "Hackage"   
#> [16] "Meteor"     "Atom"       "Pub"        "Hex"        "PlatformIO"
#> [21] "Puppet"     "Emacs"      "Homebrew"   "SwiftPM"    "Carthage"  
#> [26] "Julia"      "Sublime"    "Conda"      "Dub"        "Racket"    
#> [31] "Elm"        "Haxelib"    "Nimble"     "Alcatraz"   "PureScript"
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
* Please note that this project is released with a [Contributor Code of Conduct][coc].
By participating in this project you agree to abide by its terms.

[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)

[coc]: https://github.com/ropensci/rbraries/blob/master/CODE_OF_CONDUCT.md#L1
