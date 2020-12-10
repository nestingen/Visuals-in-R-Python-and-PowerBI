#Amy Nestingen
#DSC 640 Assignment 3.2
#Tree Maps, Area Charts and Stacked Area Charts 
#10/07/20


## Set the working directory location to the file location##

setwd('C:/Users/nesti/OneDrive/Bellevue/DSC 640/Week 5 and 6')
getwd()

## Import the datafile in R and view the data sample)
data= read.csv("unemployement-rate-1948-2010.csv", header = TRUE, sep =",")
View(data)

## Installing the package and calling the package in R##
install.packages("treemap")
library(treemap)


## Creating the most basic treemap##
treemap(data,index = c("Year"),vSize ="Value")


#Area chart
install.packages("plotly")
library(plotly)

density <- density(data$Value)

fig <- plot_ly(x = ~density$x, y = ~density$y, type = 'scatter', mode = 'lines', fill = 'tozeroy')
fig <- fig %>% layout(xaxis = list(title = 'Value'),
                      yaxis = list(title = 'Density'))
fig


## Import the datafile in R and view the data sample)
expend <- read.delim("expenditures.txt")
View(expend)

#Statcked Area chart

# Packages
library(ggplot2)
library(dplyr)

aggr_data <- aggregate(data$Value, list(diet = data$Diet), mean)
aggr_data <- group_by(data, Year) %>% summarise(mean = mean(Value))
View(aggr_data)

# create data
time <- as.numeric(rep(seq(1,7),each=7))  # x Axis
value <- runif(49, 10, 100)               # y Axis
group <- rep(LETTERS[1:7],times=7)        # group, one shape per group
data <- data.frame(time, value, group)

# stacked area chart
ggplot(data, aes(x=Year, y= Value, fill= Period)) + 
  geom_area()






