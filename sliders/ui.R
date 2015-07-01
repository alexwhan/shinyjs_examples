library(shiny)
library(shinyjs)

source('global.R')
shinyUI(fluidPage(
  useShinyjs(),
  extendShinyjs(text = jsCode),
  sliderInput("test1", "test1:", 0, 1, 0), 
  textInput("vals", "Enter values"),
  p("Enter slider values separated by ',' (eg 1,10,100)"),
  actionButton("update", "Update slider"),
  p("The slider value is:"),
  textOutput('temp'),
  a(href = "https://github.com/alexwhan/shinyjs_examples/tree/master/sliders", "Code on github")
))