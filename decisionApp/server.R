#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggfortify)
library(tidyverse)
library(ggplot2)
library(plotly)

# list.files("../R", pattern = ".R", full.names = T) %>%
#   purrr::walk(source)

thematic::thematic_shiny()

# Number of monte carlo simulations
nSim <- 10000

# Plot the output distribution given a 3d vector of parameters
plot_dist <- function(params){
  tibble(x = seq(-5, 5, 0.1),
         pdf = (dt(x - params[1], params[3]))*params[2]) %>%
    ggplot(aes(x = x, y = pdf)) +
    geom_line(size = 1)
}

# Take a comma separated string of parameters and
  # create a 3d vector of parameters
get_params <- function(params){
  strsplit(params, ",") %>%
    magrittr::extract2(1) %>%
    str_extract("[\\-\\.0-9]+") %>%
    as.numeric()
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  ### OPTION 1 #####
   # Create plots for each outcome distribution
  output$distPlot11 <- renderPlot({
    params <- get_params(input$params11)
    
    plot_dist(params)
  })
  
  output$distPlot12 <- renderPlot({
    params <- get_params(input$params12)
    
    plot_dist(params)
  })
  
  output$distPlot13 <- renderPlot({
    params <- get_params(input$params13)
    
    plot_dist(params)
  })
  
  output$distPlot14 <- renderPlot({
    params <- get_params(input$params14)
    
    plot_dist(params)
  })
  output$distPlot15 <- renderPlot({
    params <- get_params(input$params15)
    
    plot_dist(params)
  })
  
  
  # Create the combined posterior distibution for outcome 1
  pdf1 <- reactive({
    params11 <- get_params(input$params11)
    params12 <- get_params(input$params12)
    params13 <- get_params(input$params13)
    params14 <- get_params(input$params14)
    params15 <- get_params(input$params15)
    
    dist11 <- (rt(nSim, params11[3])+params11[1])*params11[2]
    dist12 <- (rt(nSim, params12[3])+params12[1])*params12[2]
    dist13 <- (rt(nSim, params13[3])+params13[1])*params13[2]
    dist14 <- (rt(nSim, params14[3])+params14[1])*params14[2]
    dist15 <- (rt(nSim, params15[3])+params15[1])*params15[2]
    
    combined <- input$w1*dist11 + input$w2*dist12 +
      input$w3*dist13 + input$w4*dist14 +input$w5*dist15
  })
  
  # CReate a plot associated with the Outcome 1 posterior
  output$combinedPlot1 <- renderPlot({
    tibble(x = pdf1()) %>%
      ggplot(aes(x = x)) +
      geom_density(size = 1)
  })
  
  
  #### OPTION 2 ######
  
  # Input variable pdfs for option 2
  output$distPlot21 <- renderPlot({
    params <- get_params(input$params21)
    
    plot_dist(params)
  })
  
  output$distPlot22 <- renderPlot({
    params <- get_params(input$params22)
    
    plot_dist(params)
  })
  
  output$distPlot23 <- renderPlot({
    params <- get_params(input$params23)
    
    plot_dist(params)
  })
  
  output$distPlot24 <- renderPlot({
    params <- get_params(input$params24)
    
    plot_dist(params)
  })
  output$distPlot25 <- renderPlot({
    params <- get_params(input$params25)
    
    plot_dist(params)
  })
  
  
  pdf2 <- reactive({
    params1 <- get_params(input$params21)
    params2 <- get_params(input$params22)
    params3 <- get_params(input$params23)
    params4 <- get_params(input$params24)
    params5 <- get_params(input$params25)
    
    dist1 <- (rt(nSim, params1[3])+params1[1])*params1[2]
    dist2 <- (rt(nSim, params2[3])+params2[1])*params2[2]
    dist3 <- (rt(nSim, params3[3])+params3[1])*params3[2]
    dist4 <- (rt(nSim, params4[3])+params4[1])*params4[2]
    dist5 <- (rt(nSim, params5[3])+params5[1])*params5[2]
    
    combined <- input$w1*dist1 + input$w2*dist2 +
      input$w3*dist3 + input$w4*dist4 +input$w5*dist5
  })
  
  # Posterior PDF for option 2
  output$combinedPlot2 <- renderPlot({
    tibble(x = pdf2()) %>%
      ggplot(aes(x = x)) +
      geom_density(size = 1)
  })
  
  output$comparisonPlot <- renderPlot({
    tibble(`Option 1` = pdf1(),
           `Option 2` = pdf2()) %>%
      pivot_longer(c(`Option 1`, `Option 2`),
                   names_to = "Option",
                   values_to = "x") %>%
      ggplot(aes(x = x, colour = Option, group = Option)) +
      geom_density(size = 1)
  })
  
  output$comparisonTable <- renderTable({
    # Percentiles for comparison table
    pct <- c(0, 1, 25, 50 , 75,  99, 100) / 100
    
    pct_tbl <- tibble(
      Percentile = pct * 100,
      `Option 1` = quantile(pdf1(), probs = pct),
      `Option 2` = quantile(pdf2(), probs = pct)
    )
  }
  )
  
  
})
