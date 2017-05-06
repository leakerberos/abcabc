#!/bin/sh
	echo === print file informaion ===
	script_dir=$(cd "$(dirname "$0")" && pwd)
	echo current directory : $script_dir

	f_count_file=$(ls -l | grep ^- | wc -l)
	f_count_dir=$(ls -l | grep ^d | wc -l)
	f_count=`expr $f_count_file + $f_count_dir `
	echo the number elements : $f_count

	num=1
	for i in $(ls)
	do
	echo [$num] $i
	num=`expr $num + 1`
	f_type=$(stat -c %A $i | cut -c 1)
	echo $f_type
	echo "----------------INFORMATION--------------"
	echo file type :`if [ "$f_type" = "-" ]
			then
				echo " N o r m a l F i l e"
			elif [ "$f_type" = "d" ]
			then
				echo "[34m D i r e c t o r y "
			else
				echo "[32m F i l e"
			fi`
	echo "[0mfile size : $(stat -c %s $i)"
	echo "creation time : $(stat -c %z $i)"
	echo "permission : $(stat -c %a $i)"
	echo "absolute path : $(pwd $i)"
	echo "relative path : .$(pwd $i)"
	echo "-----------------------------------------"
	done
