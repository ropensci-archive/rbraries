library("vcr")
invisible(vcr::vcr_configure(
  dir = "../fixtures",
  filter_sensitive_data = list("<<libraries_token>>" = Sys.getenv('LIBRARIES_IO_KEY'))
))
vcr::check_cassette_names()
