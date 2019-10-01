

'
  This function returns a vector for a column of derivatives 
  
  params
  df: a dataframe
  columnName: the name of the column to get derivatives on
  groupName: the name of the column to group data by 
  '
getDerivative = function(df,columnName,groupName)
{
  
  
  # print(c("name is: ",name,'\n', 'id is: ' ,id))
  newColumn = vector()
  
  group = vector()
  for (i in 1:nrow(df))
  {
    if(df[i,groupName] %in% group)
    {
      newColumn = c(newColumn,df[i,columnName] - df[i-1,columnName])
    }
    else
    {
      group = c(group, df[i,groupName] )
      newColumn = c(newColumn, 0)
    }
  }
  
  #print(newColumn)
  
  return(unlist(newColumn))
}

dWins = winRatiosByYear %>% arrange(player, year)
dWins$DwinRatio = getDerivative(dWins, 'winRatio', 'player')
dWins

dWins %>% ggplot(aes(x=year, y=DwinRatio, color = player)) + geom_point() + geom_line()

#get top 10 tourney winners
top10Twins = tournamentWins %>% head(10)
top10Twins


#assemble derivative of wins
dTourneyWins = tournamentWinsByYear %>% arrange(winner,year,gender)
dTourneyWins$DerivativeTourneyWins = getDerivative(dTourneyWins,'wins','winner')
dTourneyWins

#dTourneyWins %>% arrange(desc(wins)) %>% filter(winner %in% top10Twins$winner) %>%  ggplot(aes(x=year, y=DerivativeTourneyWins, color = winner)) + geom_point() + geom_line()