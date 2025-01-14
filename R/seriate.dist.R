#######################################################################
# seriation - Infrastructure for seriation
# Copyright (C) 2011 Michael Hahsler, Christian Buchta and Kurt Hornik
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

#' @rdname seriate
#' @export
seriate.dist <-
  function(x,
    method = "Spectral",
    control = NULL,
    ...) {

    ## add ... to control
    control <- c(control, list(...))

    ## check x
    if (anyNA(x)) stop("NAs not allowed in distance matrix x!")
    if (any(x < 0)) stop("Negative distances not supported!")

    if (!is.character(method) || (length(method) != 1L))
      stop("Argument 'method' must be a character string.")
    method <- get_seriation_method("dist", method)

    if (!is.null(control$verbose) &&
        control$verbose)
      cat(method$name, ": ",
        method$description, "\n\n", sep = "")

    order <- method$fun(x, control = control)
    if (is.integer(order)) names(order) <- labels(x)[order]

    ser_permutation(ser_permutation_vector(order, method = method$name))
  }

seriate_dist_identity <- function(x, control = NULL) {
  #param <- .get_parameters(control, NULL)
  .get_parameters(control, NULL)

  o <- 1:attr(x, "Size")
  o
}

seriate_dist_random <- function(x, control = NULL) {
  #param <- .get_parameters(control, NULL)
  .get_parameters(control, NULL)

  o <- 1:attr(x, "Size")
  sample(o)
}


set_seriation_method("dist",
  "Identity",
  seriate_dist_identity,
  "Identity permutation")
set_seriation_method("dist", "Random", seriate_dist_random,
  "Random permutation")
