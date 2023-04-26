# nolint start

#' Generate random planetary positions given a data frame of orbits
#'
#' You can use this after calling [generate_orbits()] to compute a
#' random position along the orbit circle for each planet
#'
#' @param orbits (df) output of [generate_orbits()]
#' @param randomizer (ƒ) if not the default `runif`, a function that can take
#'        a parameter `n`, the number of orbits, and return a numeric vector of
#'        values between 0 and 1 that will position the point where you want it
#'        to be on the orbit circle.
#' @return (data.fame) with the `planet` name, computed angle, and `x`/`y` coord of the planet
#' @export
#' @examples
#' sol_orbits <- generate_orbits(sol_planets)
#' randomize_planet_positions(sol_orbits)
randomize_planet_positions <- function(orbits, randomizer=runif) {

  angles <- (seq_along(orbits$radius)-1) + randomizer(nrow(orbits)) * 2 * pi

  data.frame(
    planet = orbits$planet,
    angle = angles,
    x = orbits$radius * cos(angles),
    y = orbits$radius * sin(angles)
  )

}


# nolint end