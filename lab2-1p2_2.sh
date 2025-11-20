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

system_clock() {
    LIST=(
        "hwclock"
        "hwclock -s"
        "date ; hwclock"
        "ln -sf /etc/localtime.bak /etc/localtime"
        "TZ=Africa/Lagos date"
    )

    echo
    echo "Check system_clock commands..."
    for cmd in "${LIST[@]}"
    do
        if grep -Fxq "$cmd" "$HISTFILE"; then
            echo "[FOUND] $cmd"
        else
            echo "[MISSING] $cmd"
        fi
    done
}

system_locales() {
    LIST=(
        "localectl"
        "echo $LANG"
        "locale"
        "locale -k LC_MONETARY"
        "locale -k LC_ADDRESS"
        "locale countrty_name"
        "locale height width"
        "LANG=en_ZM.utf8"
    )

    echo
    echo "Check system_clock commands..."
    for cmd in "${LIST[@]}"
    do
        if grep -Fxq "$cmd" "$HISTFILE"; then
            echo "[FOUND] $cmd"
        else
            echo "[MISSING] $cmd"
        fi
    done

    if $LANG == "en_US.utf8"; then
        echo "[FOUND] LANG=en_US.utf8"
    else
        echo "[MISSING] LANG=en_US.utf8"
    fi
}

dates
timezones
hongkong_time
system_clock
