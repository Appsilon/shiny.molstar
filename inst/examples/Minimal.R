library(shiny)
library(shiny.molstar)
library(glue)

pdbId <- "1y98"

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
        tags$span(
          "Molecular visualization of pdbID:",
          tags$a(
            href = glue("https://www.ebi.ac.uk/pdbe/entry/pdb/{pdbId}"),
            pdbId
          )
        )
      )
    )
    # START remove_from_sample_ui
    #
    # # Everything until the end of the tag is not shown when pressing the
    # #  "Show minimal example code" button
    ,
    #
    # Footer and Styling
    #
    shiny.molstar:::footerTag()
    # END remove_from_sample_ui
  ),
  server = function(input, output) {
    # START remove_from_sample_server
    #
    # # Everything until the end of the tag is not shown when pressing the
    # #  "Show minimal example code" button
    observeEvent(input$show, {
      sampleCode <- shiny.molstar:::getSampleCode(
        c("remove_from_sample_ui", "remove_from_sample_server"),
        "examples/Minimal.R"
      )

      showModal(modalDialog(
        title = "Source code for example",
        size = "l",
        easyClose = TRUE,
        includeMarkdown(
          paste(
            c(
              "```{r}",
              sampleCode,
              "```"
            ),
            collapse = shiny::HTML("\n")
          )
        )
      ))
    })
    # END remove_from_sample_server
  }
)
