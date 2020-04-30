context("Testing the plotting functionality")

test_that(
  "Testing whether the function actually produce a ggplot", {
    plot <- vcf_histogram(exVCF)
    expect_that("ggplot" %in% class(plot), equals(TRUE))
  }
)
