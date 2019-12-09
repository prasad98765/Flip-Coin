#!/bin/bash -x


echo "Welcome : to Filp Coin Simulator"

HEAD=0
TAIL=1
COUNT_HEAD=0
COUNT_TAIL=0
declare -A dict
for (( i=0; i<=10; i++ ))
do
	result=$(( RANDOM%2 ))
		case $result in
   		$HEAD)
					echo "Head"
         		dict[flip$i]='H'
					COUNT_HEAD=$(( $COUNT_HEAD + 1 ));;
   		$TAIL)
         		echo "Tail"
					dict[Flip$i]='T'
					COUNT_TAIL=$(( $COUNT_TAIL + 1 ));;
		esac
done

perHead=$(( $COUNT_HEAD * 10 ))
echo "percentage OF head" $perHead
perTail=$(( $COUNT_TAIL * 10 ))
echo "percentage OF head" $perTail



