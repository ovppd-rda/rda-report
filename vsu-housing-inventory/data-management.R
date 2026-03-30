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

## data management
housing_dta <- 
  read_excel("data/20260330-vsu-housing-inventory.xlsx") |> 
  clean_names() |> 
  mutate(contract_date = as_date(as.numeric(contract_date), origin = "1899-12-30"))


## function used oftenly

n_pct <- function(data){
  data |> 
    mutate(pct = n / sum(n)) |> 
    mutate(pct_lab = str_c(round(pct*100, 0), "% (n=", n, ")"))
}



## bar plot function
title_plot <- glue(" (n = {nrow(housing_dta)})")
subtitle_text <- str_wrap("", 70)

plt_barplot <- function(data, variable, title_plot){
  data |> 
    select({{variable}}) |> 
    na.omit() |> 
    count({{variable}}) |> 
    filter(n > 1) |> 
    n_pct() |> 
    mutate(var_reordered = fct_reorder({{variable}}, pct)) |> 
    ggplot(aes(pct, var_reordered)) +
    geom_col(width = 0.6) +
    geom_text(aes(label = pct_lab), hjust = -0.1, fontface = "bold", size = 4) +
    scale_x_continuous(labels = percent_format(), limits = c(0, 1), breaks = seq(0, 1, 0.25)) +
    coord_cartesian(expand = TRUE, clip = "off") +
    labs(
        title = title_plot,
        subtitle = subtitle_text,
        x = NULL,
        y = NULL
    ) +
    custom_theme()
}






