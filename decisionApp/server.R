

library(shiny)
library(ggfortify)
library(tidyverse)
library(ggplot2)
library(plotly)

list.files("../R", pattern = ".R", full.names = T) %>%
  purrr::walk(source)

thematic::thematic_shiny()

# Number of monte carlo simulations
nSim <- 10000

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
    
    dist11 <- (rt(nSim, params11[3]) + params11[1]) * params11[2]
    dist12 <- (rt(nSim, params12[3]) + params12[1]) * params12[2]
    dist13 <- (rt(nSim, params13[3]) + params13[1]) * params13[2]
    dist14 <- (rt(nSim, params14[3]) + params14[1]) * params14[2]
    dist15 <- (rt(nSim, params15[3]) + params15[1]) * params15[2]
    
    wSum <- input$w1 + input$w2 + input$w3 + input$w4 + input$w5
    
    combined <- input$w1/wSum*dist11 + input$w2/wSum*dist12 +
      input$w3/wSum*dist13 + input$w4/wSum*dist14 +input$w5/wSum*dist15
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
    params21 <- get_params(input$params21)
    params22 <- get_params(input$params22)
    params23 <- get_params(input$params23)
    params24 <- get_params(input$params24)
    params25 <- get_params(input$params25)
    
    dist21 <- (rt(nSim, params21[3]) + params21[1]) * params21[2]
    dist22 <- (rt(nSim, params22[3]) + params22[1]) * params22[2]
    dist23 <- (rt(nSim, params23[3]) + params23[1]) * params23[2]
    dist24 <- (rt(nSim, params24[3]) + params24[1]) * params24[2]
    dist25 <- (rt(nSim, params25[3]) + params25[1]) * params25[2]
    
    wSum <- input$w1 + input$w2 + input$w3 + input$w4 + input$w5
    
    combined <- input$w1 / wSum * dist21 + input$w2 / wSum * dist22 +
      input$w3 / wSum * dist23 + input$w4 / wSum * dist24 + 
      input$w5 / wSum * dist25
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
      geom_density(size = 1) +
      scale_x_continuous(limits = c(input$xMin, input$xMax))
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
