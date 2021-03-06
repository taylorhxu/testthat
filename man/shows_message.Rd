\name{shows_message}
\alias{expect_message}
\alias{shows_message}
\title{Expectation: does expression show a message?}
\usage{
shows_message(regexp = NULL, all = FALSE, ...)

expect_message(object, regexp = NULL, ..., info = NULL, label = NULL)
}
\arguments{
  \item{regexp}{optional regular expression to match. If
  not specified, just asserts that expression shows some
  message.}

  \item{all}{if \code{TRUE}, all messages must match given
  regular expression; if \code{FALSE} (the default), then
  only only message needs to match}

  \item{...}{other arguments passed to
  \code{\link{matches}}}

  \item{object}{object to test}

  \item{info}{extra information to be included in the
  message (useful when writing tests in loops).}

  \item{label}{object label. When \code{NULL}, computed
  from deparsed object.}
}
\description{
Needs to match at least one of the messages produced by the
expression.
}
\examples{
f <- function(x) {
  if (x < 0) message("*x* is already negative")
  -x
}
expect_that(f(-1), shows_message())
expect_that(f(-1), shows_message("already negative"))
\dontrun{expect_that(f(1), shows_message())}

expect_message(f(-1))
expect_message(f(-1), "already negative")
\dontrun{expect_message(f(1))}

# You can use the arguments of grepl to control the matching
expect_message(f(-1), "*x*", fixed = TRUE)
expect_message(f(-1), "NEGATIVE", ignore.case = TRUE)
}
\seealso{
Other expectations: \code{\link{equals}},
\code{\link{expect_equal}};
\code{\link{expect_equivalent}},
\code{\link{is_equivalent_to}}; \code{\link{expect_error}},
\code{\link{throws_error}}; \code{\link{expect_false}},
\code{\link{is_false}}; \code{\link{expect_identical}},
\code{\link{is_identical_to}}; \code{\link{expect_is}},
\code{\link{is_a}}; \code{\link{expect_match}},
\code{\link{matches}}; \code{\link{expect_output}},
\code{\link{prints_text}}; \code{\link{expect_true}},
\code{\link{is_true}}; \code{\link{expect_warning}},
\code{\link{gives_warning}}; \code{\link{takes_less_than}}
}

