#!/usr/bin/env sh

url="http://localhost:3333"
json="$(curl $url/api/tasks 2>/dev/null)"

case "$1" in
"prompt")
  overdues="$(echo $json | jq '.OverduedTasks | length')"
  today="$(echo $json | jq '.TodayTasks | length')"
  
  echo "$overdues over, $today today";;
"tasks")
	echo "$(echo $json | jq -r '.TodayTasks[] | (.ID|tostring) + ": " + .Title')";;
"close")
	id=$2
	res=$(curl "$url/api/tasks/done?id=$id" 2>/dev/null)
	if [ $res='"ok"' ]
	then
		echo "Done"
	else
		echo "Error"
	fi
esac
