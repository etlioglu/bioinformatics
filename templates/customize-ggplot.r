# based on scCustomize and dittoSeq packages

# scCustomize::DiscretePalette_scCustomize(num_colors = 40, palette = "ditto_seq")

library(ggplot2)

ditto_seq_40 <-
  c(
    "#E69F00",
    "#56B4E9",
    "#009E73",
    "#F0E442",
    "#0072B2",
    "#D55E00",
    "#CC79A7",
    "#666666",
    "#AD7700",
    "#1C91D4",
    "#007756",
    "#D5C711",
    "#005685",
    "#A04700",
    "#B14380",
    "#4D4D4D"
    "#FFBE2D",
    "#80C7EF",
    "#00F6B3",
    "#F4EB71",
    "#06A5FF",
    "#FF8320",
    "#D99BBD",
    "#8C8C8C",
    "#FFCB57",
    "#9AD2F2",
    "#2CFFC6",
    "#F6EF8E",
    "#38B7FF",
    "#FF9B4D",
    "#E0AFCA",
    "#A3A3A3"
    "#8A5F00",
    "#1674A9",
    "#005F45",
    "#AA9F0D",
    "#00446B",
    "#803800",
    "#8D3666",
    "#3D3D3D"
  )

options(ggplot2.discrete.colour = ditto_seq_40)
theme_set(theme_bw())
