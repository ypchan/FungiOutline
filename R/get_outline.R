get_outline <- function() {
  outline <- read_excel(system.file("data", "outline.xlsx", package = "FungiOutline"))
  return(outline)
}
