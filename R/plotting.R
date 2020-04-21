
#' Plotting Histogram of Variant consequences
#'
#' @param vcf an object of class VcfFile
#' @param ... additional parameters for the plotting
#'
#' @return A \code{\link{ggplot2}} plot object
#'
#' @examples
#' \dontrun{
#' vcf_histogram(vcf)
#' }
#' @import dplyr
#' @import ggplot2
#' @importFrom tibble as_tibble
#'
vcf_histogram <- function(vcf, ...) {
  require(VariantAnnotation)
  require(dplyr)
  require(ggplot2)

  info <- as_tibble(info(exVCF))

  plot <- info %>%
    group_by(consequence) %>%
    summarise(n = n()) %>%
    ggplot(aes(x = consequence, y = n, fill = consequence)) +
    geom_bar(stat = "identity") +
    theme(axis.text.x = element_blank())

  return(plot)
}
