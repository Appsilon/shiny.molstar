% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/components.R
\name{Molstar}
\alias{Molstar}
\title{Molstar shiny element}
\usage{
Molstar(
  class = NULL,
  url = NULL,
  pdbId = NULL,
  dimensions = NULL,
  useInterface = FALSE,
  showControls = FALSE,
  showAxes = FALSE,
  ...
)
}
\arguments{
\item{class}{character string for the class name to apply to the outer
parent element.}

\item{url}{Load a structure by passing in the URL of the file.
This file type needs to be supported by Molstar (\code{.pdb}, \code{.cif}).}

\item{pdbId}{Load an official PDB structure by supplying its 4 letter ID.
See the details for example databses.}

\item{dimensions}{an integer vector indicating the dimensions of the
visualization in pixels (\code{c(width, height)}). By default the molstar
plugin will take up the full screen.}

\item{useInterface}{a logical value indicating if the full Molstar
interface will be used around the core canvas.}

\item{showControls}{a logical value indicating if the controls will be
shown around the sides of the interface. It needs the \code{useInterface}
parameter to be also \code{TRUE}. Only recommended for large sizes.}

\item{showAxes}{a logical value indicating if axes will appear in the
bottom left corner.}

\item{...}{Component other props and children.}
}
\description{
Shiny.react component to show Molstar molecular visualizations.
It can use a "Protein Data Bank" id, an URL to a valid \code{.pdb}/\code{.cif} file
in the internet.
}
\details{
A \code{pdbId} can be found in public databases such as:
\itemize{
\item https://www.ebi.ac.uk/pdbe/entry/search/index/
\item https://www.rcsb.org/
}

The \code{file} parameter is supported by the react library, but it should not
be used in Shiny.
}
\examples{
Molstar(pdbId = "1LOL", dimensions = c(300, 300))
Molstar(pdbId = "1y98", dimensions = c(300, 300))

url <- "https://alphafold.ebi.ac.uk/files/AF-A0A1U8FD60-F1-model_v4.pdb"
Molstar(url = url, dimensions = c(300, 300))

url2 <- "https://alphafold.ebi.ac.uk/files/AF-A0A1U8FD60-F1-model_v4.cif"
Molstar(url = url2, dimensions = c(300, 300))
}
