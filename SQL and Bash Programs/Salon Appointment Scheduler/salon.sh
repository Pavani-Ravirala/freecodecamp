#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~ My Salon ~~\n"

MAIN_MENU()
{
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "Welcome to My Salon! How can I help you?"
  echo -e "\nPlease select a service. Here are the available services:"
  SERVICES=$($PSQL "SELECT service_id,name FROM services")
  # get services
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo -e "$SERVICE_ID) $NAME"
  done
  read SERVICE_ID_SELECTED
  # check if number is valid
  # check if it is a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # send to main menu
    MAIN_MENU "Sorry! Invalid service. Enter a number."
  else
    # check if service is available
    AVAILABLE_SERVICES=$($PSQL "SELECT * FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -z $AVAILABLE_SERVICES ]]
    then
      # send to main menu
      MAIN_MENU "Sorry! Invalid service."
    else
      # get number
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      # check if number exists
      PHONE_NUMBER=$($PSQL "SELECT * FROM customers WHERE phone='$CUSTOMER_PHONE';")
      if [[ -z $PHONE_NUMBER ]]
      then
        # get new customer
        echo -e "\nWhat is your name?"
        read CUSTOMER_NAME
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME');")
      fi
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
      echo -e "\nAt what time would you like your$SERVICE_NAME,$CUSTOMER_NAME?"
      read SERVICE_TIME
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME');")
      echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."
    fi
  fi
}

MAIN_MENU