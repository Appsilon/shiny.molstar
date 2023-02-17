library(glue)
library(shiny)
library(shiny.molstar)

pdbId <- "1LOL" # nolint: linter_name

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
        tags$span(glue("Molecular visualization of pdbID: \"{pdbId}\""))
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
