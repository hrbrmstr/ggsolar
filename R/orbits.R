#' Generate concentric circular orbits for "n" planets
#'
#' Given a character vector of "planet" names, generate a
#' data frame of "n" circle polygons.
#'
#' @param planets (chr) One or more "planet" names
#' @param radii (numeric) By default, this is a set of "n" radii uniformly
#'        spaced apart. You can specify a vector of radii if you want less
#'        uniformly spaced concentric rings.
#' @param num_polygon_points (integer) number of points for the circle polygon. Larger == smoother.
#' @return (data.fame)
#' @export
#' @examples
#' generate_orbits(sol_planets)
generate_orbits <- function(planets, radii = 1:length(planets), num_polygon_points=1000) {

  lapply(1:length(radii), function(i) {

    theta <- seq(0, 2*pi, length.out = num_polygon_points+1)[-1]

    x <- radii[i] * cos(theta)
    y <- radii[i] * sin(theta)

    out <- cbind(x, y)
    out <- as.data.frame(out)
    out$planet <- planets[i]

    out

  }) -> orbits

  do.call(rbind.data.frame, orbits)

}
