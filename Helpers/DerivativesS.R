

dWinRatioByYear = function(input,output)
{
  output$dWinRatioByYear = renderPlot({
    chosenPlayer1 = input$chosenPlayer1D
    chosenPlayer2 = input$chosenPlayer2D
    plotTitle = paste0(chosenPlayer1, ' and ', chosenPlayer2, '\'s Changes in Win Ratio Over Time')
    plotColor = 'mediumaquamarine'
    
    result = dWins %>% filter (player==chosenPlayer1 | player==chosenPlayer2)
    print('text here!')
    result %>% print(n=Inf)
    result %>% ggplot(aes(x=year, y=DwinRatio, color = player)) + geom_point() + geom_line() + labs(x= 'Year', y='Win Ratio Derivative' , title = plotTitle) + setPlotColor(plotColor)
    
  })
}


dTourneyWinsByYear = function(input,output)
{
  output$dTourneyWinsByYear = renderPlot({
    chosenPlayer1 = input$chosenPlayer1D
    chosenPlayer2 = input$chosenPlayer2D
    plotTitle = paste0(chosenPlayer1,' and ', chosenPlayer2,'\'s Changes in Tournament Wins Over Time')
    plotColor = 'orangered'
    
    result = dTourneyWins %>% filter (winner==chosenPlayer1 | winner==chosenPlayer2)
    print('text here!')
    result %>% print(n=Inf)
    result %>% ggplot(aes(x=year, y=DerivativeTourneyWins, color = winner)) + geom_point() + geom_line() + labs(x= 'Year', y='Tournament Wins Derivative' , title = plotTitle) + setPlotColor(plotColor)
    
  })
}