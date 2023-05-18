# Bug fixed in R 4.3.0

# A 1-factor factor analysis
test <- factanal(mtcars[, 1:4], factors = 1)

# good print
print(test)

# bad print
print(test, sort = TRUE)

# find print method being used
class(test)
getAnywhere(print.factanal)

# find print method for loadings
class(test$loadings)
getAnywhere(print.loadings)

# debug
debugonce(stats::print.loadings)
debugonce(stats:::print.loadings)
print(test, sort = TRUE)


# with and without ordering
Lambda
Lambda[order(mx, 1L:p), ]
Lambda[order(mx, 1L:p), , drop = FALSE]

# redefine print.loadings
source("R/print.loadings_modified.R")

# check
print.loadings(test$loadings, sort = TRUE)
