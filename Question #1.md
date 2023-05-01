# 1. Write a Ruby or Bash script that will print usernames of all users on a Linux system together with their home directories. Here's some example output:

gitlab:/home/gitlab

nobody:/nonexistent

.

.

Each line is a concatenation of a username, the colon character (:), and the home directory path for that username. Your script should output such a line for each user on the system.
```
#!/usr/bin/bash
getent passwd | cut -d ':' -f 1,6 > users.txt
```

# Next, write a second script that:

  * Takes the full output of your first script and converts it to an MD5 hash.

  * On its first run stores the MD5 checksum into the /var/log/current_users file.

  * On subsequent runs, if the MD5 checksum changes, the script should add a line in the /var/log/user_changes file with the message, DATE TIME changes occurred, replacing DATE and TIME with appropriate values, and replaces the old MD5 checksum in /var/log/ current_users file with the new MD5 checksum.

```
#!/usr/bin/bash

# check if the file /var/log/current_users.md5 exists, if it does not exist then we would convert the output of users.txt to md5 checksum of the file "users.txt" to the file /var/log/current_users.md5   
if [ ! -f /var/log/current_users.md5 ]; then
    md5sum users.txt > /var/log/current_users.md5
    exit 0
fi

# if the md5 file exist checks to see if the md5 checksum of "users.txt" is the same as the one in /var/log/current_users.md5, if matches the script exits
md5sum -c /var/log/current_users.md5 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    exit 0
# if the md5 checksum of "users.txt" does not match then we print the Date and Time that the changes oocurred in a new file /var/log/user_changes.log
else
    echo "$(date +%Y-%m-%d\ %H:%M:%S) changes occurred" >> /var/log/user_changes.log
    md5sum users.txt > /var/log/current_users.md5
fi
```

Finally, write a crontab entry that runs these scripts hourly.
Provide both scripts and the crontab entry for the answer to be complete.
