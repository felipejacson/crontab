#!/bin/sh
set -e
crond -s /var/spool/cron/crontabs -b -L /var/log/cron/cron.log "$@" && tail -f /var/log/cron/cron.log