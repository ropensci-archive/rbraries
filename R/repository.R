#' Repositories
#' 
#' @export
#' @name repos
#' @param owner (character) a github owner name. required
#' @param name (character) a project name. required
#' @template args
#' @template pagination
#' @examples \dontrun{
#' # repo summary
#' lio_repo('ropensci', 'wellknown')
#' 
#' # dependencies
#' lio_repo_dependencies('ropensci', 'wellknown')
#' lio_repo_dependencies('gruntjs', 'grunt')
#' 
#' # dependents
#' lio_repo_projects('gruntjs', 'grunt', per_page = 2)
#' }

#' @export
#' @rdname repos
lio_repo <- function(owner, name, key = NULL, ...) {
  assert(owner, "character")
  assert(name, "character")
  assert(key, "character")

  args <- vc(list(api_key = check_key_lio(key)))
  json_parse(lio_GET(sprintf("api/github/%s/%s/", owner, name), 
    args = args, ...))
}

#' @export
#' @rdname repos
lio_repo_dependencies <- function(owner, name, key = NULL, ...) {
  assert(owner, "character")
  assert(name, "character")
  assert(key, "character")

  args <- vc(list(api_key = check_key_lio(key)))
  json_parse(lio_GET(sprintf("api/github/%s/%s/dependencies", owner, name), 
    args = args, ...))
}

#' @export
#' @rdname repos
lio_repo_projects <- function(owner, name, page = 1, per_page = 30, key = NULL, ...) {
  assert(owner, "character")
  assert(name, "character")
  assert(page, c('integer', 'numeric'))
  assert(per_page, c('integer', 'numeric'))
  assert(key, "character")

  args <- vc(list(api_key = check_key_lio(key), page = page, 
    per_page = per_page))
  json_parse(lio_GET(sprintf("api/github/%s/%s/projects", owner, name), 
    args = args, ...))
}
