library("dplyr")
library("rgdal")
library("ggplot2")
library("ggmap")
library("maptools")

City_line <- readOGR(dsn = "C:\\Users\\Jaunte\\Documents\\Projects\\Baltimore\\Baltimore_crime\\City\\Baltcity_20Line",
                     layer = "baltcity_line")
City_line <- City_line %>% fortify(region = "GEO_ID")

NBHD <- readOGR(dsn = "C:\\Users\\Jaunte\\Documents\\Projects\\Baltimore\\Baltimore_crime\\City\\Neighborhood_202010",
                layer = "nhood_2010")
NBHD <- NBHD %>% fortify() #works without region, GEO_ID does not work

bound_plot <- ggplot(data=City_line, 
                     aes(x=long, y=lat, group=group)) +
  geom_polygon(color='gray', fill='lightblue') + coord_equal() + theme_nothing()

nbhds_plot <- bound_plot + geom_polygon(data=NBHD,color='light gray') 
nbhds_plot
