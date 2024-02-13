library(ggplot2)
library(tidyverse)

mapdata <- map_data("world")
view(mapdata)

mydata <-read.csv ("C:/Users/Paula/Desktop/anul2/Sem1/Country-data.csv")
view(mydata)

mapdata <-left_join (mapdata, mydata, by ="region")
view(mapdata)

mapdata1 <-mapdata %>% filter (!is.na(mapdata$income))
view(mapdata1)

map1 <- ggplot(mapdata1, aes(x = long, y= lat, group=group))+
  geom_polygon(aes(fill = income), color = "black")
map1

map2 <- map1 + scale_fill_gradient(name = "income", low = "brown4", high = "darkgoldenrod1", na.value = "grey50" )
map2
