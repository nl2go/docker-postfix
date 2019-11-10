#!/bin/ash
set -e

function applyMainConfig(){
  for file in /etc/postfix/main.cf.d/*.cf; do
    [ -f "$file" ] || continue
    while read -r line; do
      if (printf "%s" "$line" | grep -qE '^[a-z]'); then
        postconf -e "$line"
      fi
    done < "$file"
  done
}

applyMainConfig

if [ "$1" = 'postfix' ]; then
  exec postfix start-fg
else
  postfix start
  exec "$@"
fi

