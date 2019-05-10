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
  helpText("This application creates a boxplot to show differences between",
           "rice species by region. Please use the radio box below to choose a phenotype",
           "for plotting and the check box below to choose the regions you want to include on the plot. "),
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
      radioButtons("Phenotypes", #the input variable that the value will go into
                   "Choose a phenotype to view:",
                   c("Flag leaf length",
                     "Flag leaf width"
                     )
      ),
      checkboxGroupInput("Regions", #the input variable that the value will go into
                       "Choose the regions to display:",
                       c("Europe",
                         "S Asia",
                         "America",
                         "E Asia",
                         "Pacific",
                         "Mid East",
                         "SE Asia",
                         "Africa",
                         "C Asia"
                         )
          )),
    
    
    
    # Show a plot of the generated distribution 
    mainPanel(plotOutput("boxPlot")
    )
  ))
)