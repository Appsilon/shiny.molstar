#' Common footer for all examples
#'
#' This function is not exported and shouldn't be used outside of the examples
#'
#' @return a common footer and css for the examples
footer_tag <- function() {
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
#' @param example_path path to file to load example from
#'
#' @return a vector of lines of the sample code
get_sample_code <- function(lookup, example_path) {
  sample_code <- readLines(
    system.file(
      example_path,
      package = "shiny.molstar"
    )
  )

  for (el in lookup) {
    start_line <- which(grepl(glue::glue("# START {el}"), sample_code))
    end_line <- which(grepl(glue::glue("# END {el}"), sample_code))

    # Only remove
    if (
      length(start_line) > 0 &&
      length(start_line) > 0 &&
      start_line < end_line
    ) {
      sample_code <- sample_code[-1 * seq(start_line, end_line)]
    }
  }
  sample_code
}
