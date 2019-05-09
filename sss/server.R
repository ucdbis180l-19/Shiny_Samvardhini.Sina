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

iris.long <- iris %>% 
  gather(key="trait", # the column name of the new column that will contain the key 
         value="value", # the column name of the column that will contain the observations
         Sepal.Length, Sepal.Width, Petal.Length, Petal.Width # the column names that we want to gather.
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
    
    
    filtered_selection <- iris.long %>% filter(Species == input$Species)
      
  ggplot(data=filtered_selection, aes(x=trait, y=value, fill=trait)) +
           geom_boxplot()
    
  })
  
})
