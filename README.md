# shiny.molstar <a href="https://appsilon.github.io/shiny.molstar/"><img src="man/figures/logo.svg" align="right" alt="data.validator logo" style="height: 140px;"></a>

> _R Shiny wrapper for Mol* (/'molstar/) - A visualization toolkit of large-scale molecular data_

<!-- badges: start -->
[![R-CMD-checks](https://github.com/Appsilon/shiny.molstar/actions/workflows/r-cmd-check.yml/badge.svg)](https://github.com/Appsilon/shiny.molstar/actions/workflows/r-cmd-check.yml)
<!-- badges: end -->

Based on [Mol*](https://molstar.org) (/'molstar/) and powered by [shiny.react](https://appsilon.github.io/shiny.react/)

We created a R Shiny wrapper based on [shiny.react](https://appsilon.github.io/shiny.react/) and [molstar-react](https://www.npmjs.com/package/molstar-react) _(node.js library)_ that gives all the powerful tools of Mol* open-source toolkit for visualization and analysis of large-scale molecular data.

## Getting started

To install the packages, run:

```{R}
install.packages("shiny.react")
remotes::install_github("Appsilon/shiny.molstar")
```

Take a look at basic [example app](https://github.com/Appsilon/shiny.molstar/blob/main/inst/examples/Minimal.R) to start working with shiny.molstar.

To learn about the Mol* language, follow the [Viewer documentation](https://molstar.org/viewer-docs/).

## Examples

Creating a full page viewer on a sample molecule _(example also available at `inst/examples/FullPage.R`)_

```
library(shiny)
library(shiny.molstar)

shinyApp(
  ui = tagList(
    tags$style(HTML("html, body { margin: 0; }")),
    Molstar(
      pdbId = "1LOL",
      useInterface = TRUE,
      showControls = TRUE,
      showAxis = TRUE
    )
  ),
  server = function(input, output) {
  }
)
```

![Full page example](man/examples/example.gif)

## Appsilon

<img src="https://avatars0.githubusercontent.com/u/6096772" align="right" alt="" width="6%" />

Appsilon is a **Posit (formerly RStudio) Full Service Certified Partner**.<br/>
Learn more
at [appsilon.com](https://appsilon.com).

Get in touch [opensource@appsilon.com](mailto:opensource@appsilon.com)

Check our [Open Source tools](https://shiny.tools).

<a href = "https://appsilon.com/careers/" target="_blank"><img src="http://d2v95fjda94ghc.cloudfront.net/hiring.png" alt="We are hiring!"/></a>
