#' get_outline
#'
#' @return (character) a table of fungi outline
#' @export
#'
#' @examples
#' # output outline
#' outline <- get_outline()
#' write.xlsx(file="outline.xlsx",outline)
#' 
get_outline <- function() {
  outline <- read_excel(system.file("data", "outline.xlsx", package = "FungiOutline"))
  return(outline)
}