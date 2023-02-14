library(glue)
library(shiny)
library(shiny.molstar)

pdbId <- "1LOL" # nolint: linter_name

shinyApp(
  ui = tagList(
    tags$main(
      h2(glue("Molecular visualization \"{pdbId}\"")),
      Molstar(
        pdbId = pdbId,
        dimensions = c(300, 300),
        showAxis = TRUE
      )
    ),
    #
    # Footer and Styling
    #
    tags$footer(
      tags$p(
        "Minimal example from ",
        tags$a(
          href = "https://appsilon.github.io/shiny.molstar",
          "shiny.molstar"
        ),
        "package"
      ),
      tags$p(
        "Developed with ❤️ by",
        tags$a(
          href = "https://appsilon.github.io/shiny.molstar", "Appsilon"
        )
      )
    ),
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
  ),
  server = function(input, output) {
  }
)
