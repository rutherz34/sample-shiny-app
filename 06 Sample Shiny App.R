library(shiny)
library(shinythemes)

# Define UI

ui <- fluidPage(theme=shinytheme('cerulean'),
                navbarPage(
                  "Write your name",
                  tabPanel("Navbar 1",
                           sidebarPanel(
                             tags$h3("Input:"),
                             textInput("txt1","Given name:",""),
                             textInput("txt2","Family name:","")
                           ),
                           
                           mainPanel(
                             h1("Header 1"),
                             h4("Output 1"),
                             verbatimTextOutput("txtout")
                           )
                  ),
                  
                  tabPanel("Navbar 2","This panel is intentionally left blank.")
                )
)

# Define Server
server <- function(input, output){
  output$txtout <- renderText({paste(input$txt1, input$txt2)})
}

shinyApp(ui,server)