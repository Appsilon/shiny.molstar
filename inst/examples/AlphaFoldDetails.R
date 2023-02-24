library(shiny)
library(shiny.molstar)

shinyApp(
  ui = basicPage(
    tags$main(
      tags$div(
        class = "box",
        AlphaFoldDetails(
          uniProtId = "A0A1U8FD60",
          showFiles = TRUE,
          showPae = TRUE
        )
      ),
      tags$div(
        class = "box",
        AlphaFoldMolstar(
          uniProtId = "A0A1U8FD60",
          showAxes = TRUE,
          useCif = TRUE,
          dimensions = c(300, 300)
        ),
        tags$hr(),
        tags$p(
          "Showing AlphaFold details on the left with \"AlphaFoldDetails\"",
          " Shiny.react component.",
          " The data is downloaded from EMBL-EBI API in the client's browser."
        ),
        tags$p("The Visualization above uses \"AlphaFoldMolstar\" Shiny.react",
          " component."
        )
      )
    ),
    shiny.molstar:::footerTag()
  ),
  server = function(input, output) {
  }
)
