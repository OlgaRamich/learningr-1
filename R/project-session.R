weight_kilo <- 10
# comment: Use alt taste und - to <-
weight_kilo

# Vectors: Character
c("a", "b")
# Numeric
c(1,2)
# Logic
c(TRUE,FALSE)

# data frame

head(iris)
colname(iris)
str(iris)
summary(iris)

# Exercise ----------------------------------------------------------------

# Object names
day_one

Logical_value <- FALSE
c <- 9
mean <- function(x) sum(x)

# Spacing
x[, 1]
mean(x, na.rm = TRUE)

function(x) {}

height <- feet * 12 + inches
mean(x, na.rm = 10)
sqrt(x^2 + y^2)
df$z
x <- 1:10

# Indenting
if (y < 0 && debug)
	message("Y is negative")

# Spacing
x[, 1]
x[, 1]
x[, 1]
mean (x, na.rm = TRUE)
mean(x, na.rm = TRUE)
function (x) {
}
function(x) {
}
height <- feet * 12 + inches
mean(x, na.rm = 10)
sqrt(x ^ 2 + y ^ 2)
df$z
x <- 1:10

# Functions ---------------------------------------------------------------


sd

add_three <- function(x, y, z) {
	added <- x + y + z
	return(added)
}

source(here::here("R/package-loading.R"))


# Save data ---------------------------------------------------------------


write.csv(iris, here::here("data/iris.csv"))
imported_iris <- read.csv(here::here("data/iris.csv"))
glimpse(imported_iris)
