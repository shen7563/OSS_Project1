#!/bin/bash
stop="N"
echo "--------------------------"
echo "User Name : YangByeongHun"
echo "Student ID : 12191623"
echo "[ MENU ]"
echo "1. Get the data of the movie identifed by a specific 'movie id' from 'u.item'"
echo "2. Get the data of action genre movies from 'u.item'"
echo "3. Get the average 'rating' of the movie identified by specific 'movie id' from 'u.data'"
echo "4. Delete the 'IMDb URL' from 'u.item'"
echo "5. Get the data about users from 'u.user'"
echo "6. Modify the format of 'release date' in 'u.item'"
echo "7. Get the data of movies rated by a specific 'user id' from 'u.data'"
echo "8. Get the average 'rating' of movies rated by users with 'age' between 20 and 29 'occupation' as 'programmer'"
echo "9. Exit"
echo "--------------------------"
until [ $stop = "Y" ]
do
    read -p "Enter your choice [ 1-9 ] " choice
    case $choice in
    1)
        read -p "Please enter 'movie id'(1~1682): " input
        awk 'NR == '$input' {print $0}' u.item
    ;;
    2)
        read -p "Do you want to get the data of 'action' genre movies from 'u.item'? (y/n): " input
        if [ $input = "y" ]
        then
            awk -F\| '$7 == 1 {print $1, $2}' u.item | head -n 10
        fi
    ;;
    3)
        read -p "Please enter the 'movie id'(1~1682): " input
        echo "average rating of $input: "$(awk '$2 == '$input' {sum += $3; count++} END {print sum/count}' u.data)
    ;;
    4)
        read -p "Do you want to delete the 'IMdb URL' from 'u.item'? (y/n): " input
        if [ $input = "y" ]
        then
            cat u.item | sed -E 's/http[^)]*\)//g' | head -n 10
        fi
    ;;
    5)
        read -p "Do you want to get the data about users from 'u.user'? (y/n): " input
        if [ $input = "y" ]
        then
            sed -E 's/([0-9]+)\|([0-9]+)\|M\|([^|]+)\|[^|]+/user \1 is \2 years old male \3/;s/([0-9]+)\|([0-9]+)\|F\|([^|]+)\|[^|]+/user \1 is \2 years old female \3/' u.user | head -n 10
        fi
    ;;
    6)
        read -p "Do you want to Modify the format of 'release data' in 'u.item'? (y/n): " input
        
    ;;
    7)
        read -p "Please enter the 'user id'(1~943): " input

    ;;
    8)
        read -p "Do you want to get the average 'rating' of movies rated by users with 'age' between 20 and 29 'occupation' as 'programmer'? (y/n): " input

    ;;
    9)
    echo "Bye!"
    stop="Y"
    ;;
    *)
    echo "Error: Invalid option"
    read -p "Press [Enter] key to continue..." readEnterKey
    ;;
    esac
done