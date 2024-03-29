#!/usr/bin/env sh

printList() {
  length=$(echo $json | jq -c $(echo $2 | tr [] "  ") | jq length)

  if [ $length != "0" ]; then

    echo -e "\n---\e[1m $1 \e[0m---"

    echo $json | jq -c $2  | while read task; 
    do 
      pp $task
    done
  fi
}

pp(){
  task=$*

  completed="$(echo $task | jq '.Completed')"
  str_start="[ ] "
  str_end=""

  if [ ! -z $completed ] && [ $completed = true ]; then
    str_start="[x] \e[9m"
    str_end="\e[0m"
  fi

  echo -e "$str_start$(echo $task | jq -r '(.ID|tostring) + ": " + .Title')$str_end"
}

url="https://todayist.onrender.com"
token="Authorization: Basic $env_todayist"

case "$1" in
"prompt")
  json="$(curl -H "$token" "$url/api/tasks" 2>/dev/null)"

  overdues="$(echo $json | jq '.OverduedTasks | map(. | select(.Completed|not)) | length' )"
  today="$(echo $json | jq '.TodayTasks | map(. | select(.Completed|not)) | length' )"
  
  echo "$overdues over, $today today"
  ;;

"tasks")
  json="$(curl -H "$token" "$url/api/tasks" 2>/dev/null)"
  
  printList 'Today' '.TodayTasks[]' 
  printList 'Overdue' '.OverduedTasks[]' 
  printList 'Future' '.UpcomingTasks[]' 

  ;;
"close")
  shift
  while (( "$#" )); do
    echo $1
    res=$(curl  -H "$token" "$url/api/tasks/done?id=$1" 2>/dev/null)
  
    if [ $res='"ok"' ];
    then
      echo "Done"
    else
      echo "Error"
    fi

    shift
  done

  ;;
"create")
  name=$(echo $2 | sed 's/ /%20/g')
  res=$(curl -H "$token" "$url/api/tasks/create?name=$name" 2>/dev/null)
  echo $res
esac

