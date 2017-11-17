library(shiny)
# Define UI for app that draws a histogram ----
ui <- fluidPage( #fluidPage automatically adapts the content to the browser window size
  titlePanel("title panel"),
  
  sidebarLayout(
    sidebarPanel("sidebar panel"),
    mainPanel("main panel")
  )
)