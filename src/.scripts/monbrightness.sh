#! /bin/bash
COMMANDS="up down"
BRIGHTNESS=$(xrandr --verbose | grep -i brightness | cut -f2 -d ' ' | head -n1 );
MONITOR=$(xrandr -q | grep " connected" | awk '{print $1;}');
ARG="$1";
 #| sed 's/^0//g'
if ! [[ ${COMMANDS[@]} =~ $ARG ]]; then
    echo "Wrong args; only 'up' and 'down' are allowed"
    exit 1
fi

if [[ $ARG == "up" && "$BRIGHTNESS" != "1.0" ]]; then
    NEW=$(echo $BRIGHTNESS | sed 's/\.//g' | sed 's/^0//g')
    NEW=$(($NEW + 10))
    if [[ $NEW -lt 100 ]]; then
        NEW=$(echo $NEW | sed -r -e 's/^.{0}/&0\./')
    else
        NEW=$(echo $NEW | sed -r -e 's/^.{1}/&\./')
    fi
    echo "Increasing brightness to $NEW"
    xrandr --output $MONITOR --brightness $NEW
elif [[ $ARG == "down" && $BRIGHTNESS != "0.0" ]]; then
    NEW=$(echo $BRIGHTNESS | sed 's/\.//g' | sed 's/^0//g')
    if [[ $BRIGHTNESS == "1.0" ]]; then
        NEW=$(($NEW - 1))
    else
        NEW=$(($NEW - 10))
    fi
    NEW=$(echo $NEW | sed -r -e 's/^.{0}/&0\./')
    echo "Lowering brightness to $NEW"
    xrandr --output $MONITOR --brightness $NEW
fi
