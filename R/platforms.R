#' Platforms
#' 
#' @export
#' @param key your Libraries.io API key. optional
#' @param ... curl options passed on to [crul::HttpClient]
#' @examples \dontrun{
#' lio_platforms()
#' }
lio_platforms <- function(key = NULL, ...) {
  assert(key, "character")

  args <- vc(list(api_key = check_key_lio(key)))
  json_prx(lio_GET("api/platforms", args = args, ...))
}
