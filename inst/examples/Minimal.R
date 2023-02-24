library(shiny)
library(shiny.molstar)
library(glue)

pdbId <- "1y98"

shinyApp(
  ui = basicPage(
    tags$main(
      tags$div(
        class = "box",
        Molstar(
          pdbId = pdbId,
          dimensions = c(300, 300),
          showAxes = TRUE
        ),
        tags$hr(),
        tags$span(
          "Molecular visualization of pdbID:",
          tags$a(
            href = glue("https://www.ebi.ac.uk/pdbe/entry/pdb/{pdbId}"),
            pdbId
          )
        )
      )
    ),
    shiny.molstar:::footerTag()
  ),
  server = function(input, output) {
  }
)
