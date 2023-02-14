molstarDependency <- function() { # nolint: linter_name
  htmltools::htmlDependency(
    name = "molstar",
    version = "0.1.0",
    package = "shiny.molstar",
    src = c(
      # When package is public it should resolve the JS file in CDN
      # href = "https://cdn.jsdelivr.net/gh/Appsilon/shiny.molstar@main/inst/www/"
      "inst/www"
    ),
    script = "shiny.molstar.min.js"
  )
}

component <- function(name) {
  function(...) {
    shiny.react::reactElement(
      module = "molstar-react",
      name = name,
      props = shiny.react::asProps(...),
      deps = molstarDependency()
    )
  }
}

#' @title template
#' @param inputId The `input` slot that will be used to access the value.
#' @param ... Component props and children. See the official Blueprint docs for
#' details.
#' @param value Initial value.
#' @name template
NULL

#' Molstar shiny element
#'
#' @inherit template params
#' @export
#' @examples
#' shiny.molstar::Molstar(pbdId="1LOL", dimensions=c(300, 300))
Molstar <- component("Molstar") # nolint: linter_name
