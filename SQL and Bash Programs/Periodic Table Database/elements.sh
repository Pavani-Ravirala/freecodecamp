PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  # if argument not given
  echo -e "Please provide an element as an argument."
else
  # if number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT=$($PSQL "SELECT atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1;")
    # if name or symbol
  else
    ELEMENT=$($PSQL "SELECT atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1' OR symbol='$1';")
  fi
  # if element not found
  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  # if element found
  else
    echo "$ELEMENT" | while read NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR MASS BAR MELTING BAR BOILING
    do
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
  fi
fi
