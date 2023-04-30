1. Write a Ruby or Bash script that will print usernames of all users on a Linux system together with their home directories. Here's some example output:

gitlab:/home/gitlab

nobody:/nonexistent

.

.

Each line is a concatenation of a username, the colon character (:), and the home directory path for that username. Your script should output such a line for each user on the system.
Next, write a second script that:

  ● Takes the full output of your first script and converts it to an MD5 hash.

  ● On its first run stores the MD5 checksum into the /var/log/current_users file.

  ● On subsequent runs, if the MD5 checksum changes, the script should add a line in the /var/
  
log/user_changes file with the message, DATE TIME changes occurred, replacing DATE and TIME with appropriate values, and replaces the old MD5 checksum in /var/log/ current_users file with the new MD5 checksum.

Finally, write a crontab entry that runs these scripts hourly.
Provide both scripts and the crontab entry for the answer to be complete.
