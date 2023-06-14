library(shiny)
library(shiny.molstar)

shinyApp(
  ui = basicPage(
    tags$main(
      tags$div(
        class = "box",
        AlphaFoldMolstar(
          uniProtId = "A0A1U8FD60",
          showAxes = TRUE,
          dimensions = c(300, 300)
        ),
        tags$hr(),
        tags$p(
          "AlphaFoldMolstar component using ",
          "UniProt (A0A5E8GAP1) as AlphaFold id"
        )
      )
    ),
    shiny.molstar:::footerTag()
  ),
  server = function(input, output) {
  }
)
