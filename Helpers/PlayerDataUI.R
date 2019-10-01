playerData = tabItem(tabName = 'playerData',
                     fluidRow(
                       radioButtons('gender', 'Player Gender to examine:', choices = c('Male','Female','Both'), inline=TRUE, selected = 'Both'),
                       selectInput('chosenPlayer', label = "Choose a player", choices = tournamentWinsFiltered$winner),
                       
                       box(plotOutput("winRatios")),
                       box(plotOutput("tournamentWins"))
                     ),
                     fluidRow( box(plotOutput("matchesPlayed")),
                               box(plotOutput("winHistogram"))
                             )
                     )