#' Subscriptions
#' 
#' @export
#' @name subscriptions
#' @param login (character) a github login name. required
#' @param platform (character) a platform. required
#' @param name (character) a project name. required
#' @param include_prerelease (logical) include prerelease? default: `FALSE`
#' @template args
#' @examples \dontrun{
#' # authenticated user Libraries.io subscriptions
#' lio_subscriptions()
#' 
#' # check if you are subscribed to a project
#' lio_subscribed("rubygems", "webmock")
#' 
#' # subscribe to a project
#' lio_subscribe(platform = "rubygems", name = "webmock")
#' 
#' # update subscription to a project
#' lio_subscription_update("rubygems", "webmock")
#' 
#' # delete subscription to a project
#' lio_subscription_delete("rubygems", "webmock")
#' }

#' @export
#' @rdname subscriptions
lio_subscriptions <- function(key = NULL, ...) {
  assert(key, "character")
  args <- vc(list(api_key = check_key_lio(key)))
  json_parse(lio_GET("api/subscriptions", args = args, ...))
}

#' @export
#' @rdname subscriptions
lio_subscribed <- function(platform, name, key = NULL, ...) {
  assert(key, "character")
  args <- vc(list(api_key = check_key_lio(key)))
  json_parse(lio_GET(sprintf("api/subscriptions/%s/%s", platform, name),
    args = args, ...))
}

#' @export
#' @rdname subscriptions
lio_subscribe <- function(platform, name, include_prerelease = FALSE, 
    key = NULL, ...) {

  assert(key, "character")
  args <- vc(list(api_key = check_key_lio(key), 
    include_prerelease = include_prerelease))
  json_parse(lio_POST(sprintf("api/subscriptions/%s/%s", platform, name), 
    args = args, ...))
}

#' @export
#' @rdname subscriptions
lio_subscription_update <- function(platform, name, include_prerelease = FALSE, 
    key = NULL, ...) {

  assert(key, "character")
  args <- vc(list(api_key = check_key_lio(key), 
    include_prerelease = include_prerelease))
  json_parse(lio_PUT(sprintf("api/subscriptions/%s/%s", platform, name),
    args = args, ...))
}

#' @export
#' @rdname subscriptions
lio_subscription_delete <- function(platform, name, key = NULL, ...) {
  assert(key, "character")
  args <- vc(list(api_key = check_key_lio(key)))
  lio_DELETE(sprintf("api/subscriptions/%s/%s", platform, name),
    args = args, ...)
}
