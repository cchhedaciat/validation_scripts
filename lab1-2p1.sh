#!/bin/bash

HISTFILE="${HOME}/.bash_history"

systemd_list_services() {
    LIST=(
        "ls /lib/systemd/system"
        "ls /etc/systemd/system"
        "systemctl list-units"
        "systemctl list-units --all"
        "systemctl list-units --type socket"
        "systemctl list-units --type service --state inactive"
    )

    echo
    echo "Check systemd list ..."
    for cmd in "${LIST[@]}"
    do
        if grep -Fxq "$cmd" "$HISTFILE"; then
            echo "[FOUND] $cmd"
        else
            echo "[MISSING] $cmd"
        fi
    done
}

systemd_modify_services() {
    MODIFY=(
        "sudo systemctl stop systemd-sysctl.service"
        "systemctl status systemd-sysctl.service"
        "sudo systemctl start systemd-sysctl.service"
        "systemctl is-active systemd-sysctl.service"
        "sudo systemctl restart systemd-sysctl.service"
        "sudo systemctl reload-or-restart systemd-sysctl.service"
        "systemctl list-unit-files"
        "sudo systemctl disable bluetooth.service"
        "sudo systemctl enable bluetooth.service"
        "sudo systemctl mask systemd-sysctl.service"
        "sudo systemctl unmask systemd-sysctl.service"
    )

    echo
    echo "Check systemd modify ..."
    for cmd in "${MODIFY[@]}"
    do
        if grep -Fxq "$cmd" "$HISTFILE"; then
            echo "[FOUND] $cmd"
        else
            echo "[MISSING] $cmd"
        fi
    done
}

systemd_isolate() {
    LIST=(
        "who -r"
        "systemctl get-default"
        "exit"
    )

    HISTFILE=~root/.bash_history

    echo
    echo "Check systemd isolate .."
    if journalctl |grep -q "systemctl isolate rescue.target"
    then
        echo "[FOUND] systemd isolate rescue.target"
    fi

    for cmd in "${LIST[@]}"
    do
        if grep -Fxq "$cmd" "$HISTFILE"; then
            echo "[FOUND] $cmd"
        else
            echo "[MISSING] $cmd"
        fi
    done
}

systemd_change_target() {
    CHANGE_TARGET=(
        "sudo systemctl set-default rescue.target"
        "systemctl cat rescue.target"
        "sudo systemctl reboot"
    )

    echo
    echo "Check systemd isolate .."
    if journalctl |grep -q "systemctl isolate rescue.target"
    then
        echo "[FOUND] systemd isolate rescue.target"
    fi

    for cmd in "${CHANGE_TARGET[@]}"
    do
        if grep -Fxq "$cmd" "$HISTFILE"; then
            echo "[FOUND] $cmd"
        else
            echo "[MISSING] $cmd"
        fi
    done

       if who -r|grep -q "run-level 5"
    then
        echo "[FOUND] sudo systemctl set-default graphical.target"
    fi
}

echo "Checking command history for lab commands:"
systemd_list_services
systemd_modify_services
systemd_isolate
systemd_change_target
