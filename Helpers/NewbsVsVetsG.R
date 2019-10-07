#plot win ratios by starting year
dWins = dWins %>% arrange(player, year)
dTourneyWins = dTourneyWins %>% arrange(winner, year)

startYear = dWins %>% group_by(player) %>% summarize(startYear = min(year))
startYear

dWins = inner_join(startYear, dWins)%>% mutate(Dyear = year - startYear) %>% select(-startYear)
dWins

# use Dwins and dTourneyWins
dWins %>% ggplot(aes(x=Dyear, y=winRatio, color = player)) + geom_point()+geom_line()
dWins %>% ggplot(aes(x=Dyear, y=DwinRatio, color = player)) + geom_point()+geom_line()

#plot tourney wins by startind year

startYear = dTourneyWins %>% group_by(winner) %>% summarize(startYear = min(year))
startYear

dTourneyWins = inner_join(startYear, dTourneyWins)%>% mutate(Dyear = year - startYear) %>% select(-startYear)
dTourneyWins



dTourneyWins %>% ggplot(aes(x=Dyear, y=wins, color = winner)) + geom_point()+geom_line()


