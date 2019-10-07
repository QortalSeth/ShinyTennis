#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

source('Helpers/uiHelper.R')
source('Helpers/uiIntro.R')

# Define UI for application that draws a histogram
shinyUI(
    fluidPage(

    # Application title
    dashboardPage(skin='blue', 
                  dashboardHeader(title = 'Tennis Analysis'),
    dashboardSidebar(
        sidebarMenu(
            
            menuItem('Intro', tabName = 'Intro' ),
            menuItem('Point Data', tabName = 'pointData'),
            menuItem('Match Data', tabName = 'matchData'),
            menuItem('Tournament Performance', tabName = 'tournamentPerformance'),
            menuItem('Newbs VS. Veterans Performance', tabName = 'newbsVsVets'),
            menuItem('Biggest Rise/Falls Over Time', tabName = 'riseAndFall')
            
            
            
        )
        
    ),                  
                  
                  
    dashboardBody(
        tabItems(intro, pointData, matchData, tournamentPerformance, newbsVsVets, riseAndFall )
    )
    )
    
)
)

