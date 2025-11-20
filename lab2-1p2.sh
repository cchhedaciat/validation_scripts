#!/bin/bash

# Until step 14

HISTFILE="${HOME}/.bash_history"

system_time() {
    LIST=(
        "ls /usr/share/zoneinfo"
        "file /etc/localtime"
        "cp /etc/localtime /etc/localtime.bak"
        "cat /usr/share/zoneinfo/America/Los_Angeles"
        "date +%Z"
        "timedatectl | grep \"Time zone\""
        "ln -sf /usr/share/zoneinfo/Europe/Vatican /etc/localtime"
        "restorecon /etc/localtime"
    )

    echo
    echo "Check Time Zone  commands..."
    for cmd in "${LIST[@]}"
    do
        if grep -Fxq "$cmd" "$HISTFILE"; then
            echo "[FOUND] $cmd"
        else
            echo "[MISSING] $cmd"
        fi
    done
}

vatican_time() {
	if timedatectl show -p Timezone|grep -q Vatican; then
		echo "[FOUND] Vatican TimeZone"
	else
		echo "[MISSING] Vatican Timezone not found"
	fi
}

system_time
vatican_time
