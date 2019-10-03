

winRatios = function(input,output){
  output$winRatios = renderPlot({
    chosenPlayer1 = input$chosenPlayer1M
    chosenPlayer2 = input$chosenPlayer2M
  plotTitle = paste0(chosenPlayer1,' and ', chosenPlayer2,'\'s Win Ratios in Each Year')
  
  result = winRatiosByYear  %>% filter(player==chosenPlayer1 | player==chosenPlayer2)
#  print(result)
  
  plotColor = 'red'
 
  result %>% 
           ggplot(aes(x=year, y=winRatio, color = player)) + geom_point() + geom_line() + labs(x= 'Year', y='Win Ratio', title = plotTitle) + setPlotColor(plotColor)
         
})
}

tournamentWins = function(input,output)
{
  output$tournamentWins = renderPlot({
    chosenPlayer1 = input$chosenPlayer1M
    chosenPlayer2 = input$chosenPlayer2M
    plotTitle = paste0(chosenPlayer1,' and ', chosenPlayer2, '\'s Tournament Wins Per Year')
    
    result = tournamentWinsByYear %>% filter(winner==chosenPlayer1 | winner==chosenPlayer2)
 #  print(result)
    
    plotColor = 'cornflowerblue'
    
    result %>% 
             ggplot(aes(x=year, y=wins, color = winner)) + geom_point() + geom_line() + labs(x= 'Year', y= "Tournament Wins", title = plotTitle) + setPlotColor(plotColor)
    
    
    
  })
}

winHistogram = function(input,output)
{
  output$winHistogram = renderPlot({
    chosenPlayer1 = input$chosenPlayer1M
    chosenPlayer2 = input$chosenPlayer2M
    plotTitle = paste0(chosenPlayer1, ' and ', chosenPlayer2, '\'s Distribution of Tournament Wins Per Year')
    
    plotColor = 'green2'
    
    tournamentWinsByYear %>% filter(winner==chosenPlayer1 | winner==chosenPlayer2) %>% 
      ggplot(aes(x=wins, fill = winner)) + geom_histogram() + facet_wrap(~winner) + labs(x="Tournament Wins Per Year", y='Count', title = plotTitle) + setPlotColor(plotColor)
  
  })
}

matchesPlayed = function(input,output)
{
    output$matchesPlayed = renderPlot({
    chosenPlayer1 = input$chosenPlayer1M
    chosenPlayer2 = input$chosenPlayer2M
    plotTitle = paste0('Number of Matches played by ', chosenPlayer1, ' and ', chosenPlayer2, ' Per Year')
#    print(finalPoint)
    result = players %>% group_by(year, player) %>% filter(player == chosenPlayer1 | player == chosenPlayer2) %>% summarize(count = n())
    result %>% print(n=Inf)
    
    plotColor = 'coral'
    
    result %>% 
             ggplot(aes(x=year, y=count, color = player)) + geom_point() + geom_line() + labs(x= 'Year', y= "Matches Played", title=plotTitle) + setPlotColor(plotColor)
           
    
    
  })
  
}



