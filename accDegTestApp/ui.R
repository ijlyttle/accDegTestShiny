library(shiny)
library(shinyBS)

fluidPage(
  responsive = FALSE,
  fluidRow(
    column(
      width = 3, 
      wellPanel(
        #control elements
        fileInput('file', 'Upload CSV', accept = c("text/csv", "text/comma-separated-values", 
                                                   "text/plain", ".csv")),
        selectInput("D_var", label = "Degredation", choices = ""),
        selectInput("t_var", label = "Time", choices = ""),
        selectInput("temp", label = "Temperature", choices =""),
        selectInput("humid", label = "Rel. Humidity", choices = ""),
        numericInput("xref1", "Ref1", value = 292.15),
        numericInput("xref2", "Ref2", value = 75),
        
        #todo xref
        
        actionButton("model", label = "Fit Model")
      )
    ),
    
    column(
      width = 9,
      plotOutput('plot')
    )
  )  
)