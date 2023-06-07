#create metrics UI
metric_ui <- function(id) {
  
  fluidPage(
    fluidRow(
      column(2,
      selectInput(NS(id, "clarity"), "Clarity", choices = unique(diamonds$clarity), selected = "SI2", multiple = T),
      selectInput(NS(id, "color"), "Color", choices = unique(diamonds$color), selected = "E", multiple = T),
      selectInput(NS(id, "cut"), "Cut", choices = unique(diamonds$cut), selected = "Ideal", multiple = T),
      sliderInput(NS(id, "carat"), "Carat", value = 1, min = 0,max = 6),
    ),
    column(8,
      plotlyOutput(NS(id, "plot"))
    )
    )
  )
  
}