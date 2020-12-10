#Amy Nestingen
#DSC 640 Exercise 6.2
#Histograms, Box Plots and Bullet Charts
#10/24/20

#imports
library(stats)
library(ggplot2)
library(dbplyr)
library(tidyverse)
library(plotly)

getwd()
setwd('C:/Users/nesti/OneDrive/Bellevue/DSC 640/Week 11 and 12')
getwd()

#Read in Data
crime <- read.csv("crimeratesbystate-formatted.csv")
summary(crime)

birth <- read.csv("birth-rate.csv")
summary(birth)

#histogram
hist(crime$murder)

#Boxplot
boxplot(crime$murder,data=crime, main="Murder by State", ylab="Murder")

#Bullet chart
crime_US <- subset( birth, State = "World")

plot_ly(
  type = "indicator",
  mode = "number+gauge+delta",
  gauge = list(shape = "bullet"),
  delta = list(reference = 20.07),
  value = 19.98,
  domain = list(x = c(0, 1), y = c(0, 1)),
  title= list(text = "Murder Rate in US"),
  height = 150)




