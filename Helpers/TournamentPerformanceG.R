tournamentWinnersDF = finalPoint %>% 
  group_by(tournamentName, round,  winner) %>% 
  summarize(wins = n()) %>%  
  arrange(desc(wins))

tournamentNames = points %>%  distinct(tournamentName) 

totalWins = finalPoint %>% group_by(tournamentName) %>% filter(round == 'F') %>% summarize(wins = n()) %>% arrange(desc(wins))
totalWins

totalWinsFiltered = totalWins %>% filter(wins>=20)

tournamentParticipation = players %>% group_by(tournamentName, player) %>% summarize (count = n()) %>% arrange(desc(count))
tournamentParticipation
