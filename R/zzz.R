char2num <- function(x) as.numeric(strextract(x, "[0-9]+"))
strextract <- function(str, pattern) regmatches(str, regexpr(pattern, str))
strtrim <- function(str) gsub("^\\s+|\\s+$", "", str)

pop <- function(x, nms) {
  x[!names(x) %in% nms]
}

vc <- function(x) Filter(Negate(is.null), x)

assert <- function(x, y) {
  if (!is.null(x)) {
    if (!class(x) %in% y) {
      stop(deparse(substitute(x)), " must be of class ",
           paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}

check_key_lio <- function(x) {
  tmp <- if (is.null(x)) {
    Sys.getenv("LIBRARIES_IO_KEY", "")
  } else {
    x
  }
  if (tmp == "") {
    stop("you need an API key for the Libraries.io API",
         call. = FALSE)
  }
  return(tmp)
}
