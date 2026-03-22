## customize theme
custom_theme <- function() {
  theme_light() +
  theme(plot.margin = margin(20, 20, 20, 20),
        plot.title = element_text(size = 16, face = "bold", margin = margin(b = 10)),
        plot.subtitle = element_text(size = 14, hjust = 0),
        axis.text.x = element_text(size = 12, margin = margin(b=10)),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 16, margin = margin(t = 10)),
        axis.title.y = element_text(size = 16, margin = margin(r = 10)),
        strip.text = element_text(size = 16, face = "bold"),
        legend.position = "bottom"
  )
}

## function used oftenly

n_pct <- function(data){
  data |> 
    mutate(pct = n / sum(n)) |> 
    mutate(pct_lab = str_c(round(pct*100, 0), "% (n=", n, ")"))
}





## data management
housing_dta <- 
  read_excel("data/20260318-vsu-housing-inventory.xlsx") |> 
  clean_names()
