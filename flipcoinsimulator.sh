#!/bin/bash -x

echo "Welcome : to Filp Coin Simulator"
declare -A flipCoinResult

function getFlipingCoin()
{

	for (( i=0; i<$2; i++ ))
	do
			coin=""
			for (( j=0; j<$1; j++ ))
			do
				if [ $((RANDOM%2)) -eq 1 ]
				then
							coin="$coin""H"
				else
							coin="$coin""T"
				fi
         	done
				flipCoinResult[$coin]=$(( ${flipCoinResult["$coin"]} + 1 ))
	done
	getPercentageOfCoin

}

function getPercentageOfCoin()
{

	for val in ${!flipCoinResult[@]}
	do
		percentageOfCoin=$(( $((${flipCoinResult[$val]} * 100)) /$number ))
		echo "$val ${flipCoinResult[$val]} $percentageOfCoin"
	done | sort -k3 -nr | awk 'NR==1{print ($1 " " $2 " " $3 )}'

}

function getChoice()
{

	read -p "Enter your choice: 1.SingletCoin 2.DoubletCoin 3.TripletCoin " coin
	read -p "Enter How Many Times You Want to Flip Coin " number

		case $coin in
        1)
                getFlipingCoin 1 $number;;
        2)
                getFlipingCoin 2 $number;;
        3)
                getFlipingCoin 3 $number;;
        *)
                echo "Invalid Option";;
        esac

}

function main()
{

	getChoice

}
main
