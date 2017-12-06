#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   output$selected_varHook <- renderText( #assign to the output widget the corresonding value
     { #braces are mandatory, because this is an R expression as a whole, this is why it should
       #return the object to represent, in this case text
       paste("You have selected this: ", input$variableHook,", apparentily")
     }
   )
   output$selected_rangeHook <- renderText( #assign to the output widget the corresonding value
     { #braces are mandatory, because this is an R expression as a whole, this is why it should
       #return the object to represent, in this case text
       paste("And the range is: ", input$rangeHoock[1],"-",input$rangeHoock[2],", apparentily")
     }
   )
   output$selected_all_HTML_Hook <-renderUI(
     tagList( # need to wrap in a list -> It works!
       h3("An HTML comprehensive output"),
       h4("Using renderUI renderer"),
       p(paste("You picked: ", input$variableHook)),
       p(paste("From ", input$rangeHoock[1], " to ", input$rangeHoock[2]))
     )
   )
  
})
