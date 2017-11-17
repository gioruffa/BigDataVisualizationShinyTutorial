library(shiny)
# Define UI for app that draws a histogram ----
ui <- fluidPage( #fluidPage automatically adapts the content to the browser window size
  titlePanel("A title for the whole page"),
  
  sidebarLayout(
    position = "right",
    sidebarPanel("sidebar panel"), #sidebar is for input. This is a function! it shows what you put in the argument
    mainPanel(h1("First level Title") , h2("Second level title"), h1("Centered first level", align="center"), br(), "ciao") #this is for output
    #you can use some shiny functios to encode html5 tags directly
    #at least in the mainPanel, does not seems to work in the sidebar panel
  )
)