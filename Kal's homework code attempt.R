#Learning Shiny
library(shiny)
ui <- fluidPage(
  fileInput(inputId = "Coffee", label ="Upload Kal's Coffee Data Here"),
  radioButtons("disp", "Display",
               choices = c(Head = "head",
                           All = "all"),
               selected = "head"),
  tableOutput("table")
)
server <- function(input,output){
  output$table <- renderTable({
    
    req(input$Coffee)
    df <- read.csv(input$Coffee$datapath,header=TRUE)
    
    if(input$disp == "head") {
      return(head(df))
    }
    else {
      return(df)
    }})}

}
shinyApp(ui=ui, server=server)


