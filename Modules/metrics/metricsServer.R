#Create metrics server
metricServer <- function(id, globalSession) {
  moduleServer(id, function(input, output, session) {
    
    #diamondsFiltered <- reactive({diamondFiltered(diamonds)})
    #plot <- diamondViz(diamondsFiltered(), input$cut, input$color, input$clarity, input$carat)
    output$plot <- renderPlotly({
      diamondsFiltered <- reactive({diamondFiltered(diamonds, input$cut, input$color, input$clarity)})
      diamondViz(diamondsFiltered(), input$cut, input$color, input$clarity)
      })
    
  })
}