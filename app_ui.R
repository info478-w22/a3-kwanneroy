
# Page One
page_one <- tabPanel(
  "Introduction",
  mainPanel(   
    h1("Overview and Intention"),
    p("This is an interactive disease modeling simulation of COVID-19 spread."),
    p("This model examines how real world interventions, such as masks and social distancing, translate to and affect the rate and probability of the COVID pandemic."),
    p("The deterministic model solves differential equations representing analytic epidemic systems in continuous time."),
    p("The models are deterministic because their solutions are fixed mathematical functions of the input parameters and initial conditions, with no stochastic variability in the disease and demographic transition processes. (statnet.org)"),
    p("The Stochastic model takes into account the random nature of an infectious disease."),
    p("In this project, I will be comparing the probability of infection (per transmissible act between a susceptible and an infected person), the average number of transmissible acts (per person per unit time), and the average rate of recovery with immunity for enforcing masks, enforcing social distancing, and not enforcing any measures.")
  ))
# Widgets 

# Page 2
page_two <- tabPanel(
  "Deterministic Model",
  sidebarLayout(             
    sidebarPanel(selectInput(
      inputId = "chosen_mandate",
      label = "Choose Mandate Level",
      
      choices = c("None" = "none", "Masks Required" = "masks", "Enforce Social Distancing" = "sd"),
      selected = "None"
    )),           
    mainPanel(   
      plotOutput("dcm")
  )))

# Page 3
page_three <- tabPanel(
  "Stochastic Model",
  sidebarLayout(             
    sidebarPanel(selectInput(
      inputId = "chosen_mandate2",
      label = "Choose Mandate Level",
      
      choices = c("None" = "none", "Masks Required" = "masks", "Enforce Social Distancing" = "sd"),
      selected = "None"
    )),           
    mainPanel(   
      plotOutput("icm")
    )))

# Page 4

page_four <- tabPanel(
  "Interpretation",
  h1("Observations and Interpretation"),
  p("The Deterministic Model showcases that increasing restrictions and interventions does indeed decrease the probability and rate of being infected with Covid. 
  This can be seen through the number of initial infected and the number of initial recovered decreasing for each restriction added.
  If Wearing Masks is enforced, the probability of infection decreases to 0.41 (from 0.63) and the average rate of infection decreases to 0.29 (from 0.35).
  If Social Distancing is enforced, the probability of infection decreases to 0.32, and the average rate of infection descreases to 0.09. 
  Ultimately, this model shows that Social Distancing is the most efficient way to reduce the risk of COVID infection, and that Wearing Masks is a close second/alternative in reducing the risk of infection. 
  Without any restrictions (without masks or social distancing), the risk of COVID infection is the highest."),
  p("The Stochastic Model shows similar results and therefore also showcases that increasing restrictions and interventions does indeed decrease the probability and rate of being infected with Covid. 
  This can be seen through the number of initial infected and the number of initial recovered decreasing for each restriction added.
  Although the number of initial susceptible stays basically the same, the fact that the number of initial infected continuously decreases showcases the efficacy of implementing COVID restrictions. 
  The probability and rate of infection is the same as described above and therefore both decrease by about .10 when masks are enforced, about decrease an additional ~.10 when social distancing is enforced. 
  Ultimately, this model also shows that Social Distancing is the most efficient way to reduce the risk of COVID infection, and that Wearing Masks is a close second/alternative in reducing the risk of infection. 
  Without any restrictions (without masks or social distancing), the risk of COVID infection is the highest."),
  p("The main difference between the models is that the Stochastic model takes into account the random nature of an infectious disease and therefore will have higher probability and rates of infection, as can be seen through the graph displaying higher rates of initial infection (Without any restrictions)."),
  p("The main limitation in my approach is that I used data gathered from the entire COVID-19 pandemic, not just the latest Omicron variant. Since each variant has different probabilities and rates of infection, the effect of Masks or Social Distancing mandates would look different for the Omicron variant than the rest of the pandemic. My data is therefore limited and constrained to the rates of the overall COVID-19 pandemic, and may not be as updated as the most recent data released on Omicron specifically."),
  p("Ultimately, this project and these two models argue that Social Distancing and Wearing Masks should still be enforced to continue reducing the impact and spreading of COVID-19."),
   p("Sources: https://pubmed.ncbi.nlm.nih.gov/32834937/"),
  p("https://journals.lww.com/jphmp/fulltext/2020/11000/social_distancing_metrics_and_estimates_of.17.aspx"),
  p("https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0252963"),
  p("https://www.nature.com/articles/s41598-021-94960-5"),
  p("https://www.ucdavis.edu/coronavirus/news/your-mask-cuts-own-risk-65-percent"),
  p("https://www.cdc.gov/coronavirus/2019-ncov/covid-data/covidview/index.html"),
  p("https://www.mayoclinic.org/diseases-conditions/coronavirus/in-depth/coronavirus-mask/art-20485449")
)

ui <- navbarPage("Assignment 3: Disease Modeling",
                 page_one,
                 page_two,
                 page_three,
                 page_four
)