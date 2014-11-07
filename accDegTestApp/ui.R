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
        selectInput("D_var", label = "Degradation", choices = ""),
        selectInput("t_var", label = "Time", choices = ""),
        selectInput("temp", label = "Temperature", choices =""),
        selectInput("humid", label = "Rel. Humidity", choices = ""),
        numericInput("xref1", "Ref1", value = 292.15),
        numericInput("xref2", "Ref2", value = 75),
        
        #todo xref
        
        actionButton("model", label = "Fit Model"),
        br(),br(),
        selectInput("plot_type", label = "Plot type", 
          choices = c("all degradations", "degradation", "g-degradation", "interval stress plot", "time resid", "stress resid", "normal", "resid", "points clouds"),
          selected="all degradations"
        )

      )
    ),
    
    column(
      width = 9,
      plotOutput('plot')
    )
  )  
)