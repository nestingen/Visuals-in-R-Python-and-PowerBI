#Amy Nestingen
#DSC 640 Exercise 5.2
#Heat Maps, Spatial Charts, and Contour Charts
#10/24/20

#imports
library(stats)
library(ggplot2)
library(dbplyr)
library(tidyverse)
library(plotly)

getwd()
setwd('C:/Users/nesti/OneDrive/Bellevue/DSC 640/Week 9 and 10')
getwd()

#Read in Data
nba <- read.csv("ppg2008.csv")
summary(nba)

#Sort Data
nba <- nba[order(nba$PTS),]

#Prep Data
row.names(nba) <- nba$Name

nba <- nba[,2:20]

nba_matrix <- data.matrix(nba)



#Heatmap
nba_heatmap <- heatmap(nba_matrix, Rowv=NA, Colv=NA, col = cm.colors(256), scale="column", margins=c(5,10))


#Read in Data
usa <- read.csv("costcos-geocoded.csv")
summary(usa)

install.packages(c("maps", "mapdata"))
if(!requireNamespace("devtools")) install.packages("devtools")
devtools::install_github("dkahle/ggmap", ref = "tidyup", force=TRUE)


library(ggmap)
library(maps)
library(mapdata)

library(sf)
library(mapview)


#Read in Data
cost <- read.csv("costcos-geocoded.csv")
summary(cost)

usa <- map_data("usa")



long <- cost$Longitude
lat <- cost$Latitude
group <- cost$Group

#US Map
#usa <- map_data("usa") # we already did this, but we can do it again
ggplot() + 
  geom_polygon(data = usa, aes(x=long, y = lat, group = group), fill = NA, color = "red") + 
  coord_fixed(1.3)

#Purple map
gg1 <- ggplot() + 
  geom_polygon(data = usa, aes(x=long, y = lat, group = group), fill = "violet", color = "blue") + 
  coord_fixed(1.3)
gg1


#Add Points
labs <- data.frame(
  long = cost$Longitude,
  lat = cost$Latitude,
  names = cost$City,
  stringsAsFactors = FALSE
)  


gg1 + 
  geom_point(data = labs, aes(x = long, y = lat), color = "black", size = 5) +
  geom_point(data = labs, aes(x = long, y = lat), color = "yellow", size = 4)



#Contour Plots

attach(nba)
ggplot(data = nba, aes(x = nba$MIN, y = nba$PTS)) +
  ylim(15,35) + 
  theme_bw()+
  geom_point(alpha = .2, col = "red") +
  geom_density2d(color = "black") +
  ggtitle("Countour Plot") +
  theme(plot.title = element_text(hjust = .5)) +
  labs( x = "Minutes", y = "FG's")
detach(nba)







