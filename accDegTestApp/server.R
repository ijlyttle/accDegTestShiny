library(accDegTest)
library(shinyBS)
library(shiny)

server = function(input, output, session) {
  
  rct_df = reactiveValues(df = SE_data) 
    
  rct_update_choices = reactive({
    inFile = input$file
    if(!is.null(inFile)) rct_df$df = read.csv(inFile$datapath)
    
    return(names(rct_df$df))
  })
  
  observe({
    # populates the device input
    choice_list = rct_update_choices()
    updateSelectInput(session, inputId = "D_var", choices = choice_list, NULL)
    updateSelectInput(session, inputId = "t_var", choices = choice_list, NULL)
    updateSelectInput(session, inputId = "temp", choices = choice_list, NULL)
    updateSelectInput(session, inputId = "humid", choices = choice_list, NULL)
  })
  
  
  output$plot = renderPlot({
    input$model
    
    isolate({
      D = input$D_var
      t = input$t_var
      TK = input$temp
      RH = input$humid
      formula_string = paste0(D, " ~ ", t, " | ", "11605/", TK, " & ", "-log(", RH, ")")
      if(input$model > 0) {
        m = addt(formula(formula_string), xref = c(input$xref1, input$xref2), data = rct_df$df)
        p = plot(m)
      } else {
        p = NULL
      }
      
      p
    })
  })
  
}