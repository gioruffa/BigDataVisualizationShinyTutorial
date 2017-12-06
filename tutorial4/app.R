# Load packages ----
library(shiny)
library(quantmod)

# Source helpers ----
source("helpers.R")

# User interface ----
ui <- fluidPage(
  titlePanel("stockVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select a stock to examine. 
        Information will be collected from Google finance."),
      
      textInput("symb", "Symbol", "SPY"),
      
      dateRangeInput("dates", 
                     "Date range",
                     start = "2013-01-01", 
                     end = as.character(Sys.Date())),
      
      br(),
      br(),
      
      checkboxInput("log", "Plot y axis on log scale", 
                    value = FALSE),
      
      checkboxInput("adjust", 
                    "Adjust prices for inflation", value = FALSE)
    ),
    
    mainPanel(plotOutput("plot"))
  )
)

# Server logic
server <- function(input, output) {
  
  dataInput <- reactive({ #reactive will execute this code only if the contained input is changed
    #so in case we change log (which does not affect data but only visualization)
    #no request will be done
    getSymbols(input$symb, src = "google", 
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
  })
  
  adjustedDataInputIfNeeded <- reactive({
    if (input$adjust)
    {
      adjust(dataInput())
    }
    else
    {
      dataInput()
    }
  })
  
  output$plot <- renderPlot({
    
    chartSeries(adjustedDataInputIfNeeded(), theme = chartTheme("white"), 
                type = "line", log.scale = input$log, TA = NULL)
  })
  
}

# Run the app
shinyApp(ui, server)
