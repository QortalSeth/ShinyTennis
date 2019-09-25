
winRatios = function(input,output){
  output$winRatios = renderPlot({
  chosenPlayer = input$chosenPlayer
  result = winRatiosByYear  %>% filter(player== chosenPlayer) 
  print(result)
 return (result %>% 
           ggplot(aes(x=year, y=winRatio, color = player)) + geom_point() + geom_line() + labs(y='Win Ratio'))
})
}

tournamentWins = function(input,output)
{
  output$tournamentWins = renderPlot({
    chosenPlayer = input$chosenPlayer
    result = tournamentWinsByYear %>% filter(winner == chosenPlayer) 
    print(result)
    return(result %>% 
             ggplot(aes(x=year, y=wins, color = gender)) + geom_point() + geom_line() + labs(y= "Tournament Wins"))
    
    
  })
}

winHistogram = function(input,output)
{
  output$winHistogram = renderPlot({
    chosenPlayer = input$chosenPlayer
    tournamentWinsByYear %>% filter(winner == chosenPlayer) %>% 
      ggplot(aes(x=wins)) + geom_histogram() + labs(x="Tournament Wins Per Year")
  
  })
}

matchesPlayed = function(input,output)
{
  output$matchesPlayed = renderPlot({
    chosenPlayer = input$chosenPlayer
    result = finalPoint %>% group_by(year) %>% filter(player1 == chosenPlayer | player2 == chosenPlayer) %>% summarize(count = n())
    print(result)
    return(result %>% 
             ggplot(aes(x=year, y=count)) + geom_point() + geom_line() + labs(y= "Matches Played"))
    
    
  })
  
}

dWinRatioByYear = function(input,output)
{
  output$dWinRatio = renderPlot({
    chosenPlayer = input$chosenPlayer
    result = dwins %>% filter (player==chosenPlayer)
    return(result %>% ggplot(aes(x=year, y=DwinRatio)) + geom_point() + geom_line() + labs(y='Win Ratio Derivative' ))
    
  })
}

