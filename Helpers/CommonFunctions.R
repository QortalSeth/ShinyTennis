
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

updateGender = function(input,output, session)
{
  observe({
    
    
  print("Updating Gender")
  genderChosen = input$gender
  
  print('unfiltered results')
  print(tournamentWinsFiltered)
  print(paste0('Gender Chosen is: ',genderChosen))
  result = ifelse(genderChosen=='Both',tournamentWinsFiltered,  tournamentWinsFiltered %>% filter(gender == genderChosen))
  
  print('Filtered Results')
  print(result)
  updateSelectInput(session, output$chosenPlayer, label = 'Player Gender to examine:', choices = result$winner)
    
    })
}