#!/bin/bash
if [[ -f /etc/dnf/dnf.conf ]]
then
  cp /etc/dnf/dnf.conf /etc/dnf/dnf.conf.bak &&
  cp dnf.conf /etc/dnf/dnf.conf
fi
dnf update &&
reboot
