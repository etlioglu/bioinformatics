#! /usr/bin/bash

# ECHO COMMAND
echo Hello World!

# VARIABLES
# uppercase by convention
# letters, numbers and underscores are allowed

# check https://stackoverflow.com/questions/8748831/when-do-we-need-curly-braces-around-shell-variables
NAME="Emre"
echo "My name is $NAME"
echo "My name is ${NAME}" # adopt this
echo My name is $NAME

# USER INPUT
read -p "Enter your name:" USER_INPUT
echo $USER_INPUT

# SIMPLE IF STATEMENT
if [ "$NAME" == "Emre" ]
then
    echo "Your name is Emre"
fi

# IF-ELSE
if [ "$NAME" == "Emre" ]
then
    echo "Your name is Emre" 
else
    echo "Not emre"
fi

# ELSE-IF (elif)
if [ "$NAME" == "Emre" ]
then
    echo "Your name is Emre"
elif [ "$NAME" == "Aliveli" ]
then
    echo "Your name is Aliveli"   
else
    echo "Not emre"
fi

# COMPARISONS

