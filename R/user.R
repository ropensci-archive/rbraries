#' User
#' 
#' @export
#' @name user
#' @param login (character) a github login name. required
#' @param route,pg IGNORED.
#' @template args
#' @template pagination
#' @examples \dontrun{
#' # user info
#' lio_user('ropensci')
#' 
#' # repositories
#' lio_user_repositories('ropensci', per_page = 3)
#' 
#' # packages/projects
#' lio_user_pkgs('ropensci', per_page = 3)
#' 
#' # package/project contributions
#' lio_user_pkg_contributions('sckott', per_page = 3)
#' 
#' # contributions
#' lio_user_repo_contributions('sckott', per_page = 3)
#' 
#' # dependencies
#' lio_user_dependencies('ropensci', per_page = 3)
#' }

user_template_fun <- function(route, pg = FALSE) {
  if (pg) {
    function(login, page = 1, per_page = 30, key = NULL, ...) {
      assert(login, "character")
      assert(page, c('integer', 'numeric'))
      assert(per_page, c('integer', 'numeric'))
      assert(key, "character")
      args <- vc(list(api_key = check_key_lio(key), page = page, 
        per_page = per_page))
      json_parse(lio_GET(sprintf(route, login), args = args, ...))
    }
  } else {
    function(login, key = NULL, ...) {
      assert(login, "character")
      assert(key, "character")
      args <- vc(list(api_key = check_key_lio(key)))
      json_parse(lio_GET(sprintf(route, login), args = args, ...))
    }
  }
}

#' @export
#' @rdname user
lio_user <- user_template_fun("api/github/%s/")

#' @export
#' @rdname user
lio_user_repositories <- user_template_fun("api/github/%s/repositories", 
  pg = TRUE)

#' @export
#' @rdname user
lio_user_pkgs <- user_template_fun("api/github/%s/projects", pg = TRUE)

#' @export
#' @rdname user
lio_user_pkg_contributions <- 
  user_template_fun("api/github/%s/project-contributions", pg = TRUE)

#' @export
#' @rdname user
lio_user_repo_contributions <- 
  user_template_fun("api/github/%s/repository-contributions", pg = TRUE)

#' @export
#' @rdname user
lio_user_dependencies <- user_template_fun("api/github/%s/dependencies",
  pg = TRUE)
