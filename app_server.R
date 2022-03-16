
server <- function(input, output) {

  output$dcm <- renderPlot({
  
  prob_rate <- 0
  if (input$chosen_mandate == "none") {
    prob_rate <- 0.63
  } else if (input$chosen_mandate == "masks") {
    prob_rate <- 0.41
  } else {
    prob_rate <- 0.32
  }
  
  avg_rate <- 0
  if (input$chosen_mandate == "none") {
    avg_rate <- 0.35
  } else if (input$chosen_mandate == "masks") {
    avg_rate <- 0.29
  } else {
    avg_rate <- 0.09
  }
  
  #Deterministic Model 
  param <- param.dcm(inf.prob = prob_rate, act.rate = avg_rate, rec.rate = 1/7)
  init <- init.dcm(s.num = 500, i.num = 1, r.num = 0)
  control <- control.dcm(type = "SIR", nsims = 10, nsteps = 500)
  mod <- dcm(param, init, control)
  plot(mod, main = "Deterministic Model")
  })
  
  
  #Stochastic Model 
  output$icm <- renderPlot ({
    
    prob_rate <- 0
    if (input$chosen_mandate2 == "none") {
      prob_rate <- 0.63
    } else if (input$chosen_mandate2 == "masks") {
      prob_rate <- 0.41
    } else {
      prob_rate <- 0.32
    }
    
    avg_rate <- 0
    if (input$chosen_mandate2 == "none") {
      avg_rate <- 0.35
    } else if (input$chosen_mandate2 == "masks") {
      avg_rate <- 0.29
    } else {
      avg_rate <- 0.09
    }
    
    param <- param.icm(inf.prob = prob_rate, act.rate = avg_rate, rec.rate = 1/7)
    init <- init.icm(s.num = 100, i.num = 1, r.num = 0)
    control <- control.icm(type = "SIR", nsims = 10, nsteps = 500)
    mod <- icm(param, init, control)
    par(mar = c(3.2, 3, 2, 1), mgp = c(2, 1, 0), mfrow = c(1, 2))
    plot(mod, qnts = FALSE, sim.lines = FALSE, mean.lty = 2, legend = FALSE)
  })
}