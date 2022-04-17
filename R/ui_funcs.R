# Get the name of each criteria
criteriaNameCol <- function(criteriaNo = 1, width = 2) {
  column(width,
         textInput(paste0("criteria", criteriaNo),
                   paste0("Criteria", criteriaNo))
  )
}

# Get each criteria's weight
wtCol <- function(criteriaNo = 1, width = 2) {
  column(width,
         numericInput(paste0("w", criteriaNo),
                      "Weight",
                      value = "0.5")
  )
}

# Get the parameters of each criteria, where each criteria is a t distribution,
# with a mean, sd and df.
paramsCol <- function(criteriaNo = 1, optionNo = 1, width = 2) {
  column(width,
         textInput(paste0("params", optionNo, criteriaNo),
                   "Mean, sd, df",
                   value = "1, 0.5, 100")
  )
}


# Plot the parameter distribution
distPlotCol <- function(criteriaNo = 1, optionNo = 1, width = 2) {
  column(width,
         plotOutput(paste0("distPlot", optionNo, criteriaNo),
                    height = "200px")
  )
}