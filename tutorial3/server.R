library(shiny)
library(maps)
library(mapproj)
source("helpers.R")
counties <- readRDS("data/counties.bin") #if we do not plan to modify this df (for every user), it should stay here.


shinyServer(function(input, output) {
  output$map <- renderPlot({
    legend = ""
    params <- switch(input$var,
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
    percent_map(var = params[[1]], params[[2]], params[[3]],input$range[1], input$range[2])
  })
  
})
