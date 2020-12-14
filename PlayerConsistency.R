---
  #title: "Calculating player consistency by comparing Mean and Median PPG."
  # by Bernie Koen
  ---

#Import the player's stats for the season
playernamestats <- read.csv('playernamestats20182019.csv')

#Exclude games in which the player does not play
playernamestats <- playernamestats %>%
  filter (G != 'NA')

#Convert the players points per game to Numeric values
playernamestats <- playernamestats %>%
  mutate(PTS = as.character(PTS))

playernamestats <- playernamestats %>%
  mutate(PTS = as.numeric(PTS))

#Calculate the player's mean PPG and median PPG. Subtract median from mean and store that value in a variable.
playernamemeanminusmedian <- mean(playernamestats[["PTS"]]) - median(playernamestats[["PTS"]])

#Print the variable with it's meaning.
print("Playername's mean minus median points per game is:")
print(playernamemeanminusmedian)

#Using the mean minus median value we can assess the direction of the player's volatility.
print("This player tends to have scoring performances that are")
if (playernamemeanminusmedian<0) {
  print(" on the lower end")}
if (playernamemeanminusmedian>0) {
  print (" on the higher end")}
if (playernamemeanminusmedian==0) {
  print("extremely consistent")}

#Calculate standard deviation of Points Per Game
playernamestddevppg <- sd(playernamestats$PTS)

#Explain what this standard deviation value of PPG means
print("playername's standard deviation of points per game for the 2018-2019 season is")
print(playernamestddevppg)
print(". The higher this number the more volatile the player's scoring per game.")
