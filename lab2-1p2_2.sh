#!/bin/bash

# From step 15

HISTFILE="${HOME}/.bash_history"

dates() {
    LIST=(
        "date"
        "date -u"
        "date -r anaconda-ks.cfg"
        "date +\"%q %j\""
        "date +%Z"
    )

    echo
    echo "Check date commands..."
    for cmd in "${LIST[@]}"
    do
        if grep -Fxq "$cmd" "$HISTFILE"; then
            echo "[FOUND] $cmd"
        else
            echo "[MISSING] $cmd"
        fi
    done
}

timezones() {
    LIST=(
        "timedatectl status"
        "timedatectl show"
        "timedatectl list-timezones"
        "timedatectl set-timezone Asia/Hong_Kong"
    )

    echo
    echo "Check timedatectl commands..."
    for cmd in "${LIST[@]}"
    do
        if grep -Fxq "$cmd" "$HISTFILE"; then
            echo "[FOUND] $cmd"
        else
            echo "[MISSING] $cmd"
        fi
    done
}

hongkong_time() {
	if timedatectl show -p Timezone|grep -q Hong; then
		echo "[FOUND] Hong Kong TimeZone"
	else
		echo "[MISSING] Hong Kong Timezone not found"
	fi
}

#dates
#timedatectl
hongkong_time
