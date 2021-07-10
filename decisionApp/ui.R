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
shinyUI(navbarPage( "DecisonMakerR",
                    theme = bslib::bs_theme(bootswatch = "solar"),
                    tabPanel("Options",
                             # Application title
                             titlePanel("DecisionMakeR"),
                             fluidRow(
                               column(2,
                                      textInput("criteria1",
                                                "Criteria 1")
                               ),
                               column(2,
                                      textInput("criteria2",
                                                "Criteria 2")
                               ),
                               column(2,
                                        textInput("criteria3",
                                                  "Criteria 3")
                               ),
                               column(2,
                                        textInput("criteria4",
                                                  "Criteria 4")
                               ),
                               column(2,
                                        textInput("criteria5",
                                                  "Criteria 5")
                               )
                             ),
                             # Sidebar with a slider input for number of bins
                             fluidRow(
                               column(2,
                                      numericInput("w1",
                                                   "Weight",
                                                   value = "0.5")
                               ),
                               column(2,
                                      numericInput("w2",
                                                   "Weight",
                                                   value = "0.5")
                               ),
                               column(2,
                                      numericInput("w3",
                                                   "Weight",
                                                   value = "0.5")
                               ),
                               column(2,
                                      numericInput("w4",
                                                   "Weight",
                                                   value = "0.5")
                               ),
                               column(2,
                                      numericInput("w5",
                                                   "Weight",
                                                   value = "0.5")
                               )
                             ),
                             fluidRow(
                               column(2,
                                      textInput("params11",
                                                "Mean, Sd,df",
                                                value = "1, 0.5, 100")
                               ),
                               column(2,
                                      textInput("params12",
                                                "Mean, Sd, df",
                                                value = "1, 0.5, 100")
                               ),
                               column(2,
                                      textInput("params13",
                                                "Mean, Sd, df",
                                                value = "1, 0.5, 100")
                               ),
                               column(2,
                                      textInput("params14",
                                                "Mean, Sd, df",
                                                value = "1, 0.5, 100")
                               ),
                               column(2,
                                      textInput("params15",
                                                "Mean, Sd",
                                                value = "1, 0.5, 100")
                               )
                             ),
                             fluidRow(
                               # Show a plot of the generated distribution
                               column(2,
                                      plotOutput("distPlot11")
                               ),
                               column(2,
                                      plotOutput("distPlot12")
                               ),
                               column(2,
                                      plotOutput("distPlot13")
                               ),
                               column(2,
                                      plotOutput("distPlot14")
                               ),
                               column(2,
                                      plotOutput("distPlot15")
                               ),
                               column(2,
                                      plotOutput("combinedPlot1")
                               )
                             ),
                             fluidRow(
                               column(2,
                                      textInput("params21",
                                                "Mean, Sd,df",
                                                value = "1, 0.5, 100")
                               ),
                               column(2,
                                      textInput("params22",
                                                "Mean, Sd, df",
                                                value = "1, 0.5, 100")
                               ),
                               column(2,
                                      textInput("params23",
                                                "Mean, Sd, df",
                                                value = "1, 0.5, 100")
                               ),
                               column(2,
                                      textInput("params24",
                                                "Mean, Sd, df",
                                                value = "1, 0.5, 100")
                               ),
                               column(2,
                                      textInput("params25",
                                                "Mean, Sd",
                                                value = "1, 0.5, 100")
                               )
                             ),
                             fluidRow(
                               # Show a plot of the generated distribution
                               column(2,
                                      plotOutput("distPlot21")
                               ),
                               column(2,
                                      plotOutput("distPlot22")
                               ),
                               column(2,
                                      plotOutput("distPlot23")
                               ),
                               column(2,
                                      plotOutput("distPlot24")
                               ),
                               column(2,
                                      plotOutput("distPlot25")
                               ),
                               column(2,
                                      plotOutput("combinedPlot2")
                               )
                             )
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