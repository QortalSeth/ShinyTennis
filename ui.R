#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
source('uiHelper.R')

# Define UI for application that draws a histogram
shinyUI(
    fluidPage(

    # Application title
    dashboardPage(skin='blue', 
                  dashboardHeader(title = 'Tennis Analysis'),
    dashboardSidebar(
        sidebarMenu(
            
            menuItem('Intro', tabName = 'Intro' ),
            menuItem('Player data', tabName = 'playerData'),
            menuItem('Biggest Rise/Falls Over Time', tabName = 'rise&Fall'),
            menuItem('Men VS. Women Performance', tabName = 'menVWomen'),
            menuItem('Newbs VS. Veterans performance', tabName = 'newbVVeterans'),
            menuItem('Performance by Month', tabName = 'performanceByMonth'),
            menuItem('Conclusion', tabName = 'Conclusion')
        )
        
    ),                  
                  
                  
    dashboardBody(
        tabItems(intro,playerData

        
    )
    )
    )
    
)
)

