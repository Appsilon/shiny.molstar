library(shiny)
library(shiny.molstar)

shinyApp(
  ui = basicPage(
    tags$style(HTML("html, body { margin: 0; background-} ")),
    tags$main(
      tags$div(
        class = "box",
        AlphaFoldDetails(
          afId = "A0A1U8FD60",
          showFiles = TRUE,
          showPae = TRUE
        )
      ),
      tags$div(
        class = "box",
        AlphaFoldMolstar(
          afId = "A0A1U8FD60",
          showAxes = TRUE,
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
