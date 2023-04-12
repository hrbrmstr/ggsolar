#' Generate a vector of `n` believable planetary names using hidden Markov model.
#'
#' \if{html}{
#'   \out{<div style="text-align: center">}\figure{README-rando-1.png}{options: style="width:750px;max-width:75\%;"}\out{</div>}
#' }
#' \if{latex}{
#'   \out{\begin{center}}\figure{README-rando-1.png}\out{\end{center}}
#' }
#'
#' @param num_planets how many planets?
#' @return character vector of planet names
#' @references Riffed from [planet-name-generator](https://github.com/sayamqazi/planet-name-generator).
#' @export
#' @examples
#' library(ggplot2)
#'
#' generate_random_planets(15)
#'
#' set.seed(42)
#' rando_planets <- generate_random_planets(12)
#'
#' rando_orbits <- generate_orbits(rando_planets)
#'
#' set.seed(123) # this produced a decent placements
#'
#' placed_planets <- randomize_planet_positions(rando_orbits)
#'
#' plot_orbits(
#'   orbits = rando_orbits,
#'   planet_positions = placed_planets,
#'   label_planets = TRUE,
#' ) +
#'   hrbrthemes::theme_ipsum(grid="") +
#'   ggplot2::coord_equal() +
#'   ggplot2::labs(
#'     title = "Rando System"
#'   ) +
#'   theme_enhance_solar()

generate_random_planets <- function(num_planets = 20) {

  planets <- planet_fragments

  syllables <- stringi::stri_split_fixed(planets, "-", simplify = TRUE)

  total_syllables <- length(syllables)

  syllables <- unique(syllables)

  div_index <- length(syllables) / total_syllables

  size <- length(syllables) + 1

  freq <- matrix(0, nrow = size, ncol = size)

  for (p in planets) {
    lex <- stringi::stri_split_fixed(p, "-", simplify = TRUE)
    lex_indices <- match(lex, syllables) - 1

    if (length(lex_indices) > 1) {
      row_indices <- lex_indices[-length(lex_indices)]
      col_indices <- lex_indices[-1]
      freq[cbind(row_indices, col_indices)] <- freq[cbind(row_indices, col_indices)] + 1
    }

    last_syllable_index <- lex_indices[length(lex_indices)]
    freq[last_syllable_index, size - 1] <- freq[last_syllable_index, size - 1] + 1
  }

  max_names <- num_planets
  num_names <- 0
  planet_name <- ""

  c("prime", "",
    "B", "",
    "alpha", "",
    'proxima', "",
    "IV", "",
    "V", "",
    "C", "",
    "VI", "",
    "VII", "",
    "VIII", "",
    "X", "",
    "IX", "",
    "D", "",
    "", "") -> suffixes

  generated_planet_names <- c()

  while (num_names < max_names) {

    length <- sample(2:3, 1)
    initial <- sample(0:(size - 2), 1)

    planet_name <- ""
    while (length > 0) {
      while (all(freq[initial + 1, ] != 1)) {
        initial <- sample(0:(size - 2), 1)
      }

      planet_name <- paste0(planet_name, syllables[initial + 1])
      initial <- which(freq[initial + 1, ] == 1)[1] - 1
      length <- length - 1
    }

    suffix_index <- sample(1:length(suffixes), 1)
    planet_name <- paste(planet_name, suffixes[suffix_index])
    generated_planet_names <- append(generated_planet_names, planet_name)

    num_names <- num_names + 1
  }

  stringi::stri_trans_totitle(
    stringi::stri_trim_both(generated_planet_names)
  )

}
