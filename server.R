#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
source('Helpers/MatchDataS.R')
source('Helpers/DerivativesS.R')
source('Helpers/PointDataS.R')

shinyServer(function(input, output, session) {
 #   updateGender(input, output, session)
    
    winRatios(input,output)
    tournamentWins(input,output)
    winHistogram(input, output)
    matchesPlayed(input,output)
    
    
    dWinRatioByYear(input,output)
    dTourneyWinsByYear(input,output)
    
    meanPt(input,output)
    meanVolleyLength(input,output)
    
    
    
})
