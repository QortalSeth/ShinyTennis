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