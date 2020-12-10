#Amy Nestingen
#DSC 640 Week 3 and 4 Assignment
#9/15/20

#imports
library(stats)
library(ggplot2)
library(dbplyr)
library(tidyverse)
library(readxl)


getwd()
setwd('C:/Users/nesti/OneDrive/Bellevue/DSC 640/Week 3 and 4')
getwd()


#Read in Data
pop <- read_excel("world-population.xlsm")

#Summary of Statistics
summary(pop)

#Line Chart
ggplot(pop, aes(x=Year, y=Population)) + geom_line() + 
  labs(title="Population by Year",x="Year", y = "Population")

#Step Chart
ggplot() + 
  geom_step(data=pop,mapping=aes(x=Year,y=Population),
            linetype=2,color='#1b9e77',alpha=0.5) + 
      ylab('Population') + xlab('Year') 




