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
    args <- list(...)
    if (!is.null(args$class)) {
      names(args) <- gsub("^class$", "className", names(args))
    }

    shiny.react::reactElement(
      module = "molstar-react",
      name = name,
      props = do.call(shiny.react::asProps, args),
      deps = molstarDependency()
    )
  }
}

custom_component <- function(name) {
  function(...) {
    shiny.react::reactElement(
      module = "@/shiny.molstar",
      name = name,
      props = do.call(shiny.react::asProps, args),
      deps = molstarDependency()
    )
  }
}

#' Molstar shiny element
#'
#' Shiny.react component to show Molstar molecular visualizations.
#' It can use a "Protein Data Bank" id, an URL to a valid `.pdb`/`.cif` file
#' in the internet.
#'
#' A `pdbId` can be found in public databases such as:
#'  * https://www.ebi.ac.uk/pdbe/entry/search/index/
#'  * https://www.rcsb.org/
#'
#' The `file` parameter is supported, but it should not be used in Shiny.
#'
#' @param url Load a structure by passing in the URL of the file.
#' This file type needs to be supported by Molstar (`.pdb`, `.cif`).
#' @param pdbId Load an official PDB structure by supplying its 4 letter ID.
#' See the details for example databses.
#' @param dimensions an integer vector indicating the dimensions of the
#' visualization in pixels (`c(width, height`). By default the molstar
#' plugin will take up the full screen.
#' @param useInterface a logical value indicating if the full Molstar
#' interface will be used around the core canvas.
#' @param showControls a logical value indicating if the controls will be
#' shown around the sides of the interface. It needs the `useInterface`
#' parameter to be also `TRUE`. Only recommended for large sizes.
#' @param showAxes a logical value indicating if axes will appear in the
#' bottom left corner.
#' @param class character string for the class name to apply to the outer
#' parent element.
#'
#' @export
#' @examples
#' Molstar(pbdId = "1LOL", dimensions = c(300, 300))
#' Molstar(pbdId = "1y98", dimensions = c(300, 300))
#'
#' url <- "https://alphafold.ebi.ac.uk/files/AF-A0A1U8FD60-F1-model_v4.pdb"
#' Molstar(url = url, dimensions = c(300, 300))
#'
#' url2 <- "https://alphafold.ebi.ac.uk/files/AF-A0A1U8FD60-F1-model_v4.cif"
#' Molstar(url = url2, dimensions = c(300, 300))
Molstar <- component("Molstar") # nolint: linter_name

#' AlphaFoldMolstar shiny element
#'
#' @param afid a character string containing a UniProt id that is in the
#' AlphaFold database.
#' @param dimensions an integer vector indicating the dimensions of the
#' visualization in pixels (`c(width, height`). By default the molstar
#' plugin will take up the full screen.
#' @param useInterface a logical value indicating if the full Molstar
#' interface will be used around the core canvas.
#' @param showControls a logical value indicating if the controls will be
#' shown around the sides of the interface. It needs the `useInterface`
#' parameter to be also `TRUE`. Only recommended for large sizes.
#' @param showAxes a logical value indicating if axes will appear in the
#' bottom left corner.
#' @param class character string for the class name to apply to the outer
#' parent element.
#'
#' @export
#' @examples
#' AlphaFoldMolstar(afId = "A0A1U8FD60", dimensions = c(300, 300))
AlphaFoldMolstar <- custom_component("AlphaFoldMolstar") # nolint: linter_name


#' AlphaFoldDetails shiny element
#'
#' @param afid a character string containing a UniProt id that is in the
#' AlphaFold database.
#' @param showFiles a logical value indicating if the download links to the
#' files in the database should be shown in a div.
#' @param showPae a logical value indicating if the predicted aligned
#' error image should be shown.
#'
#' @export
#' @examples
#' AlphaFoldDetails(afId = "A0A1U8FD60", showPae = TRUE, showFiles = TRUE)
AlphaFoldDetails <- custom_component("AlphaFoldDetails") # nolint: linter_name
