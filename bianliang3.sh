#!/bin/bash
all_array=("石头" "剪刀" "布")
declare -A win_array
win_array=([石头]="布" [布]="剪刀" [剪刀]="石头")
plwins=0
cowins=0
while  [[ $plwins -lt 2 && $cowins -lt 2 ]] ;do
read -p "请输入你的手势(0代表石头 1代表剪刀 2代表布)" guest
len=${#all_array[@]}
computer=$(($RANDOM % $len))
computer_guest=${all_array[$computer]}
player_guest=${all_array[$guest]}
if [ $guest -le 2 -a $guest -ge 0 ]
then
	if [ "${win_array[$player_guest]}" == "$computer_guest" ]
	then
		echo "你输了"
		((cowins++))
	elif [ "$player_guest" == "$computer_guest" ];then
		echo "平局"
	else
		echo "你赢了"
		((plwins++))
	fi
	else
	echo "输入无效"
fi
done
if [ $plwins -eq 2 ]; then
    echo "恭喜你，赢得了三局两胜的比赛！"
elif [ $cowins -eq 2 ]; then
    echo "很遗憾，电脑赢得了三局两胜的比赛。"
fi
