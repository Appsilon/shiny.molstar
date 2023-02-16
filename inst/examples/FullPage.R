library(shiny)
library(shiny.molstar)

shinyApp(
  ui = tagList(
    tags$style(HTML("html, body { margin: 0; }")),
    Molstar(
      pdbId = "1LOL",
      useInterface = TRUE,
      showControls = TRUE,
      showAxis = TRUE
    )
  ),
  server = function(input, output) {
  }
)
