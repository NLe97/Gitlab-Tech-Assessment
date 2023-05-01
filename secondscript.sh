#!/usr/bin/bash

if [ ! -f /var/log/current_users.md5 ]; then
    md5sum users.txt > /var/log/current_users.md5
    exit 0
fi

md5sum -c /var/log/current_users.md5 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    exit 0
else
    echo "$(date +%Y-%m-%d\ %H:%M:%S) changes occurred" >> /var/log/user_changes.log
    md5sum users.txt > /var/log/current_users.md5
fi
