library(shiny)
# Define UI for app that draws a histogram ----
ui <- fluidPage( #fluidPage automatically adapts the content to the browser window size
  titlePanel("A title for the whole page"),
  
  sidebarLayout(
    position = "right",
    sidebarPanel("sidebar panel"), #sidebar is for input. This is a function! it shows what you put in the argument
    mainPanel(#this is for output
      h1("First level Title") , 
      h2("Second level title"), 
      h1("Centered first level", align="center"), 
      br(), 
      "ciao",
      br(),
      strong("A bold CIAO"),
      div("Some text div"),
      div("Another div but in a different color, no need for explit \"br()\" call for newline", style="color:red"),
      p("also a paragraph"),
      p("goes to newline as expected", "but can take multiple args",
        "and still keep it on the same line", "but it is space friendly"),
      p("and you can go nuts with styles", style = "font-family: 'times'; font-si16pt"),
      p("I suspect that sooner or later, css are going to pop-up and attack us"),
      h1("Images"),
      p("A remote image:"),
      img(src="https://www.androidcentral.com/sites/androidcentral.com/files/styles/large/public/article_images/2015/08/dont-panic.jpg?itok=Eskz_M2z"),
      p("A local image:"),
      img(src="zaphod.gif")
      
      
      ) 
      
    #you can use some shiny functios to encode html5 tags directly
    #at least in the mainPanel, does not seems to work in the sidebar panel
  )
)