
tournamentWinners = function(input,output)
{
  output$tournamentWinners = renderPlot({
    chosenTouranment = input$chosenTournament
    
    plotTitle = paste0('Distribution of Wins in ', chosenTouranment)
    
    plotColor = 'red2'
    
    result =  tournamentWinnersDF %>% filter(tournamentName==chosenTouranment, round=='F') %>% head(10)
    
    result %>% print(n=Inf)
    
    result %>% ggplot(aes(x= winner, y= wins)) + geom_bar(stat = "identity", fill = plotColor) + labs(x="Tournament Wins Per Player", y='Count', title = plotTitle) + setPlotColor(plotColor)
    
    
  })
  
}

tournamentParticipationF = function(input,output){
  output$tournamentParticipators = renderPlot({
  chosenTouranment = input$chosenTournament
  
  plotTitle = paste0('Distribution of Matches Played in ', chosenTouranment)
  
  plotColor = 'blue2'
  
  result =  tournamentParticipation %>% filter(tournamentName==chosenTouranment) %>% head(10)
  
  result %>% print(n=Inf)
  
  result %>% ggplot(aes(x= player, y= count)) + geom_bar(stat = "identity", fill = plotColor) + labs(x="Matches played Per Player", y='Count', title = plotTitle) + setPlotColor(plotColor)
  })
  
  
}