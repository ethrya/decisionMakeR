# User interface
#

library(shiny)
library(tidyverse)
list.files("R", pattern = ".R", full.names = T) %>%
  purrr::walk(source)

# Define UI for application that draws a histogram
shinyUI(
  navbarPage("DecisonMakerR",
             theme = bslib::bs_theme(bootswatch = "solar"),
             tabPanel("Options",
                      # Application title
                      titlePanel("DecisionMakeR"),
                      h5("Compare 2 possible decisions"),
                      p(strong("1. What criteria are important? "),
                        "Choose 5 criteria to compare your options."),
                      do.call(fluidRow, purrr::map(1:5, criteriaNameCol)),
                      p(strong("2. How important is each criteria? "),
                        "Enter a number that indicates each criteria's relative importance."),
                      do.call(fluidRow, purrr::map(1:5, wtCol)),
                      p(strong("3. How good will option 1 be? "),
                        "Estimate how well option 1 will go on each criteria, by deciding parameters of a probability distribution."),
                      p(em("Suggestion: Choose values so that 0 is neutral, 1 is a strong positive outcome and 1 is a strong negative outcome")),
                      do.call(fluidRow, purrr::map(1:5, paramsCol)),
                      do.call(fluidRow, purrr::map(1:5, distPlotCol)),
                      p(strong("4. How good will option 2 be? "),
                        "Estimate how well option 1 will go on each criteria, by deciding parameters of a probability distribution."),
                      
                      do.call(fluidRow, purrr::map(1:5, paramsCol,
                                                   optionNo = 2)),
                      do.call(fluidRow, purrr::map(1:5, distPlotCol,
                                                   optionNo = 2)),
                      p(strong("5. View results"),
                        "Now, go to the comparisons tab to compare the options")
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
