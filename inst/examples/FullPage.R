library(shiny)
# library(shiny.molstar)
devtools::load_all()

shinyApp(
  ui = basicPage(
    tags$style(HTML("html, body { margin: 0; }")),
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
