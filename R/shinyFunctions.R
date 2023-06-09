diamondFiltered<- function(df, userCut = "Ideal", userColor = "E", userClarity = "SI2"){
  df<- df %>% 
    filter(cut %in% userCut, color %in% userColor, clarity %in% userClarity) %>% 
    mutate(cut = factor(cut), clarity = factor(clarity))
}

diamondViz <- function(df, userCut = "Ideal", userColor = "E", userClarity = "SI2") {
  plot_ly(df) %>% 
    add_trace(x = ~carat, 
              y = ~price,
              color = ~clarity,
              colors = c("blue", "darkgreen", "red", "chocolate4", "green", "black","orange","lightblue"),
              type = 'scatter',
              mode = 'markers'
    ) %>%
     layout(title = 'Diamond Prices', plot_bgcolor = "#e5ecf6",
            xaxis = list(title = 'Carat'),
            yaxis = list(title = 'Price', tickformat = "$"),
            legend=list(title=list(text='Clarity'))
     )

}

diamondViz(diamonds)

calcAveragePrice<- function(df, userCut, userColor, userClarity, userCarat){
  avgPrice = df %>% filter(cut == userCut, color == userColor, clarity == userClarity, carat > userCarat[1] & carat < userCarat[2]) %>%
  summarise(avgPrice = mean(price, na.rm = T)) %>% 
    as.double() %>% 
    round(.,0)
  
  return(avgPrice)
}

calcAveragePrice(diamonds, "Ideal", "E", "SI2", 1)

diamondBars <- function(df, userCut, userColor, userClarity, userCarat) {
 # browser()
  df<- df %>% mutate(cut = factor(cut), color = factor(color)) %>% 
    filter(clarity %in% userClarity, carat > userCarat[1], carat < userCarat[2], cut %in% userCut, color %in% userColor) %>% 
    group_by(color) %>% 
    summarise(avgPrice = mean(price))
  
  plot_ly(df, x = ~avgPrice, 
          y = ~color,
          marker = list(color = 'rgba(255, 0, 0, 0.6)'),
          type = 'bar',
          orientation = 'h') %>% 
    layout(title = 'Diamond Prices', plot_bgcolor = "#fffbf8",
           xaxis = list(title = 'Average Price',tickformat = "$"),
           yaxis = list(title = 'Color', categoryorder = "total ascending")
    )
  
}

diamondBars(diamonds, "Ideal", "D","SI2", c(1,4))

buildModel<- function(df){
  
}




