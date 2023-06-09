#Create metrics server
metricServer <- function(id, globalSession) {
  moduleServer(id, function(input, output, session) {
    
    #diamondsFiltered <- reactive({diamondFiltered(diamonds)})
    #plot <- diamondViz(diamondsFiltered(), input$cut, input$color, input$clarity, input$carat)
    output$avgPrice <- shinydashboard::renderValueBox({
      avgP<- calcAveragePrice(diamonds, input$cut, input$color, input$clarity, input$carat)
      valueBox(
        value = tags$p("Average Diamond Price", style = "font-size: 75%;"),
        paste0("$", formatC(as.numeric(avgP), format="f", digits=2, big.mark=",")),
      )
    })
    
    output$predDiamondPrice <- shinydashboard::renderValueBox({
      d<- 1000
      valueBox(
        value = tags$p("Predicted Diamond Price", style = "font-size: 75%;"),
        d)  
    })
    
    output$plot <- renderPlotly({
      diamondsFil <- reactive({diamondFiltered(diamonds, input$cut, input$color, input$clarity)})
      diamondViz(diamondsFil(), input$cut, input$color, input$clarity)
      })
    
    output$barPlot <- renderPlotly({
     # diamondsFiltered <- reactive({diamondFiltered(diamonds, input$cut, input$color, input$clarity)})
      diamondBars(diamonds, input$cut, input$color, input$clarity, input$carat)
    })
    
  })
}