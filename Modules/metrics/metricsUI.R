#create metrics UI
metric_ui <- function(id) {
  
  frow1<- fluidRow(
    shinydashboard::valueBoxOutput(NS(id, "avgPrice")),
    shinydashboard::valueBoxOutput(NS(id, "predDiamondPrice"))
  )
  
  frow2<- fluidRow(
    box(
      plotlyOutput(NS(id, "plot"))
    ),
    box(
      plotlyOutput(NS(id, "barPlot"))
    )
  )
  
  frow3<- fluidRow(
    column(2,
           h3("Global Filters"),
           selectInput(NS(id, "clarity"), "Clarity", choices = unique(diamonds$clarity), selected = "I1", multiple = T),
           selectInput(NS(id, "cut"), "Cut", choices = unique(diamonds$cut), selected = "Fair", multiple = T),
           selectInput(NS(id, "color"), "Color", choices = unique(diamonds$color), selected = "J", multiple = T),
           sliderInput(NS(id, "carat"), "Carat", value = c(1,4), min = 0,max = 6, step = .01),
    ),
    column(10,
           frow2
           )
  )
  
  frow4<- fluidRow(
    column(2,
           h3("Prediction Paramters"),
           selectInput(NS(id, "clarityPred"), "Clarity", choices = unique(diamonds$clarity), selected = "I1", multiple = F),
           selectInput(NS(id, "cutPred"), "Cut", choices = unique(diamonds$cut), selected = "Fair", multiple = F),
           selectInput(NS(id, "colorPred"), "Color", choices = unique(diamonds$color), selected = "J", multiple = F),
           numericInput(NS(id, "caratPred"), "Carat", value = 1, min = 0,max = 6)
    )
  )
  
  #fluidPage(
  dashboardPage(
    dashboardHeader(title = "Diamond Pricing"),
    dashboardSidebar(
      sidebarMenu(
        # Setting id makes input$tabs give the tabName of currently-selected tab
        id = "tabs",
        menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"))
    )),
    dashboardBody(
      #valueBoxOutput("price"),
    # fluidRow(
    #   column(2,
    #   h3("Global Filters"),
    #   selectInput(NS(id, "clarity"), "Clarity", choices = unique(diamonds$clarity), selected = "SI2", multiple = T),
    #   selectInput(NS(id, "cut"), "Cut", choices = unique(diamonds$cut), selected = "Ideal", multiple = T),
    #   h3("Top Visual Only"),
    #   selectInput(NS(id, "color"), "Color", choices = unique(diamonds$color), selected = "E", multiple = T),
    #   br(),
    #   h3("Bottom Visual Only"),
    #   sliderInput(NS(id, "carat"), "Carat", value = 1, min = 0,max = 6),
    # ),
    # column(8,
    #        valueBoxOutput("value1"),
    #   plotlyOutput(NS(id, "plot")),
    #   plotlyOutput(NS(id, "barPlot"))
    # )
    # )
      frow1,frow3, frow4
    )
  )
  
}