
derivatives = tabItem(tabName = 'rise&Fall',
                      fluidRow(
                        selectInput('chosenPlayer', label = "Choose a player", choices = tournamentWinsFiltered$winner),
                        box(plotOutput('dWinRatioByYear'))
                      )
                      
)