#' Common footer for all examples
#'
#' This function is not exported and shouldn't be used outside of the examples
#'
#' @return a common footer and css for the examples
footerTag <- function() {
  shiny::tagList(
    shiny::tags$footer(
      shiny::tags$p(
        shiny::actionButton("show", "Show source code (minimal example)")
      ),
      shiny::tags$p(
        "Alpha Fold example from ",
        shiny::tags$a(
          href = "https://appsilon.github.io/shiny.molstar",
          "shiny.molstar"
        ),
        "package"
      ),
      shiny::tags$p(
        "Developed with \u2764\uFE0F by",
        shiny::tags$a(
          href = "https://appsilon.github.io/shiny.molstar", "Appsilon"
        )
      )
    ),
    shiny::tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
  )
}

#' Get minimal sample code from example file
#'
#' It removes lines that are surrounded by a "# START <tag>" and "# END <tag>"
#' comment.
#'
#' There cannot be ambiguous tags in the code or the same tag appearing
#' multiple times.
#'
#' For example, the vector with the following lines:
#'
#' ```
#' ... # code before
#' # START block1
#' ... # some code
#' # END block1
#' ... # code after
#' ```
#'
#' will be changed to
#'
#' ```
#' ... # code before
#' ... # code after
#' ```
#'
#' @param lookup suffix of tag that surrounds code
#' @param examplePath path to file to load example from
#'
#' @return a vector of lines of the sample code
getSampleCode <- function(lookup, examplePath) {
  sampleCode <- readLines(
    system.file(
      examplePath,
      package = "shiny.molstar"
    )
  )

  for (el in lookup) {
    startLine <- which(grepl(glue::glue("# START {el}"), sampleCode))
    endLine <- which(grepl(glue::glue("# END {el}"), sampleCode))

    # Only remove
    if (
      length(startLine) > 0 &&
      length(startLine) > 0 &&
      startLine < endLine
    ) {
      sampleCode <- sampleCode[-1 * seq(startLine, endLine)]
    }
  }
  sampleCode
}
