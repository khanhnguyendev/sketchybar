#!/usr/bin/env zsh

IP=$(curl -s https://ipinfo.io/ip)
LOCATION_JSON=$(curl -s https://ipinfo.io/$IP/json)

LOCATION="$(echo $LOCATION_JSON | jq '.city' | tr -d '"')"
REGION="$(echo $LOCATION_JSON | jq '.region' | tr -d '"')"
COUNTRY="$(echo $LOCATION_JSON | jq '.country' | tr -d '"')"

# Line below replaces spaces with +
LOCATION_ESCAPED="${LOCATION// /+}+${REGION// /+}"
WEATHER_JSON=$(curl -s "https://wttr.in/$LOCATION_ESCAPED?format=j1")

# Fallback if empty
if [ -z "$WEATHER_JSON" ]; then
    sketchybar --set moon.logo icon=
    exit 0
fi

MOON_PHASE=$(echo $WEATHER_JSON | jq '.weather[0].astronomy[0].moon_phase' | tr -d '"')

case ${MOON_PHASE} in
"New Moon") ICON= ;;
"Waxing Crescent") ICON= ;;
"First Quarter") ICON= ;;
"Waxing Gibbous") ICON= ;;
"Full Moon") ICON= ;;
"Waning Gibbous") ICON= ;;
"Last Quarter") ICON= ;;
"Waning Crescent") ICON= ;;
*) ICON= ;; # Default icon if no match
esac

sketchybar --set moon.logo icon=$ICON 
