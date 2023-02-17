molstarDependency <- function() { # nolint: linter_name
  htmltools::htmlDependency(
    name = "molstar",
    version = "0.1.0",
    package = "shiny.molstar",
    src = "www",
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

customComponent <- function(name) {
  function(...) {
    shiny.react::reactElement(
      module = "@/shiny.molstar",
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
#' Molstar(pbdId="1LOL", dimensions=c(300, 300))
Molstar <- component("Molstar") # nolint: linter_name

#' AlphaFoldMolstar shiny element
#'
#' @inherit template params
#' @export
#' @examples
#' url <- "https://alphafold.ebi.ac.uk/files/AF-A0A1U8FD60-F1-model_v4.pdb"
#' AlphaFoldMolstar(afId = "A0A1U8FD60", dimensions=c(300, 300))
AlphaFoldMolstar <- customComponent("AlphaFoldMolstar") # nolint: linter_name


#' AlphaFoldDetails shiny element
#'
#' @inherit template params
#' @export
#' @examples
#' AlphaFoldDetails(afId = "A0A1U8FD60", dimensions=c(300, 300))
AlphaFoldDetails <- customComponent("AlphaFoldDetails") # nolint: linter_name
