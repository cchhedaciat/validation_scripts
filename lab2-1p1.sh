#!/bin/bash

HISTFILE="${HOME}/.bash_history"

local_host() {
    if getent hosts | grep -q mysystem; then
        echo "[OK] mysystem found in /etc/hosts"
    else
        echo "[MISSING] mysystem not found in /etc/hosts"
    fi
}

name_resolution() {
    LIST=(
        "host vulnweb.com"
        "host -t ns vulnweb.com"
        "host -t cname vulnweb.com"
        "host -C vulnweb.com"
        "host -n -t mx vulnweb.com"
        "host -t txt vulnweb.com"
        "host vulnweb.com ns1.eurodns.com"
        "nslookup vulnweb.com"
        "nslookup 18.192.172.30"
        "nslookup -debug vulnweb.com"
    )

    echo
    echo "Check network commands..."
    for cmd in "${LIST[@]}"
    do
        if grep -Fxq "$cmd" "$HISTFILE"; then
            echo "[FOUND] $cmd"
        else
            echo "[MISSING] $cmd"
        fi
    done
}

local_host
name_resolution
