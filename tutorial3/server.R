library(shiny)
library(maps)
library(mapproj)
source("helpers.R")
counties <- readRDS("data/counties.bin") #if we do not plan to modify this df (for every user), it should stay here.


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$map <- renderPlot({
    legend = ""
    stuff <- switch(input$var,
                       "Percent White" = 
                         {
                           list(
                             counties$white,
                             "darkgreen",
                             "% White"
                            )
                           },
                       "Percent Black" = 
                       {
                         list(
                           counties$black,
                           "black",
                           "% Black"
                         )
                       },
                        "Percent Hispanic" = 
                        {
                          list(
                            counties$hispanic,
                            "darkorange",
                            "% Hispanic"
                          )
                        },
                        "Percent Asian" = 
                        {
                          list(
                            counties$asian,
                            "darkviolet",
                            "% Asian"
                          )
                        }
    )
    percent_map(var = stuff[[1]], stuff[[2]], stuff[[3]],input$range[1], input$range[2])
  })
  
})
