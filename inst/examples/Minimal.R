library(glue)
library(shiny)
library(shiny.molstar)

pdbId <- "1LOL" # nolint: linter_name

shinyApp(
  ui = tagList(
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
    tags$main(
      h2(glue("Molecular visualization \"{pdbId}\"")),
      Molstar(pdbId = pdbId, dimensions = c(300, 300))
    ),
    tags$footer(
      tags$p(
        "Minimal example from ",
        tags$a(href = "https://appsilon.github.io/shiny.molstar", "shiny.molstar"),
        "package"
      ),
      tags$p(
        "Made with ❤️ at",
        tags$a(href = "https://appsilon.github.io/shiny.molstar", "Appsilon")
      )
    )
  ),
  server = function(input, output) {
  }
)
