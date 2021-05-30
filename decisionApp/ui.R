#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    theme = bslib::bs_theme(bootswatch = "solar"),
    
    # Application title
    titlePanel("DecisionMakeR"),
    
    # Sidebar with a slider input for number of bins
    fluidRow(
        column(2,
               numericInput("w1",
                         "Weight",
                         value = "0.5")
        ),
        column(2,
               textInput("params1",
                         "Mean, Sd",
                         value = "1, 0.5")
        ),
        column(2,
               numericInput("w2",
                            "Weight",
                            value = "0.5")
        ),
        column(2,
               textInput("params2",
                         "Mean, Sd",
                         value = "1, 0.5")
        )
        ),
    fluidRow(
        # Show a plot of the generated distribution
        column(4,
               plotOutput("distPlot")
        ),
        column(4,
               plotOutput("distPlot2")
        ),
        column(4,
               plotOutput("combinedPlot")
        )
    )
)
)
