#!/usr/bin/env sh

languages=$(echo "golang ruby rust javascript typescript python" | tr " " "\n")
core_utils=$(echo "find sed awk grep docker" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "?>" query

if echo "$languages" | grep -qs $selected; then
	tmux split-window -h -p 35 bash -c "curl cht.sh/$selected/$(echo $query | tr " " "+") 2>/dev/null | less -R"
else
	tmux split-window -h -p 35 bash -c "curl cht.sh/$selected~$query 2>/dev/null | less -R"
fi
