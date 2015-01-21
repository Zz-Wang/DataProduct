library(shiny)
library(slidify)
library(knitr)
setwd("c://Users//User//Documents//GitHub//DataProduct//")
runApp(display.mode="showcase")



author("first_deck")
slidify("index.Rmd")
browseURL("index.html")