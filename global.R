library(data.table)

#install.packages("shinydashboard")
library(rsconnect)
library(shinydashboard)
library(shiny)
library(stringr)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(tidyr)
library(stringi)

source('Helpers/MatchDataG.R')
source('Helpers/DerivativesG.R')
source('Helpers/CommonFunctions.R')
source('Helpers/PointDataG.R')
source('Helpers/NewbsVsVetsG.R')
source('Helpers/TournamentPerformanceG.R')

# read data
menPoints = read_csv('Tennis/menPoints.csv')
womenPoints = read_csv('Tennis/womenPoints.csv')

points = full_join(menPoints, womenPoints) %>% mutate(winner = ifelse(PtWinner==1,player1,player2), loser = ifelse(PtWinner==1,player2,player1)) 

finalPoint = points %>% group_by(match_id) %>% filter(Pt == max(Pt)) %>%  arrange(date)
finalPoint


#radioButtons = radioButtons('gender', 'Player Gender to examine:', choices = c('M','W','Both'), inline=TRUE, selected = 'Both')
#playersC = selectInput('chosenPlayer', label = "Choose a player", choices = tournamentWinsFiltered$winner)

