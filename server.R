#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source('Helpers/serverHelper.R')

shinyServer(function(input, output) {

    winRatios(input,output)
    tournamentWins(input,output)
    winHistogram(input, output)
    matchesPlayed(input,output)
    dWinRatioByYear(input,output)
})
