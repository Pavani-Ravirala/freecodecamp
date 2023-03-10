#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo -e "\n~~ Number guesser ~~\n"
echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM games WHERE user_id='$USER_ID';")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id='$USER_ID';")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
SECRET=$(( $RANDOM % 1000 + 1 ))
echo -e "\nGuess the secret number between 1 and 1000:"
TRIED=0
CORRECT=0
while [[ $CORRECT == 0 ]]
do
  read NUMBER
  if [[ ! $NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $NUMBER == $SECRET ]]
  then
    TRIED=$(( $TRIED + 1 ))
    CORRECT=1
    INSERT_GAMES=$($PSQL "INSERT INTO games(user_id,guesses) VALUES($USER_ID,$TRIED);")
    echo -e "\nYou guessed it in $TRIED tries. The secret number was $SECRET. Nice job!"
  elif [[ $NUMBER < $SECRET ]]
  then
    TRIED=$(( $TRIED + 1 ))
    echo -e "\nIt's higher than that, guess again:"
  else
    TRIED=$(( $TRIED + 1 ))
    echo -e "\nIt's lower than that, guess again:"
  fi
done







