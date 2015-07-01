library(shiny)
library(shinyjs)

jsCode <- '
shinyjs.slideVals = function(params) {
var defaultParams = {
id : null,
vals : [0, 1]
};
params = shinyjs.getParams(params, defaultParams);

$("#" + params.id).data("ionRangeSlider").update({"values":params.vals});
}'

runApp(shinyApp(
  ui = fluidPage(
    useShinyjs(),
    extendShinyjs(text = jsCode),
    sliderInput("test1", "test1:", 0, 1, 0), 
    textInput("vals", "Enter values"),
    p("Enter slider values separated by ','"),
    actionButton("update", "Update slider"),
    p("The slider value is:"),
    textOutput('temp')
  ),
  server = function(input,output,session) {
    
    get_vals <- reactive({
      return(strsplit(input$vals, ",")[[1]])
    })
    
    observeEvent(input$update, {
      js$slideVals("test1", get_vals())
    })
    
    output$temp <- renderText({
      vals <- get_vals()
      vals[input$test1 + 1]
    })
  }
))
