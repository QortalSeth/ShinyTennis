
intro = tabItem(tabName = 'Intro' ,
                fluidRow(box(width=12,
                             div(
                             h1('Welcome'),
                             p(
                             'This app was made to visualize and analyze statistically 
                significant patterns in the data of tennis matches over 
                the last 50 years. It is divided into 5 catagories:')
                             ),
                             
                             div(
                               h1('Point Data'),
                               p(
                                 'This measures the performance of 2 players by displaying the average number of points per game and the average number of volleys in each point.'
                                 
                               )
                             ),
                             
                             div(
                               h1('Match Data'),
                               p(
                                 'This measures the performance of 2 players in terms of the matches they win. It displays Win Ratios, Tournament Wins, Matches played per year, and a histogram of tournament wins per year.'
                                 
                               )
                             ),
                             
                             div(
                               h1('Tournament Performance'),
                               p(
                                 'This measures which players are doing the best in the selected tournament. 
                                 It displays the number of tournaments wins and matches played for the top 10 players for that tournament'
                                 )
                             ),

                             
                             div(
                               h1('Newbs VS. Veterans Performance'),
                               p(
                                 'This is similar to Match Data, except it normalizes the years relative to the player\'s start year. 
                                 This makes it possible to compare players at the same points in their career'
                                 
                               )
                             ),
                             
                             div(
                               h1('Biggest Rise/Falls Over Time'),
                               p(
                                 'This measures the derivatives of win ratios and tournament wins in order to see at what point in the chosen player\'s careers their performance changed the most.'
                                 
                               )
                             )
                             
                             
                             
                             
                )
                ))







