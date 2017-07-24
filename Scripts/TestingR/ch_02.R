# testing using assertive library

counts <- c(1, 2.2, 3, 4.5)

stopifnot(
   is.numeric(counts),
   all(counts >= 0),
   isTRUE(all.equal(counts, round(counts)))
)

suppressPackageStartupMessages(library(assertive, quietly = TRUE))
suppressPackageStartupMessages(library(magrittr, quietly = TRUE))

library(assertive)
library(magrittr)

assert_is_numeric(counts)
assert_all_are_non_negative(counts)
assert_all_are_whole_numbers(counts)

is_numeric(1:6)

is_numeric(letters)

attributes(is_numeric(letters))

is_non_negative(c(10, 1, 0, -1, -10, NA))

attributes(is_non_negative(c(10, 1, 0, -1, -10, NA)))

(x <- c(0, 1, Inf, - Inf, NaN, NA))

# 2.2.1

x %>%
  assert_is_numeric %>%
  assert_all_are_finite %>%
  assert_all_are_not_na

ls("package:assertive", pattern = "finite")

apropos("finite")

? apropos

(x <- c(TRUE, FALSE, NA))

is_true(x)

is_false(x)
is_not_na(x)

(x <- c(a = TRUE))

isTRUE(x)

is_identical_to_true(x)

is_identical_to_true(x, allow_attributes = TRUE)

is_identical_to_na(matrix())

x <- 1:5
has_names(x)
names(x) <- character( 5 )
has_names(x)
names(x) <- month.abb[1:5]
has_names(x)

stack.x

has_names(stack.x)
has_rownames(stack.x)
has_colnames(stack.x)

has_attributes(data.frame(), c("names", "class", "dim"))

has_no_attributes(data.frame())

(x <- c(1, 2, 3, 2, 4, 1))

has_no_duplicates(x)

has_duplicates(1:5)

is_a_number(1:23)

(x <- c(-0.1, 0, 0.5, 1, 1.1))

is_proportion(x)

is_proportion(x,
  lower_is_strict = TRUE,
  upper_is_strict = TRUE
)

is_in_range(x, 0, 2 * pi,
  upper_is_struct = TRUE)

(eps <- 50 * .Machine$double.eps)

(x <- 123.456 + c(-10 * eps, - eps, 0, eps, 10 * eps))

is_equal_to(x, 123.456)

is_equal_to(x, 123.456, tol = 0)

apropos("length")

Harman23.cor %>%
  assert_is_list %>%
  assert_is_of_length(3)

Harman23.cor$cov %>%
  assert_has_colnames %>%
  assert_has_rownames %>%
  assert_all_are_in_range(0, 1)

assert_all_are_equal_to(Harman23.cor$center, 0)

r_executable <- file.path(R.home("bin"), "R")

is_existing_file(r_executable)

# 2.4.9

(m <- matrix(c(1, eps, 0, 1), nrow = 2))

is_identity_matrix(m)

is_identity_matrix(m, tol = 0)

# 2.4.11, assertive.sets

cor(longley)

x <- c(1, 3, 5, 4, 2)
y <- c(6, 1, 4, 3, 5)

is_subset(x, y)

is_superset(x, y)

are_set_equal(x, y)

has_colnames(women, c("weight", "height"))
# or
are_set_equal(names(women), c("weight", "height"))

model <- lm(weight ~ feed, chickwts)

has_terms(chickwts)

has_terms(model)

an_empty_model <- lm(weight ~ 0, ChickWeight)
is_empty_model(an_empty_model)

is_empty_model(lm(uptake ~ 1, C02))

is_r_devel

is_date_string(c("21JUL1954", "wednesday"), "%d%b%Y")

assert_all_are_nan(-1:1 / 0, severity = "warning")

# 2.7

geomean <- function(x, na.rm = FALSE) {
	exp(mean(log(x), na.rm = na.rm ) )
}

geomean("a")

geomean2 <- function(x, na.rm = FALSE) {
	assert_is_numeric(x)
	exp(mean(log(x), na.rm = na.rm))
}

geomean2("a")

geomean2(rnorm(20))

geomean3 <- function(x, na.rm = FALSE) {
	assert_is_numeric(x)

	# don't worry about NA's here
	if (any(is_negative(x), na.rm = TRUE)) {
		warning(
			"x contains negative values.",
			"so the geometric mean makes no sense."
		)

		return(NaN)
	}

	exp(mean(log(x), na.rm = na.rm))
}

geomean3(rnorm(20))

x <- rlnorm(20)
x[sample(length(x), 5)] <- NA
geomean3(x, na.rm = c(1.5, 0))

geomean4 <- function(x, na.rm = FALSE) {
	assert_is_numeric(x)

	# don't worry about NA's here
	if (any(is_negative(x), na.rm = TRUE)) {
		warning(
			"x contains negative values.",
			"so the geometric mean makes no sense."
		)

		return(NaN)
	}

	na.rm <- coerce_to( use_first( na.rm ), "logical" )
	exp(mean(log(x), na.rm = na.rm ))
}

geomean4(x, na.rm = c(1.5, 0))

apropos("numeric")

harmean <- function(x, na.rm = FALSE) {

	x %>%
		assert_is_numeric %>%
		assert_all_are_positive

	1 / mean( 1 / x, na.rm = na.rm )
}

harmean(rnorm(20))
harmean(1:20)
