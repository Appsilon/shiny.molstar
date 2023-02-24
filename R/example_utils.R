#' Common footer for all examples
#'
#' This function is not exported and shouldn't be used outside of the examples
#'
#' @return a common footer and css for the examples
footerTag <- function() {
  shiny::tagList(
    shiny::tags$footer(
      shiny::tags$p(
        "See this and more examples at",
        shiny::tags$a(
          href = "https://github.com/Appsilon/shiny.molstar/tree/main/inst/examples",
          "shiny.molstar/inst/examples"
        )
      ),
      shiny::tags$p(
        "Developed with \u2764\uFE0F by",
        shiny::tags$a(
          href = "https://appsilon.com", "Appsilon"
        )
      )
    ),
    shiny::tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
  )
}
