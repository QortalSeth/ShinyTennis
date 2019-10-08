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
menPoints = read_csv('Tennis/charting-m-points.csv')
womenPoints = read_csv('Tennis/charting-w-points.csv')

menPoints

# separate match_id into relevant fields

matchIDSeperator = function(df)
{
  returnValue = df %>% separate(match_id, sep = '-',c('date','gender','tournamentName','round','player1','player2'), remove = FALSE) %>% 
    mutate(date = as.Date(date, format = "%Y%m%d" )) %>% 
    select(match_id, date, gender, tournamentName, round, player1,player2, Pt,Set1,Set2,Gm1,Gm2, Pts, Serving, PtWinner, rallyLen, Notes)
  
  returnValue = returnValue %>% mutate(
    month = as.numeric(substr(date, 6,7 )), 
    year = as.numeric(substr(date,1,4)), 
    decade = floor(year/10)*10,
    SetNum = ifelse(PtWinner==1, Set1+1, Set2+1), 
    GameNum = ifelse(PtWinner==1, Gm1+1, Gm2+1))
  
  
  return (returnValue)
}

#remove empty data
filterData = function(df)
{
  returnValue = df %>% 
    filter( (PtWinner=='1' | PtWinner=='2') & !is.na(year) ) %>% 
    mutate(PtWinner = as.numeric(PtWinner), rallyLen = as.numeric(rallyLen))
  
  
  
  return(returnValue)
}


cleanPlayerNames = function(df){
  returnValue = df %>% mutate(player1 = gsub('_',' ', player1 ), player2 = gsub('_',' ', player2 )) %>% 
    mutate(player1 = stri_enc_toutf8(player1), player2 = stri_enc_toutf8(player2 )) %>% 
    mutate(player1 = stri_trim(player1), player2 = stri_trim(player2 ))
  
}


menPoints = matchIDSeperator(menPoints)
womenPoints = matchIDSeperator(womenPoints)

menPoints = filterData(menPoints)
womenPoints = filterData(womenPoints)

menPoints = cleanPlayerNames(menPoints)
womenPoints = cleanPlayerNames(womenPoints)

points = full_join(menPoints, womenPoints) %>% mutate(winner = ifelse(PtWinner==1,player1,player2), loser = ifelse(PtWinner==1,player2,player1)) 

finalPoint = points %>% group_by(match_id) %>% filter(Pt == max(Pt)) %>%  arrange(date)
finalPoint


#radioButtons = radioButtons('gender', 'Player Gender to examine:', choices = c('M','W','Both'), inline=TRUE, selected = 'Both')
#playersC = selectInput('chosenPlayer', label = "Choose a player", choices = tournamentWinsFiltered$winner)

