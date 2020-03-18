#' Projects
#' 
#' @export
#' @name projects
#' @param platform (character) a platform. required
#' @param name (character) a project name. required
#' @param version (character) a version string. optional
#' @param q (character) a query string. optional
#' @param sort (character) sort by one of rank, stars, dependents_count, 
#' dependent_repos_count, latest_release_published_at, contributions_count, 
#' or created_at. default: no sorting. optional
#' @param languages (character) a language name. optional
#' @param licenses (character) a license name. optional
#' @param keywords (character) a keyword. optional
#' @param platforms (character) a platform name. optional
#' @template args
#' @template pagination
#' @examples \dontrun{
#' # project summary
#' lio_project('npm', 'grunt')
#' 
#' # dependencies
#' lio_project_dependencies('npm', 'grunt')
#' lio_project_dependencies('npm', 'grunt', '1.0.1')
#' 
#' # dependent repositories
#' lio_project_dependent_repos('npm', 'turf')
#' 
#' # project contributors
#' lio_project_contribs('npm', 'turf')
#' 
#' # source rank
#' lio_project_sourcerank('npm', 'turf')
#' 
#' # search
#' lio_project_search(q = 'grunt', per_page = 3)
#' }

#' @export
#' @rdname projects
lio_project <- function(platform, name, key = NULL, ...) {
  assert(platform, "character")
  assert(name, "character")
  assert(key, "character")

  args <- vc(list(api_key = check_key_lio(key)))
  json_parse(lio_GET(sprintf("api/%s/%s/", platform, name), args = args, ...))
}

#' @export
#' @rdname projects
lio_project_dependencies <- function(platform, name, 
  version = "latest", key = NULL, ...) {

  assert(platform, "character")
  assert(name, "character")
  assert(version, "character")
  assert(key, "character")

  args <- vc(list(api_key = check_key_lio(key)))
  json_parse(lio_GET(
    sprintf("api/%s/%s/%s/dependencies", platform, name, version), 
    args = args, ...))
}

#' @export
#' @rdname projects
lio_project_dependents <- function(platform, name, page = 1, per_page = 30, 
  key = NULL, ...) {

  assert(platform, "character")
  assert(name, "character")
  assert(page, c('integer', 'numeric'))
  assert(per_page, c('integer', 'numeric'))
  assert(key, "character")

  args <- vc(list(api_key = check_key_lio(key), page = page, 
    per_page = per_page))
  json_parse(lio_GET(sprintf("api/%s/%s/dependents", platform, name), 
    args = args, ...))
}

#' @export
#' @rdname projects
lio_project_dependent_repos <- function(platform, name, page = 1, 
  per_page = 30, key = NULL, ...) {

  assert(platform, "character")
  assert(name, "character")
  assert(page, c('integer', 'numeric'))
  assert(per_page, c('integer', 'numeric'))
  assert(key, "character")

  args <- vc(list(api_key = check_key_lio(key), page = page, 
    per_page = per_page))
  json_parse(lio_GET(
    sprintf("api/%s/%s/dependent_repositories", platform, name), 
    args = args, ...))
}

#' @export
#' @rdname projects
lio_project_contribs <- function(platform, name, page = 1, per_page = 30, 
  key = NULL, ...) {

  assert(platform, "character")
  assert(name, "character")
  assert(page, c('integer', 'numeric'))
  assert(per_page, c('integer', 'numeric'))
  assert(key, "character")

  args <- vc(list(api_key = check_key_lio(key), page = page, 
    per_page = per_page))
  json_parse(lio_GET(sprintf("api/%s/%s/contributors", platform, name),
    args = args, ...))
}

#' @export
#' @rdname projects
lio_project_sourcerank <- function(platform, name, key = NULL, ...) {
  assert(platform, "character")
  assert(name, "character")
  assert(key, "character")

  args <- vc(list(api_key = check_key_lio(key)))
  json_parse(lio_GET(sprintf("api/%s/%s/sourcerank", platform, name), 
    args = args, ...))
}

#' @export
#' @rdname projects
lio_project_search <- function(q = NULL, sort = NULL, languages = NULL, 
  licenses = NULL, keywords = NULL, platforms = NULL, page = 1, 
  per_page = 30, key = NULL, ...) {

  assert(q, "character")
  assert(sort, "character")
  assert(languages, "character")
  assert(licenses, "character")
  assert(keywords, "character")
  assert(platforms, "character")
  assert(page, c('integer', 'numeric'))
  assert(per_page, c('integer', 'numeric'))
  assert(key, "character")

  args <- vc(list(q = q, sort = sort, languages = languages, 
    licenses = licenses, keywords = key, platforms = platforms,
    page = page, per_page = per_page, api_key = check_key_lio(key)))
  json_parse(lio_GET("api/search", args = args, ...))
}
