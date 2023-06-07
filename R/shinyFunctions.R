diamondFiltered<- function(df, userCut = "Ideal", userColor = "E", userClarity = "SI2"){
  df<- df %>% 
    filter(cut == userCut, color == userColor, clarity == userClarity) %>% 
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
            yaxis = list(title = 'Price'),
            legend=list(title=list(text='Clarity'))
     )

}

diamondViz(diamonds)

calcAveragePrice<- function(df, userCut, userColor, userClarity, userCarat){
  avgPrice = df %>% filter(cut == userCut, color == userColor, clarity == userClarity, carat == userCarat) %>%
  summarise(avgPrice = mean(price, na.rm = T)) %>% 
    as.double() %>% 
    round(.,0)
  
  return(avgPrice)
}

calcAveragePrice(diamonds, "Ideal", "E", "SI2", 1)

diamondBars <- function(df, userCut, userColor, userCarat) {
  
  df<- df %>% mutate(cut = factor(cut), clarity = factor(clarity)) %>% 
    filter(cut == userCut, color == userColor, carat == userCarat) %>% 
    group_by(clarity) %>% 
    summarise(avgPrice = mean(price))
  
  plot_ly(df, x = ~avgPrice, 
          y = ~clarity,
          marker = list(color = 'rgba(246, 10, 0, 0.6)'),
          type = 'bar',
          orientation = 'h') %>% 
    layout(title = 'Diamond Prices', plot_bgcolor = "#e5ecf6",
           xaxis = list(title = 'Average Price'),
           yaxis = list(title = 'Clarity')
    )
  
}

diamondBars(diamonds, "Ideal", "D", 1)




