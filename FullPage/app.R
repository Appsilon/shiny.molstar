library(shiny)
library(shiny.molstar)

shinyApp(
  ui = basicPage(
    tags$style(HTML("html, body, .container-fluid {margin: 0; padding: 0;}")),
    Molstar(
      pdbId = "1LOL",
      useInterface = TRUE,
      showControls = TRUE,
      showAxes = TRUE
    )
  ),
  server = function(input, output) {
  }
)
