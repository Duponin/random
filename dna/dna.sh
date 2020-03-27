#! /usr/bin/env bash

set -e

function complement(){
    case $1 in
       "A")
           echo "T"
           ;;
       "C")
           echo "G"
           ;;
       "T")
           echo "A"
           ;;
       "G")
           echo "C"
           ;;
   esac
}

function randomizer(){
    RANDOM_VALUE=$(($RANDOM % 3))
    case $RANDOM_VALUE in
        0)
            echo "A"
            ;;
        1)
            echo "C"
            ;;
        2)
            echo "T"
            ;;
        3)
            echo "G"
            ;;
    esac
}

for i in $(seq 1 $1); do
    PAIR_1="$(randomizer)"
    PAIR_2="$(complement $PAIR_1)"

    case $2 in
        "ascii")
            printf "%s —— %s\n" "$PAIR_1" "$PAIR_2"
            ;;
        "ascii-improved")
            printf "(%s (     ) %s)\n \`-.\`. ,',-'\n    _,-'\"\n ,-',' \`.\`-.\n" "$PAIR_1" "$PAIR_2"
            ;;
    esac
done
