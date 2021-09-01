#!/bin/bash
systemctl disable --now mylar
rm -rf /opt/Mylar
rm -rf /opt/.venv/mylar
rm -rf /install/.mylar.lock

if ask "Would you like to purge the config?"; then
    :
    rm -rf /home/$(swizdb get mylar/owner)/.config/Mylar
    swizdb clear mylar/owner
    swizdb clear mylar/port
else
    : # no condition
    exit 0
fi