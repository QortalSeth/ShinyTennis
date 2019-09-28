
setPlotColors = function(colors)
{
  plotSize = 14
  switch(length(colors),
         theme(plot.title = element_text(color=colors[1], size = plotSize)),
         theme(
           plot.title = element_text(color=colors[1], size = plotSize),
           axis.title.x = element_text(color=colors[2], size = plotSize)
         ),
         theme(
           plot.title = element_text(color=colors[1], size = plotSize),
           axis.title.x = element_text(color=colors[2], size = plotSize),
           axis.title.y = element_text(color=colors[3], size = plotSize)
         )
         )
  }

setPlotColor = function(color)
{
  colors = c(color,color,color)
  setPlotColors(colors)
  
}


winRatios = function(input,output){
  output$winRatios = renderPlot({
  chosenPlayer = input$chosenPlayer
  plotTitle = paste0(chosenPlayer,'\'s Win Ratios in Each Year')
  
  result = winRatiosByYear  %>% filter(player== chosenPlayer) 
  print(result)
  
  plotColor = 'red'
 
  result %>% 
           ggplot(aes(x=year, y=winRatio)) + geom_point(color = plotColor) + geom_line(color = plotColor) + labs(x= 'Year', y='Win Ratio', title = plotTitle) + setPlotColor(plotColor)
         
})
}

tournamentWins = function(input,output)
{
  output$tournamentWins = renderPlot({
    chosenPlayer = input$chosenPlayer
    plotTitle = paste0(chosenPlayer,'\'s Tournament Wins Per Year')
    
    result = tournamentWinsByYear %>% filter(winner == chosenPlayer) 
    print(result)
    
    plotColor = 'cornflowerblue'
    
    result %>% 
             ggplot(aes(x=year, y=wins)) + geom_point(color = plotColor) + geom_line(color = plotColor) + labs(x= 'Year', y= "Tournament Wins", title = plotTitle) + setPlotColor(plotColor)
    
    
    
  })
}

winHistogram = function(input,output)
{
  output$winHistogram = renderPlot({
    chosenPlayer = input$chosenPlayer
    plotTitle = paste0(chosenPlayer,'\'s Distribution of Tournament Wins Per Year')
    
    plotColor = 'green2'
    
    tournamentWinsByYear %>% filter(winner == chosenPlayer) %>% 
      ggplot(aes(x=wins)) + geom_histogram(fill = plotColor) + labs(x="Tournament Wins Per Year", y='Count', title = plotTitle) + setPlotColor(plotColor)
  
  })
}

matchesPlayed = function(input,output)
{
  output$matchesPlayed = renderPlot({
    chosenPlayer = input$chosenPlayer
    plotTitle = paste0('Number of Matches played by ', chosenPlayer, ' Per Year')
    
    result = finalPoint %>% group_by(year) %>% filter(player1 == chosenPlayer | player2 == chosenPlayer) %>% summarize(count = n())
    print(result)
    
    plotColor = 'coral'
    
    result %>% 
             ggplot(aes(x=year, y=count)) + geom_point(color = plotColor) + geom_line(color = plotColor) + labs(x= 'Year', y= "Matches Played", title=plotTitle) + setPlotColor(plotColor)
           
    
    
  })
  
}

dWinRatioByYear = function(input,output)
{
  output$dWinRatio = renderPlot({
    chosenPlayer = input$chosenPlayer
    plotTitle = paste0(chosenPlayer,'\'s Changes in Win Ratio Over Time')
    plotColor = 'red'
    
    result = dwins %>% filter (player==chosenPlayer)
    result %>% ggplot(aes(x=year, y=DwinRatio)) + geom_point(color = plotColor) + geom_line(color = plotColor) + labs(x= 'Year', y='Win Ratio Derivative' , title = plotTitle)
    
  })
}

