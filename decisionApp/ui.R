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
        column(1,
               numericInput("w1",
                         "Weight",
                         value = "0.5")
        ),
        column(1,
               textInput("params1",
                         "Mean, Sd,df",
                         value = "1, 0.5, 100")
        ),
        column(1,
               numericInput("w2",
                            "Weight",
                            value = "0.5")
        ),
        column(1,
               textInput("params2",
                         "Mean, Sd, df",
                         value = "1, 0.5, 100")
        ),
        column(1,
               numericInput("w3",
                            "Weight",
                            value = "0.5")
        ),
        column(1,
               textInput("params3",
                         "Mean, Sd, df",
                         value = "1, 0.5, 100")
        ),
        column(1,
               numericInput("w4",
                            "Weight",
                            value = "0.5")
        ),
        column(1,
               textInput("params4",
                         "Mean, Sd, df",
                         value = "1, 0.5, 100")
        ),
        column(1,
               numericInput("w5",
                            "Weight",
                            value = "0.5")
        ),
        column(1,
               textInput("params5",
                         "Mean, Sd",
                         value = "1, 0.5, 100")
        )
        ),
    fluidRow(
        # Show a plot of the generated distribution
        column(2,
               plotOutput("distPlot")
        ),
        column(2,
               plotOutput("distPlot2")
        ),
        column(2,
               plotOutput("distPlot3")
        ),
        column(2,
               plotOutput("distPlot4")
        ),
        column(2,
               plotOutput("distPlot5")
        ),
        column(2,
               plotOutput("combinedPlot")
        )
    )
)
)
