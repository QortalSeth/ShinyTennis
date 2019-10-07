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
source('Helpers/NewbsVsVetsS.R')
source('Helpers/TournamentPerformanceS.R')


shinyServer(function(input, output) {
    
    winRatios(input,output)
    tournamentWins(input,output)
    winHistogram(input, output)
    matchesPlayed(input,output)
    
    dWinRatioByYear(input,output)
    dTourneyWinsByYear(input,output)
    
    meanPt(input,output)
    meanVolleyLength(input,output)
    
    winRatiosNormalized(input,output)
    tournamentWinsNormalized(input,output)
    matchesPlayedNormalized(input,output)
    
    tournamentWinners(input,output)
    tournamentParticipationF(input,output)
    
})
