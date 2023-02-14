# shiny.molstar

> R Shiny wrapper for Mol* (/'molstar/) - A visualization toolkit of large-scale molecular data

<!-- badges: start -->
[![R-CMD-checks](https://github.com/Appsilon/shiny.molstar/actions/workflows/r-cmd-check.yml/badge.svg)](https://github.com/Appsilon/shiny.molstar/actions/workflows/r-cmd-check.yml)
<!-- badges: end -->

We created a R Shiny wrapper based on [shiny.react](https://appsilon.github.io/shiny.react/) and uses the 'node.js' module [molstar-react](https://www.npmjs.com/package/molstar-react) that allows to visualize large scale molecular data within shiny application.

Mol* (/'molstar/) is a modern web-based open-source toolkit for visualization and analysis of large-scale molecular data.

## TODO before making it public:

* Decide on keeping JS inside r package or delivered via cdn
    * add inst/www to .Rbuildignore
    * change R/components.R removing the comments on `molstarDependency`
* remove this section

## Getting started

To install the packages, run:

```{R}
install.packages("shiny.react")
remotes::install_github("Appsilon/shiny.molstar")
```

Take a look at basic [example app](https://github.com/Appsilon/shiny.molstar/blob/main/inst/examples/Minimal.R) to start working with shiny.molstar.

To learn about the Mol* language, follow the [Viewer documentation](https://molstar.org/viewer-docs/).

## Appsilon

<img src="https://avatars0.githubusercontent.com/u/6096772" align="right" alt="" width="6%" />

Appsilon is a **Posit (formerly RStudio) Full Service Certified Partner**.<br/>
Learn more
at [appsilon.com](https://appsilon.com).

Get in touch [opensource@appsilon.com](mailto:opensource@appsilon.com)

Check our [Open Source tools](https://shiny.tools).

<a href = "https://appsilon.com/careers/" target="_blank"><img src="http://d2v95fjda94ghc.cloudfront.net/hiring.png" alt="We are hiring!"/></a>
