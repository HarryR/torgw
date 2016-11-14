#!/bin/sh
env > /etc/envvars
echo "Running Runit"
exec /sbin/runsvdir -P /etc/sv
echo "Failed!"
