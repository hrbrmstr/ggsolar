library(ggsolar)

shld_be <- c("Lesra Viii", "Tinus Proxima", "Nigplu D", "Nusam", "Gussiania",
  "Aenma", "Depe D", "Caty Proxima", "Magnus", "Cosamlos")

set.seed(1)
is_it <- generate_random_planets(10)

expect_equal(shld_be, is_it)

set.seed(2)
orbs <- generate_orbits(is_it)

expect_equal(digest::digest(orbs), "2d00d7711cf4872621b8bd10f5fc34e3")

set.seed(3)
ppos <- randomize_planet_positions(orbs)

expect_equal(digest::digest(ppos), "b2ef805bc635e2af4d7709ad96414ce9")

