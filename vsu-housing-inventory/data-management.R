## customize theme
custom_theme <- function() {
  theme_light() +
  theme(plot.margin = margin(20, 20, 20, 20),
        plot.title = element_text(size = 16, face = "bold", margin = margin(b = 10)),
        plot.subtitle = element_text(size = 14, hjust = 0),
        axis.text = element_text(size = 12),
        axis.title.x = element_text(size = 16, margin = margin(t = 10)),
        axis.title.y = element_text(size = 16, margin = margin(r = 10)),
        legend.position = "bottom"
  )
}


## data management
housing_dta <- 
  read_excel("data/20260318-vsu-housing-inventory.xlsx") |> 
  clean_names()
