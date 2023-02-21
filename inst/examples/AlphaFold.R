library(shiny)
library(shiny.molstar)

shinyApp(
  ui = basicPage(
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
        "examples/AlphaFold.R"
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
