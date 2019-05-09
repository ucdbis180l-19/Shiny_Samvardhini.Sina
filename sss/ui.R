#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("Rice Data"),
  
  # Some helpful information
  helpText("This application creates a plot of the user's choice (either boxplot or violin plot) to show difference between",
           "rice species by region. Please use the radio box below to choose a phenotype",
           "for plotting"),
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
      radioButtons("Phenotypes", #the input variable that the value will go into
                   "Choose a plot to view the data on:",
                   c("boxplot",
                     "violin plot",
                     )
      ),
      checkboxGroupInput("Phenotypes", #the input variable that the value will go into
                       "Choose the phenotypes to display:",
                       c("setosa",
                         "versicolor",
                         "virginica")
          )),),
    
    
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("boxPlot")
    )
  )
))