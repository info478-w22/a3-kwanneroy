library("shiny")
library("tidyverse")
library("dplyr")

server <- function(input, output) {
  require(EpiModel)
  
  #Deterministic Model 
  param <- param.dcm(inf.prob = 0.5, act.rate = c(2))
  init <- init.dcm(s.num = 999, i.num = 1)
  control <- control.dcm(type = "SI", nsteps = 365)
  
  mod <- dcm(param, init, control)
  mod
  plot(mod)
  summary(mod, at=100)
  
  comp_plot(mod, at = 2, digits = 1)
  
  #Stochastic Model 
  param <- param.icm(inf.prob = 0.2, act.rate = 0.25)
  init <- init.icm(s.num = 500, i.num = 1)
  control <- control.icm(type = "SI", nsims = 10, nsteps = 300)
  mod <- icm(param, init, control)
  return(mod)
}