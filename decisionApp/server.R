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

nSim <- 1000

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
      params <- strsplit(input$params1, ",") %>%
        magrittr::extract2(1) %>%
        str_extract("[\\.0-9]+") %>%
        as.numeric()
        
        ggdistribution(dnorm, seq(-3, 3, 0.1),
                       mean = params[1],
                       sd = params[2])

    })
    
    output$distPlot2 <- renderPlot({
      
      params <- strsplit(input$params2, ",") %>%
        magrittr::extract2(1) %>%
        str_extract("[\\.0-9]+") %>%
        as.numeric()
      
      ggdistribution(dnorm, seq(-3, 3, 0.1),
                     mean = params[1],
                     sd = params[2])
      
    })
    
    
    pdf <- reactive({
      params1 <- strsplit(input$params1, ",") %>%
        magrittr::extract2(1) %>%
        str_extract("[\\.0-9]+") %>%
      as.numeric()
      params2 <- strsplit(input$params2, ",") %>%
        magrittr::extract2(1) %>%
        str_extract("[\\.0-9]+") %>%
        as.numeric()
      
      dist1 <- rnorm(nSim, mean = params1[1], sd = params1[2])
      dist2 <- rnorm(nSim, mean = params2[1], sd = params2[2])
      
      combined <- input$w1*dist1 + input$w2*dist2
    })
    
    output$combinedPlot <- renderPlot({
      tibble(x = pdf()) %>%
        ggplot(aes(x = x)) +
        geom_density(size = 1) +
        theme(base_size = 12)
      })

})
