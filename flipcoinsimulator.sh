#!/bin/bash -x


echo "Welcome : to Filp Coin Simulator"

HEAD=0
TAIL=1

result=$(( RANDOM%2 ))

case $result in
   $HEAD)
         echo "Head";;
   $TAIL)
         echo "Tail";;
esac
