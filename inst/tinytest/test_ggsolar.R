library(ggsolar)

shld_be <- c("Lesra Viii", "Tinus Proxima", "Nigplu D", "Nusam", "Gussiania",
"Aenma", "Depe D", "Caty Proxima", "Magnus", "Cosamlos")

set.seed(1)
planets <- generate_random_planets(10)

expect_equivalent(shld_be, planets)


orbs <- generate_orbits(planets, num_polygon_points = 5)
expect_equivalent(orbs, structure(list(planet = c("Lesra Viii", "Tinus Proxima", "Nigplu D",
"Nusam", "Gussiania", "Aenma", "Depe D", "Caty Proxima", "Magnus",
"Cosamlos"), radius = 1:10, num_polygon_points = c(5, 5, 5, 5, 5, 5, 5, 5, 5, 5)),
class = "data.frame", row.names = c(NA, -10L
)))
set.seed(3)
ppos <- randomize_planet_positions(orbs)

expect_equivalent(ppos, structure(list(planet =
c("Lesra Viii", "Tinus Proxima", "Nigplu D",
"Nusam", "Gussiania", "Aenma", "Depe D", "Caty Proxima", "Magnus",
"Cosamlos"), angle = c(1.05583604929519, 6.07377517395879, 4.41866412626915,
5.05921544626883, 7.78311011310412, 8.7975198400928, 6.78309502563394,
8.85103219869237, 11.6292301564148, 12.9645597060423), x = c(0.492500278444618,
1.95630741627465, -0.868558655307667, 1.35965981757038, 0.354061035904789,
-4.85783899670659, 6.14338089114735, -6.71898992310528, 5.32885371204113,
9.21764684274087), y = c(0.87031228632714, -0.41576591133572,
     -2.87151630019579, -3.76182471421576, 4.98744832382793, 3.52156219341313,
     3.35542414998248, 4.34225453114044, -7.25281449615702, 3.87749747678955
)), class = "data.frame", row.names = c(NA, -10L)))