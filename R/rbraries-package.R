#' Interface to the libraries.io API
#' 
#' Client for the libraries.io API, a platform for "helping 
#' you find new open source libraries, modules and frameworks 
#' and keep track of ones you depend upon."
#' 
#' @section Auth:
#' You need an API key to use this package. Get one by logging in to 
#' Libraries.io (they have GitHub login and others), then go to your 
#' Settings page, then scroll down to API key section and grab your
#' key. 
#' 
#' You can pass the key into function calls, but that's not recommended.
#' Store your key by putting a `LIBRARIES_IO_KEY` entry in your .Renviron file or similar file like
#' e.g. .zshrc or .bash_profile, etc. We'll grab that key so that you 
#' don't have to pass it into each function call.
#' 
#' @importFrom jsonlite fromJSON
#' @importFrom crul HttpClient
#' @name rbraries-package
#' @aliases rbraries
#' @docType package
#' @keywords package
NULL
