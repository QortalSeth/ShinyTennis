

pointData = tabItem(tabName = 'pointData',
                    fluidRow(
                      selectInput('chosenPlayer1P', label = "Choose Player1", choices = tournamentWinsFiltered$winner),
                      selectInput('chosenPlayer2P', label = "Choose Player2", choices = tournamentWinsFiltered$winner, selected = head(tournamentWinsFiltered$winner,2)),
                      box(plotOutput('meanPtsPerMatch')),
                      box(plotOutput('meanVolleyLength'))
                    ))


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

tournamentPerformance = tabItem(tabName = 'tournamentPerformance',
                                fluidRow(
                                  selectInput('chosenTournament', label = "Choose a Tournament", choices = totalWinsFiltered$tournamentName),
                                  box(plotOutput('tournamentWinners')),
                                  box(plotOutput('tournamentParticipators'))
                                ))




newbsVsVets = tabItem(tabName = 'newbsVsVets',
                     fluidRow(
                       selectInput('chosenPlayer1N', label = "Choose Player1", choices = tournamentWinsFiltered$winner),
                       selectInput('chosenPlayer2N', label = "Choose Player2", choices = tournamentWinsFiltered$winner, selected = head(tournamentWinsFiltered$winner,2)),
                       box(plotOutput('winRatiosNormalized')),
                       box(plotOutput('tournamentWinsNormalized'))
                     ), 
                     fluidRow( box(plotOutput('matchesPlayedNormalized'), width = '200em')
                     ))

riseAndFall = tabItem(tabName = 'riseAndFall',
                      fluidRow(
                        selectInput('chosenPlayer1D', label = "Choose Player1", choices = tournamentWinsFiltered$winner),
                        selectInput('chosenPlayer2D', label = "Choose Player2", choices = tournamentWinsFiltered$winner, selected = head(tournamentWinsFiltered$winner,2)),
                        box(plotOutput('dWinRatioByYear')),
                        box(plotOutput('dTourneyWinsByYear'))
                      ))



