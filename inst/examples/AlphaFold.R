library(shiny)
library(shiny.molstar)

shinyApp(
  ui = basicPage(
    tags$style(HTML("html, body { margin: 0; background-} ")),
    tags$main(
      tags$div(
        class = "box",
        AlphaFoldMolstar(
          afId = "A0A1U8FD60",
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
    #
    # Footer and Styling
    #
    tags$footer(
      tags$p(
        actionButton("show", "Show source code")
      ),
      tags$p(
        "Alpha Fold example from ",
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
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
  ),
  server = function(input, output) {
    observeEvent(input$show, {
      showModal(modalDialog(
        title = "Source code for example",
        size = "l",
        easyClose = TRUE,
        includeMarkdown(
          paste(
            c(
              "```{r}",
              readLines(
                system.file(
                  "examples/AlphaFoldDetails.R",
                  package = "shiny.molstar"
                )
              ),
              "```"
            ),
            collapse = HTML("\n")
          )
        )
      ))
    })
  }
)
