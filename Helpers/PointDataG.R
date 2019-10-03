

avgPtBySet = players %>% 
  group_by(year, player,SetNum) %>% 
  summarize(avgPoints = mean(Pt)) %>% 
  arrange(year) 

# avgPtBySet %>%  ggplot(aes(x=year, y=avgPoints, color = gender)) + geom_point() + geom_line() +  facet_wrap(~SetNum)



avgRalleyLength = players %>% 
  group_by(year, player,SetNum) %>% 
  summarize(avgRallyLength = mean(rallyLen)) %>% 
  arrange(year)
  
# avgRalleyLength %>%  ggplot(aes(x=year, y=avgRallyLength, color = gender)) + geom_point() + geom_line() +  facet_wrap(~SetNum)