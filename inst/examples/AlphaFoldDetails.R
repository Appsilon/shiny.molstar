library(shiny)
library(shiny.molstar)

shinyApp(
  ui = basicPage(
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
    )
    # START remove_from_sample_ui
    ## Everything until the end of the tag is not shown when pressing the
    ##  "Show minimal example code" button
    ,
    #
    # Footer and Styling
    #
    shiny.molstar:::footer_tag()
    # END remove_from_sample_ui
  ),
  server = function(input, output) {
    # START remove_from_sample_server
    ## Everything until the end of the tag is not shown when pressing the
    ##  "Show minimal example code" button
    observeEvent(input$show, {
      sample_code <- shiny.molstar:::get_sample_code(
        c("remove_from_sample_ui", "remove_from_sample_server"),
        "examples/AlphaFoldDetails.R"
      )

      showModal(modalDialog(
        title = "Source code for example",
        size = "l",
        easyClose = TRUE,
        includeMarkdown(
          paste(
            c(
              "```{r}",
              sample_code,
              "```"
            ),
            collapse = HTML("\n")
          )
        )
      ))
    })
    # END remove_from_sample_server
  }
)
