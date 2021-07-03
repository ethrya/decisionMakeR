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

list.files("../R", pattern = ".R", full.names = T) %>%
  purrr::walk(source)

thematic::thematic_shiny()

nSim <- 10000

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
      params <- get_params(input$params1)
        
      plot_dist(params)
    })
    
    output$distPlot2 <- renderPlot({
      params <- get_params(input$params2)
      
     plot_dist(params)
    })
    
    output$distPlot3 <- renderPlot({
      params <- get_params(input$params3)
      
      plot_dist(params)
    })
    
    output$distPlot4 <- renderPlot({
      params <- get_params(input$params4)
      
      plot_dist(params)
    })
    output$distPlot5 <- renderPlot({
      params <- get_params(input$params5)
      
      plot_dist(params)
    })
  
    
    pdf <- reactive({
      params1 <- get_params(input$params1)
      params2 <- get_params(input$params2)
      params3 <- get_params(input$params3)
      params4 <- get_params(input$params4)
      params5 <- get_params(input$params5)

      dist1 <- (rt(nSim, params1[3])+params1[1])*params1[2]
      dist2 <- (rt(nSim, params2[3])+params2[1])*params2[2]
      dist3 <- (rt(nSim, params3[3])+params3[1])*params3[2]
      dist4 <- (rt(nSim, params4[3])+params4[1])*params4[2]
      dist5 <- (rt(nSim, params5[3])+params5[1])*params5[2]
      
      combined <- input$w1*dist1 + input$w2*dist2 +
        input$w3*dist3 + input$w4*dist4 +input$w5*dist5
    })
    
    output$combinedPlot <- renderPlot({
      tibble(x = pdf()) %>%
        ggplot(aes(x = x)) +
        geom_density(size = 1)
      })

})
