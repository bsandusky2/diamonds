packages<- c("shiny", "tidyverse", "plotly", "shinydashboard")
invisible(lapply(packages, library, character.only = T))
source("./R/shinyFunctions.R")
source("./Modules/metrics/metricsModule.R")
diamonds<- read_csv("diamonds.csv") %>% 
  mutate(cut = factor(cut), color = factor(color), clarity = factor(clarity))
model<- buildModel(diamonds)
