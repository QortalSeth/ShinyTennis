

matchData = tabItem(tabName = 'matchData',
                     fluidRow(
                       selectInput('chosenPlayer1M', label = "Choose Player1", choices = tournamentWinsFiltered$winner),
                       selectInput('chosenPlayer2M', label = "Choose Player2", choices = tournamentWinsFiltered$winner, selected = head(tournamentWinsFiltered$winner,2)),
                      box(plotOutput("winRatios")),
                      box(plotOutput("tournamentWins"))
                     ),
                     fluidRow( box(plotOutput("matchesPlayed")),
                               box(plotOutput("winHistogram"))
                             )
                     )



riseAndFall = tabItem(tabName = 'riseAndFall',
                      fluidRow(
                        selectInput('chosenPlayer1D', label = "Choose Player1", choices = tournamentWinsFiltered$winner),
                        selectInput('chosenPlayer2D', label = "Choose Player2", choices = tournamentWinsFiltered$winner, selected = head(tournamentWinsFiltered$winner,2)),
                        box(plotOutput('dWinRatioByYear')),
                        box(plotOutput('dTourneyWinsByYear'))
                      ))

pointData = tabItem(tabName = 'pointData',
                    fluidRow(
                      selectInput('chosenPlayer1P', label = "Choose Player1", choices = tournamentWinsFiltered$winner),
                      selectInput('chosenPlayer2P', label = "Choose Player2", choices = tournamentWinsFiltered$winner, selected = head(tournamentWinsFiltered$winner,2)),
                      box(plotOutput('meanPtsPerMatch')),
                      box(plotOutput('meanVolleyLength'))
                    ))

newbVSvets = tabItem(tabName = 'newbVSvets',
                     fluidRow(
                       selectInput('chosenPlayer1N', label = "Choose Player1", choices = tournamentWinsFiltered$winner),
                       selectInput('chosenPlayer2N', label = "Choose Player2", choices = tournamentWinsFiltered$winner, selected = head(tournamentWinsFiltered$winner,2)),
                       box(plotOutput('')),
                       box(plotOutput(''))
                     ))



intro = tabItem(tabName = 'Intro' ,
                fluidRow(box(width=12,
                             h1('Welcome'),
                             p('This app was made to visualize and analyze statistically 
                significant patterns in the data of tennis matches over 
                the last 50 years.')      
                )
                ))