library(shiny)
library(shinyjs)

source('global.R')
shinyServer(function(input,output,session) {
  
  get_vals <- reactive({
    return(strsplit(input$vals, ",")[[1]])
  })
  
  observeEvent(input$update, {
    js$slideVals("test1", get_vals())
    output$temp <- renderText({
      vals <- get_vals()
      vals[input$test1 + 1]
    })
  })
  
  
})