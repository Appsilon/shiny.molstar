library(shiny)
library(shiny.molstar)
library(glue)

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
    )
    # START remove_from_sample_ui
    #
    # # Everything until the end of the tag is not shown when pressing the
    # #  "Show minimal example code" button
    ,
    #
    # Footer and Styling
    #
    shiny.molstar:::footer_tag()
    # END remove_from_sample_ui
  ),
  server = function(input, output) {
    # START remove_from_sample_server
    #
    # # Everything until the end of the tag is not shown when pressing the
    # #  "Show minimal example code" button
    observeEvent(input$show, {
      sample_code <- shiny.molstar:::get_sample_code(
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
