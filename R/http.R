lio_base <- function() "https://libraries.io"

make_ua <- function() {
  paste0("rbraries/", utils::packageVersion("rbraries"))
}

lio_GET <- function(path, args = list(), ...) {
  cli <- crul::HttpClient$new(
    url = lio_base(), 
    headers = list(`User-Agent` = make_ua()),
    opts = list(...)
  )
  res <- cli$get(path, query = args)
  errs(res)
  res$parse("UTF-8")
}

errs <- function(x) {
  if (x$status_code > 201) {
    xx <- jsonlite::fromJSON(x$parse("UTF-8"))
    if ("error" %in% names(xx)) {
      # match by status code
      fun <- match_err(x$status_code)$new()
      fun$mssg <- xx$error
      fun$do_verbose(x)
    } else {
      # if no error message in response, just general stop
      fauxpas::http(x)
    }
  }
}

match_err <- function(code) {
  tmp <- paste0("fauxpas::",
                grep("HTTP*", getNamespaceExports("fauxpas"), value = TRUE))
  fxns <- lapply(tmp, function(x) eval(parse(text = x)))
  codes <- vapply(fxns, function(z) z$public_fields$status_code, 1)
  fxns[[which(code == codes)]]
}

json_parse <- function(x, flatten = TRUE) {
  jsonlite::fromJSON(x, flatten = flatten)
}

json_prx <- function(x) {
  tmp <- jsonlite::fromJSON(x, flatten = TRUE)
  Map(function(x) if (is.null(x)) NA else x, tmp)
}

proc_many <- function(x) {
  tmp <- json_parse(x)
  if (is.list(tmp$crossref_member)) tmp$crossref_member <- col(tmp$crossref_member)
  if (is.list(tmp$prefixes)) tmp$prefixes <- col(tmp$prefixes)
  jnrls <- NULL
  if (is.list(tmp$journals)) {
    jnrls <- tibble::as_tibble(
      data.table::setDF(
        data.table::rbindlist(tmp$journals, fill=TRUE, use.names=TRUE))
    )
    tmp$journals <- NULL
  }
  list(data = tibble::as_tibble(tmp), journals = jnrls)
}

col <- function(x) {
  unlist(Map(function(w) if (length(w) > 1) paste0(w, collapse = ",") else w, x))
}
