# load your libraries
library(shiny)
library(shinythemes)

# Page One
page_one <- tabPanel(
  "Introduction",
  mainPanel(   
    h1(""),
    p("text")
  ))
# Widgets 

# Page 2
page_two <- tabPanel(
  "",
  h1(""),
  p("text"),
  sidebarLayout(             
    sidebarPanel(
      h2(""),
      p(""))
))