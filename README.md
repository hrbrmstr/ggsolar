
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![R-CMD-check](https://github.com/hrbrmstr/ggsolar/workflows/R-CMD-check/badge.svg)](https://github.com/hrbrmstr/ggsolar/actions?query=workflow%3AR-CMD-check)  
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.6.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# ggsolar

Generate Solar System Plots

## Description

Generate “solar system” plots using everyone’s favorite plotting
package.

## What’s Inside The Tin

The following functions are implemented:

- `generate_orbits`: Generate concentric circular orbits for “n” planets
- `generate_random_planets`: Generate a vector of n believable planetary
  names using hidden Markov model.
- `plot_orbits`: Return a skeleton of a ggplot2 plot of solar system
  plot
- `randomize_planet_positions`: Generate random planetary positions
  given a data frame of orbits
- `sol_planets`: Our Solar System
- `theme_enhance_solar`: Provides basic cleanup defaults for solar
  system plots

## Installation

``` r
remotes::install_github("hrbrmstr/ggsolar")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(ggsolar)
library(ggplot2)

# current version
packageVersion("ggsolar")
## [1] '0.1.0'
```

## Sol

``` r
sol_orbits <- generate_orbits(sol_planets)

set.seed(1323) # this produced decent placements

placed_planets <- randomize_planet_positions(sol_orbits)

plot_orbits(
  orbits = sol_orbits, 
  planet_positions = placed_planets,
  label_planets = TRUE,
  label_family = hrbrthemes::font_es_bold
) +
  hrbrthemes::theme_ipsum_es(grid="") +
  coord_equal() +
  labs(
    title = "Sol",
    caption = "Pluto is 100% a planet"
  ) +
  theme_enhance_solar()
```

<img src="man/figures/README-sol-1.png" width="576" />

## Rando!

``` r
set.seed(42)
(rando_planets <- generate_random_planets(12))
##  [1] "Ososi"       "Morlambtune" "Obli Vi"     "Lantitan"    "Tanthos"     "Onhy"        "Lesbomor C"  "Radido"     
##  [9] "Lesstel"     "Altan Prime" "Lasdre"      "Brenta"

rando_orbits <- generate_orbits(rando_planets)

set.seed(123) # this produced decent placements

placed_planets <- randomize_planet_positions(rando_orbits)

plot_orbits(
  orbits = rando_orbits, 
  planet_positions = placed_planets,
  label_planets = TRUE,
  label_family = hrbrthemes::font_es_bold
) +
  hrbrthemes::theme_ipsum_es(grid="") +
  coord_equal() +
  labs(
    title = "Rando System"
  ) +
  theme_enhance_solar()
```

<img src="man/figures/README-rando-1.png" width="576" />

## ggsolar Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
|:-----|---------:|-----:|----:|-----:|------------:|-----:|---------:|-----:|
| R    |        8 | 0.36 | 191 | 0.35 |          61 | 0.31 |      141 | 0.40 |
| Rmd  |        1 | 0.05 |  42 | 0.08 |          26 | 0.13 |       34 | 0.10 |
| YAML |        2 | 0.09 |  38 | 0.07 |          10 | 0.05 |        2 | 0.01 |
| SUM  |       11 | 0.50 | 271 | 0.50 |          97 | 0.50 |      177 | 0.50 |

clock Package Metrics for ggsolar

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
