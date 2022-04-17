#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
list.files("../R", pattern = ".R", full.names = T) %>%
  purrr::walk(source)

# Define UI for application that draws a histogram
shinyUI(navbarPage("DecisonMakerR",
                    theme = bslib::bs_theme(bootswatch = "solar"),
                    tabPanel("Options",
                             # Application title
                             titlePanel("DecisionMakeR"),
                             do.call(fluidRow, purrr::map(1:5, criteriaNameCol)),
                             do.call(fluidRow, purrr::map(1:5, wtCol)),
                             do.call(fluidRow, purrr::map(1:5, paramsCol)),
                             do.call(fluidRow, purrr::map(1:5, distPlotCol)),
                             do.call(fluidRow, purrr::map(1:5, paramsCol,
                                                          optionNo = 2)),
                             do.call(fluidRow, purrr::map(1:5, distPlotCol,
                                                          optionNo = 2))
                    ),
                    tabPanel("Comparison",
                             fluidRow(
                               column(8,
                                      plotOutput("comparisonPlot")
                               ),
                               column(4,
                                      tableOutput("comparisonTable"))
                             ),
                             fluidRow(
                               column(2,
                                      numericInput("xMin","x-axis minimum",
                                                   value = "-5")
                                      ),
                               column(2,
                                      numericInput("xMax","x-axis maximum",
                                                   value = "5")
                               )
                             )
                    )
)
)
