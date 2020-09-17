#!/bin/zsh
dir=$HOME/Downloads/mp3/from_youtube
	for f in $(ls -1  ${dir} | egrep "^[0-9]{4,6}")
	do 
		echo "$f\n"
	#do mv $f ${f/seascaperecovered/seascape}; 
	done

