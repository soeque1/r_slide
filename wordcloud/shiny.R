#rm(list=ls()) #clear memory of any variables
library(shiny)
setwd('/Users/kimhyungjun/Dropbox/R_lecture/mydeck/r_slide/wordcloud/')
runApp()


library(shinyapps)
shinyapps::deployApp('/Users/kimhyungjun/Dropbox/R_lecture/mydeck/r_slide/wordcloud/')
