# Examples for Shiny.molstar

There are many examples on this folders. To run them you can use `shiny.molstar::runExamples` function or run the file example on its own _(it requires to have `shiny.molstar` and `shiny.react` packages installed)_.


- `FullPage` :: Shows a protein melucle using the full interface and controllers for Molstar
- `Minimal` :: Shows a smaller visualization of a protein molecule
- `AlphaFold` :: Shows a protein molecule from AlphaFold database
- `AlphaFoldDetails` :: Shows a protein molecule from AlphaFold database and some additional information taken from EMBL-EBI API

Code to run 2 examples

```R
shiny.molstar::runExamples("FullPage")
```
