#' Provides basic cleanup defaults for solar system plots
#'
#' @param bg,fg background/foreground colors
#' @export
theme_enhance_solar <- function(bg = "black", fg = "white") {

  theme(
    text = element_text(color = fg),
    plot.title = element_text(color = fg),
    plot.subtitle = element_text(color = fg),
    plot.caption = element_text(color = fg),
    plot.background = element_rect(fill = bg, color = NA),
    panel.background = element_rect(fill = bg, color = NA),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text.x.bottom = element_blank(),
    axis.text.y.left = element_blank()
  )

}