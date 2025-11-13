#!/bin/bash

HISTFILE="${HOME}/.bash_history"

network_cmd() {
    LIST=(
        "ifconfig"
        "ifconfig -a enp0s3"
        "ls -l /etc/sysconfig/network-scripts"
        "cat /etc/sysconfig/network-scripts/ifcfg-enp0s3"
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

network_cmd
