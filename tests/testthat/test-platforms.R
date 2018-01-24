context("platforms")

test_that("platforms works correctly", {
  skip_on_cran()
  
  a <- lio_platforms()
  
  expect_is(a, "list")
  expect_named(a, c('name', 'project_count', 'homepage', 
    'color', 'default_language'))
  expect_true(any(grepl("Julia", a$name)))
})
