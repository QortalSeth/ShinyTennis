In every sport, people want to know who is the best, usually to confirm that their favorite players and teams are among them. The question is how can we determine that. My [ShinyTennis application](https://github.com/sethmjackson/ShinyTennis) examines many statistics over decades of recorded tennis matches to decide who the dominant players are. This application uses the [Tennis Match Charting Project Data Frame](https://github.com/JeffSackmann/tennis_MatchChartingProject). The application has 5 sections, which examine different aspects of player performance, which are sorted from short term to long term analysis.

## Point Data
![](https://github.com/sethmjackson/ShinyTennis/blob/master/Images/Point%20Data.png)
This measures the performance of 2 players by displaying the average number of points per game and the average number of volleys in each point. It is expected that better players will defeat their opponents more quickly, so lower values here are considered better. Andre Agassi had the lowest Points per match and Volley Length Per match.

## Match Data
![](https://github.com/sethmjackson/ShinyTennis/blob/master/Images/Match%20Data.png)
This measures the performance of 2 players in terms of the matches they win. It displays Win Ratios, Tournament Wins, Matches played per year, and a histogram of tournament wins per year. The best players are those that have higher Win Ratios, Match Participation, and Tournament Wins. The Histogram makes the distribution of Tournament Wins easier to understand. Roger Federer and Novak Djokovic had the most tournament wins.

## Tournament Performance
![](https://github.com/sethmjackson/ShinyTennis/blob/master/Images/Tournament%20Data.png)
This measures which players are doing the best in the selected tournament. It displays the number of tournaments wins and matches played for the top 10 players for that tournament. This allows the user to determine which players are dominating each individual tournament. Pete Sampras, Roger Federer, and Steffi Graf have all won the US Open 5 times, but Roger Federer has the most matches played.

## Newbs VS. Veterans Performance
![](https://github.com/sethmjackson/ShinyTennis/blob/master/Images/Newbs%20VS.%20Vets%20Data.png)
This is similar to Match Data, except it normalizes the years relative to the player's start year. This makes it possible to compare players at the same points in their career. The best players are those who can maintain high win ratios and win rates throughout their career. Serena Williams has the longest Tennis Career at 20 years, and her tournament wins have been at their highest over the last 10 years.

## Biggest Rise/Falls Over Time
![](https://github.com/sethmjackson/ShinyTennis/blob/master/Images/Biggest%20Rise%26Fall%20Data.png)
This measures the derivatives of win ratios and tournament wins in order to see at what point in the chosen player's careers their performance changed the most. This makes it easy to see how players have changed the most as their career progressed. In 2015 Serena Williams had the biggest drop in Win Ratio of all players.

## Future Work
If I had more time, I would give the user more control over how the data is presented. Allowing them to sort a player combobox in different ways to make it clear which players have the highest values in each plot. This would make it much easier to see who the dominant players are. I could also search additional data frames to examine who is winning the most prize money, and the nationalities of tournaments and players to see how player performance affects these variables.
