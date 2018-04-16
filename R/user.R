#' User
#' 
#' @export
#' @name user
#' @param login (character) a github login name. required
#' @template args
#' @examples \dontrun{
#' # user info
#' lio_user('ropensci')
#' 
#' # repositories
#' lio_user_repositories('ropensci')
#' 
#' # packages/projects
#' lio_user_pkgs('ropensci')
#' 
#' # package/project contributions
#' lio_user_pkg_contributions('ropensci')
#' 
#' # contributions
#' lio_user_repo_contributions('ropensci')
#' 
#' # dependencies
#' lio_user_dependencies('ropensci')
#' }

user_template_fun <- function(route) {
  function(login, key = NULL, ...) {
    assert(login, "character")
    assert(key, "character")
    args <- vc(list(api_key = check_key_lio(key)))
    json_parse(lio_GET(sprintf(route, login), args = args, ...))
  }
}

#' @export
#' @rdname user
lio_user <- user_template_fun("api/github/%s/")

#' @export
#' @rdname user
lio_user_repositories <- user_template_fun("api/github/%s/repositories")

#' @export
#' @rdname user
lio_user_pkgs <- user_template_fun("api/github/%s/projects")

#' @export
#' @rdname user
lio_user_pkg_contributions <- user_template_fun("api/github/%s/project-contributions")

#' @export
#' @rdname user
lio_user_repo_contributions <- user_template_fun("api/github/%s/repository-contributions")

#' @export
#' @rdname user
lio_user_dependencies <- user_template_fun("api/github/%s/dependencies")
