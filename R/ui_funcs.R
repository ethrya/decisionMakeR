criteriaNameCol <- function(criteriaNo = 1, width = 2) {
  column(width,
         textInput(paste0("criteria", criteriaNo),
                   paste0("Criteria", criteriaNo))
  )
}


wtCol <- function(criteriaNo = 1, width = 2) {
  column(width,
         numericInput(paste0("w", criteriaNo),
                      "Weight",
                      value = "0.5")
  )
}

paramsCol <- function(criteriaNo = 1, optionNo = 1, width = 2) {
  column(width,
         textInput(paste0("params", optionNo, criteriaNo),
                   "Mean, sd, df",
                   value = "1, 0.5, 100")
  )
}

distPlotCol <- function(criteriaNo = 1, optionNo = 1, width = 2) {
  column(width,
         plotOutput(paste0("distPlot", optionNo, criteriaNo))
  )
}