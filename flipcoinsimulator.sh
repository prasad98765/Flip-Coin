#!/bin/bash -x

number=0

function flipcoin(){

num=$1
number=$2
declare -A coinset
	for (( i=0; i<$number; i++ ))
	do
			coin=""
         for (( j=0; j<$num; j++ ))
         do
             flipCoin=$((RANDOM%2))
             if [ $flipCoin -eq 1 ]
             then
                    coin="$coin""H"
             else
                    coin="$coin""T"
             fi
          done
             coinset[$coin]=$(( ${coinset["$coin"]} + 1 ))
	done

for val in ${!coinset[@]}
do
	 perCet=$(( $((${coinset[$val]} * 100)) /20 ))
	 echo "$val ${coinset[$val]} $perCet"

done | sort -k3 -nr | awk 'NR==1{print ($1 " " $2 " " $3 )}'
}

main(){

read -p "Enter your choice: 1.SingletCoin 2.DoubletCoin 3.TripletCoin " coin
read -p "Enter How Many Times You Want to Flip " number

        case $coin in
        1)
                flipcoin 1 $number;;
        2)
                flipcoin 2 $number;;
        3)
                flipcoin 3 $number;;
        *)
                echo "Invalid Option";;
        esac

}
main
