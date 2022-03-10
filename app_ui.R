# load your libraries
library(shiny)
library(shinythemes)

# Page One
page_one <- tabPanel(
  "Introduction",
  mainPanel(   
    h1("Overview and Intention"),
    p("This is an interactive disease modeling simulation of COVID-19 spread.")
  ))
# Widgets 

# Page 2
page_two <- tabPanel(
  "Deterministic Model",
  p("text")
)

# Page 3
page_three <- tabPanel(
  "Stochastic Model",
  p("text")
)

# Page 4

page_four <- tabPanel(
  "Interpretation",
  p("Observations")
)

ui <- navbarPage(theme = shinytheme("journal"),
                 "Assignment 3: Disease Modeling",
                 page_one,
                 page_two,
                 page_three,
                 page_four
)