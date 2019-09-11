
winRatios = function(input,output){
  output$winRatios = renderPlot({
  chosenPlayer = input$chosenPlayer
  winRatiosByYear  %>% filter(player== chosenPlayer) %>% ggplot(aes(x=year, y=winRatio, color = player)) + geom_point() + geom_line()
})
}

tournamentWins = function(input,output)
{
  output$tournamentWins = renderPlot({
    chosenPlayer = input$chosenPlayer
    tournamentWinsByYear %>% filter(player == chosenPlayer) %>% ggplot(aes(x=year, y=wins, color = gender)) + geom_point() + geom_line()
    
  })
}