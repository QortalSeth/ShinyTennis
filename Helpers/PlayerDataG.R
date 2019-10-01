#1 Best Player of all time

# add 2 rows to each game, one for each player in that game
player1s = finalPoint %>% mutate(player = player1)
player2s = finalPoint %>% mutate(player = player2)
players = full_join(player1s, player2s) %>% arrange(match_id)

# players has double the number of rows
playerSummary = players %>% group_by(player,year,gender)%>% summarize(avgPoints = mean(Pt)) %>% arrange(year,player) 


# get total win ratios of players

playerWins = players %>% group_by(player = winner) %>% summarize(wins = n()/2) %>% arrange(desc(wins))
playerLosses = players %>% group_by(player = loser) %>% summarize(losses = n()/2)

winRatiosTotal = playerWins %>% 
  inner_join(playerLosses) %>% 
  mutate(matchesPlayed = wins+losses, winRatio = wins/matchesPlayed ) %>% 
  arrange(desc(matchesPlayed))

#plot histogram of win% of players
winHistogram = winRatiosTotal %>% filter(matchesPlayed>=10) %>% ggplot(aes(x=winRatio)) + geom_histogram()

# get win ratios by year
playerWinsByYear = players %>% group_by(player = winner, year) %>% summarize(wins = n()/2)
playerLossesByYear = players %>% group_by(player = loser, year) %>% summarize(losses = n()/2)

winRatiosByYear = playerWinsByYear %>% inner_join(playerLossesByYear) %>% mutate(winRatio = wins/(wins+losses) ) %>% arrange(desc(winRatio))
winRatiosByYear = winRatiosByYear %>% arrange(player)

tournamentWins = finalPoint %>% group_by(winner, gender) %>% filter(round == 'F') %>% summarize(wins = n()) %>%  arrange(desc(wins))


tournamentWinsFiltered = tournamentWins %>% filter(wins>=10)
tournamentWinsFiltered

tournamentWinsByYear = finalPoint %>% group_by(winner, year, gender) %>% filter(round == 'F') %>% summarize(wins = n()) %>%  arrange(desc(wins))


