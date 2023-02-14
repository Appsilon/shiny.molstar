library(glue)
library(shiny)
library(shiny.molstar)

pdbId <- "1LOL"

print(Molstar(pdbId = pdbId, dimensions = c(300, 300)))

shinyApp(
  ui = tagList(
    h1(glue("Molecular visualization \"{pdbId}\"")),
    Molstar(pdbId = pdbId, dimensions = c(300, 300))
  ),
  server = function(input, output) {
  }
)
