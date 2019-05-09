#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyverse)

#rice <- read_csv("/home/ubuntu/Labs/05-09-19/Shiny_Samvardhini.Sina.Surbhi/RiceSNPData/RiceDiversity.44K.MSU6.Phenotypes.csv", na = c("NA", "00")) #This tells R that missing data is denoted as NA or 00
rice <- read_csv("/home/ubuntu/Assignments/Shiny_Samvardhini.Sina.Surbhi/RiceSNPData/RiceDiversity.44K.MSU6.Phenotypes.csv", na = c("NA", "00")) #This tells R that missing data is denoted as NA or 00
#rice <-  rice %>% select(-`6_17160794_1`)
colnames(rice)[1] <- "ID"

# iris.long <- iris %>% 
#   gather(key="trait", # the column name of the new column that will contain the key 
#          value="value", # the column name of the column that will contain the observations
#          Sepal.Length, Sepal.Width, Petal.Length, Petal.Width # the column names that we want to gather.
#   )

rice.long <- rice %>%
  gather(key="Phenotypes",
         value="value",
         `Flag leaf length`, `Flag leaf width`
      )
# iris.wide <- iris.long %>% 
#   spread(key = "Species", # which column holds the key?  
#          value = "Species") # which column contains the values?

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$boxPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
   # x    <- faithful[, 2] 
   # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
    
    filtered_rice <- rice.long %>% filter(Phenotypes == input$Phenotypes)
      
  filtered_rice %>% ggplot(aes(x=Region, y=Phenotypes, fill=Region)) +
           geom_boxplot()
    
  })
  
})
