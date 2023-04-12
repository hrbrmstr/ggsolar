default_random_index <- function(x, y, planet) {

  idx <- sample(length(x), 1)

  data.frame(
    planet = planet,
    x = x[idx],
    y = y[idx]
  )

}

#' Generate random planetary positions given a data frame of orbits
#'
#' You can use this after calling [generate_orbits()] to compute a
#' random position along the orbit circle for each planet
#'
#' @param orbits (df) output of [generate_orbits()]
#' @param randomizer (ƒ) a function name that takes as parameters
#'        `x` and `y` vectors of coordinates (from an orbit polygon)
#'        and a `planet` name and returns a data frame of `x`, `y`,
#'        `planet` with `x` and `y` being a single random point from
#'        the `planet`'s orbit. By default, this is just (ultimate) a
#'        call to [sample()].
#' @return (data.fame) with the `planet` name and `x`/`y` coords
#' @export
#' @examples
#' sol_orbits <- generate_orbits(sol_planets)
#' randomize_planet_positions(sol_orbits)
randomize_planet_positions <- function(orbits, randomizer=default_random_index) {

  do.call(

    rbind.data.frame,

    by(

      orbits,

      orbits[["planet"]],

      function(xdf) {
        randomizer(xdf$x, xdf$y, xdf$planet[1])
      }

    )

  ) -> out

  rownames(out) <- NULL

  out

}

