library(glue)
library(shiny)
library(shiny.molstar)

pbdId <- "1LOL"

print(Molstar(pbdId = pbdId, dimensions = c(300, 300)))

shinyApp(
  ui = tagList(
    h1(glue("Molecular visualization \"{pbdId}\"")),
    Molstar(pbdId = pbdId, dimensions = c(300, 300))
  ),
  server = function(input, output) {
  }
)
