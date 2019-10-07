

winRatiosNormalized = function(input,output){
  output$winRatiosNormalized = renderPlot({
    chosenPlayer1 = input$chosenPlayer1N
    chosenPlayer2 = input$chosenPlayer2N
    plotTitle = paste0(chosenPlayer1,' and ', chosenPlayer2,'\'s Normalized Win Ratios')
    
    result = dWins %>% filter(player==chosenPlayer1 | player==chosenPlayer2)
    #  print(result)
    
    plotColor = 'red'
    
    result %>% 
      ggplot(aes(x=Dyear, y=winRatio, color = player)) + geom_point() + geom_line() + labs(x= 'Years Since Player Started', y='Win Ratio', title = plotTitle) + setPlotColor(plotColor)
    
  })
}

tournamentWinsNormalized = function(input,output)
{
  output$tournamentWinsNormalized = renderPlot({
    chosenPlayer1 = input$chosenPlayer1N
    chosenPlayer2 = input$chosenPlayer2N
    plotTitle = paste0(chosenPlayer1,' and ', chosenPlayer2, '\'s Normalized Tournament Wins')
    
    result = dTourneyWins %>% filter(winner==chosenPlayer1 | winner==chosenPlayer2)
    #  print(result)
    
    plotColor = 'cornflowerblue'
    
    result %>% 
      ggplot(aes(x=Dyear, y=wins, color = winner)) + geom_point() + geom_line() + labs(x= 'Years Since Player Started', y= "Tournament Wins", title = plotTitle) + setPlotColor(plotColor)
    
    
    
  })
}

matchesPlayedNormalized = function(input,output)
{
  output$matchesPlayedNormalized = renderPlot({
    chosenPlayer1 = input$chosenPlayer1N
    chosenPlayer2 = input$chosenPlayer2N
    plotTitle = paste0('Number of Normalized Matches Played by ', chosenPlayer1, ' and ', chosenPlayer2)
    #    print(finalPoint)
    result = dWins %>% group_by(Dyear, player) %>% filter(player == chosenPlayer1 | player == chosenPlayer2) %>% summarize(matches = wins + losses)
    result %>% print(n=Inf)
    
    plotColor = 'coral'
    
    result %>% 
      ggplot(aes(x=Dyear, y=matches, color = player)) + geom_point() + geom_line() + labs(x= 'Years Since Player Started', y= "Matches Played", title=plotTitle) + setPlotColor(plotColor)
    
    
    
  })
  
}



