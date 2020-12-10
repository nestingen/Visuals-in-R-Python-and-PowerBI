#Amy Nestingen
#DSC 640 Week 1 and 2 Assignment
#9/10/20

#imports
library(stats)
library(ggplot2)
library(dbplyr)
library(tidyverse)
library(readxl)

getwd()
setwd('C:/Users/nesti/OneDrive/Bellevue/DSC 640/Week 1 and 2')
getwd()


#import data
hotdog = read_excel ("hotdog-contest-winners.xlsm")
head(hotdog)

obama = read_excel ("obama-approval-ratings.xls")
head(obama)

#BarChart
p<-ggplot(data=hotdog, aes(x=Country)) +
  geom_bar(size = 20)
p


#Stacked Bar Chart
(ggplot(obama)
  + aes(x = Issue,y = Percent)
  + geom_col(aes(fill = Status), width = .7)
  + theme(axis.text.x = element_text(angle = 90))
)


#Pie Chart
(ggplot(obama, aes(x="", y=Percent, fill=Status))
  + geom_bar(width = 1, stat = "identity")
  + coord_polar("y", start=0)
)


#Donut Chart

#Only include Education
edu <- subset(obama, Issue == 'Education',
                  select=c(Status, Percent))
edu

# Add addition columns, needed for drawing with geom_rect.
edu$fraction = edu$Percent / sum(edu$Percent)
edu = edu[order(edu$fraction), ]
edu$ymax = cumsum(edu$fraction)
edu$ymin = c(0, head(edu$ymax, n=-1))


(ggplot(edu, aes(fill=Status, ymax=ymax, ymin=ymin, xmax=4, xmin=3)) +
  geom_rect() +
  coord_polar(theta="y") +
  xlim(c(0, 4)) +
  labs(title="Donut plot")
)



