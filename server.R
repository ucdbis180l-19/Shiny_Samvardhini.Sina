#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


####################################
#   LOAD ALL REQUIRED LIBRARIES    #
####################################

library(shiny)
library(ggplot2)
library(tidyverse)

####################################
#       READ IN INPUT FILE         #
####################################
rice <- read_csv("RiceSNPData/RiceDiversity.44K.MSU6.Phenotypes.csv", na = c("NA", "00")) #This tells R that missing data is denoted as NA or 00
colnames(rice)[1] <- "ID"


########################################################
#       CHANGE DATA TO LONG FORMAT USING GATHER        #
########################################################
rice.long <- rice %>%
  gather(key="Phenotypes",
         value="value",
         `Flag leaf length`, `Flag leaf width`
      )

####################################################
#       DEFINE SERVER LOGIC TO CREATE BOXPLOTS     #
####################################################

shinyServer(function(input, output) {
   
  output$boxPlot <- renderPlot({
    filtered_rice <- rice.long %>%
       filter(Phenotypes == input$Phenotypes) %>%  # narrows down data frame by user selected phenotype
       filter(Region %in% input$Region)            # narrows down data frame by user selected region (for the x axis)
      
    
  # plots the boxplot using user input values  
  filtered_rice %>% 
    ggplot(aes(x=Region, y=value, fill=Region)) +    
    geom_boxplot() + ylab(input$Phenotypes)
    
  })
  
})
