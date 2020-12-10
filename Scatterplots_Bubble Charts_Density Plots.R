#Amy Nestingen
#DSC 640 Exercise 4.2
#Scatterplots, Bubble Charts, and Density Plots
#10/11/20

#imports
library(stats)
library(ggplot2)
library(dbplyr)
library(tidyverse)
library(plotly)

getwd()
setwd('C:/Users/nesti/OneDrive/Bellevue/DSC 640/Week 7 and 8')
getwd()

#Read in Data
crime <- read.csv("crimerates-by-state-2005.csv")
summary(crime)


#Scatter Plot
scat <- plot_ly(data = crime, x = ~burglary, y = ~larceny_theft)
scat

#Bubble Chart

bubble <- plot_ly(crime, x = ~burglary, y = ~larceny_theft, text = ~state, type = 'scatter', mode = 'markers',
               marker = list(size = ~murder, opacity = 0.5))
bubble <- bubble %>% layout(title = 'Burglary vs. Larceny Theft by State sized by Murder Rate',
                      xaxis = list(showgrid = FALSE),
                      yaxis = list(showgrid = FALSE))

bubble

#Density Plot

#Read in Data
birth <- read.csv("birth-rates-yearly.csv")
summary(birth)


p <- ggplot(birth, aes(x = rate)) + 
  geom_density(aes(fill = year), alpha = 0.5) + 
  ggtitle("Density of Birth Rate")

fig <- ggplotly(p)

fig
