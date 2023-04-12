
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
- `plot_orbits`: Return a skeleton of a ggplot2 plot of solar system
  plot
- `randomize_planet_positions`: Generate random planetary positions
  given a data frame of orbits
- `sol_planets`: Our Solar System
- `theme_enhance_solar`: Provides basic cleanup defaults for solar
  system plots

## Installation

``` r
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

set.seed(1323) # this produced a decent placements

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

## ggsolar Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
|:-----|---------:|-----:|----:|-----:|------------:|-----:|---------:|-----:|
| R    |        7 | 0.35 |  98 | 0.30 |          35 | 0.27 |       97 | 0.37 |
| YAML |        2 | 0.10 |  38 | 0.12 |          10 | 0.08 |        2 | 0.01 |
| Rmd  |        1 | 0.05 |  25 | 0.08 |          20 | 0.15 |       31 | 0.12 |
| SUM  |       10 | 0.50 | 161 | 0.50 |          65 | 0.50 |      130 | 0.50 |

clock Package Metrics for ggsolar

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
