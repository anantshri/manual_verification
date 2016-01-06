#!/bin/bash
for a in `ls templates/*.md`
do
	title=`grep "title" $a | cut -f2 -d":" | xargs`
	url=`echo $a|cut -f1 -d"."`
	author=`grep "author" $a | cut -f2 -d":"`
	if [ ! -z "$title" ]
	then
		echo '- name: "'$title'"'
		echo '  url: '$url
		echo '  author: '$author
	fi
done