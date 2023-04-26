# nolint start

#' Generate Solar System Plots
#'
#' Tools are provided to generate a dynamic list of convincing celestial object names
#' using a small Markov chain model, construct orbital radii of uniform or specified/natural
#' distances, place celestial objects randomly on the orbit circles using built-in or custom
#' placement functions. Additional capabilities include the ability to output plots from a core
#' routine, generate a plotting template to further customize, and place labels next to celestial
#' object. Some theme elements are also provided to speed up clean plot output generation.
#'
#' @md
#' @name ggsolar
#' @keywords internal
#' @author Bob Rudis (bob@@rud.is)
#' @import ggplot2 stringi ggforce
#' @importFrom stats runif
"_PACKAGE"

# nolint end