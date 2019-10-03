
meanPt = function(input,output)
{
  output$meanPtsPerMatch = renderPlot({
    chosenPlayer1 = input$chosenPlayer1P
    chosenPlayer2 = input$chosenPlayer2P
    plotTitle = paste0('Average number of Points Per match for ', chosenPlayer1, ' and ', chosenPlayer2, ' Per Year')
    #    print(finalPoint)
    result = avgPtBySet %>% filter(player == chosenPlayer1 | player == chosenPlayer2)
    result %>% print(n=Inf)
    
    plotColor = 'lightskyblue'
    
    result %>% 
      ggplot(aes(x=year, y=avgPoints, color = player)) + geom_point() + geom_line() + facet_wrap(~SetNum) + labs(x= 'Year', y= "Matches Played", title=plotTitle) + setPlotColor(plotColor)
      })
}

meanVolleyLength = function(input,output)
{
  output$meanVolleyLength = renderPlot({
    chosenPlayer1 = input$chosenPlayer1P
    chosenPlayer2 = input$chosenPlayer2P
    plotTitle = paste0('Average Volley Length Per match for ', chosenPlayer1, ' and ', chosenPlayer2, ' Per Year')
    #    print(finalPoint)
    result = avgRalleyLength %>% filter(player == chosenPlayer1 | player == chosenPlayer2)
   # result %>% print(n=Inf)
    
    plotColor = 'red2'
    
    result %>% 
      ggplot(aes(x=year, y=avgRallyLength, color = player)) + geom_point() + geom_line() + facet_wrap(~SetNum) + labs(x= 'Year', y= "Matches Played", title=plotTitle) + setPlotColor(plotColor)
  })
}