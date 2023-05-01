# 1. Write a Ruby or Bash script that will print usernames of all users on a Linux system together with their home directories. Here's some example output:

> gitlab:/home/gitlab

> nobody:/nonexistent

> .

> .

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

# check if the file /var/log/current_users.md5 exists, if it does not exist then we would convert the output of users.txt md5 hash via md5 checksum and this would go in the file /var/log/current_users.md5   

if [ ! -f /var/log/current_users.md5 ]; then
    md5sum users.txt > /var/log/current_users.md5
    exit 0
fi

# if the md5 file exist checks to see if the md5 checksum of "users.txt" is the same as the one in /var/log/current_users.md5, if matches the script terminates

md5sum -c /var/log/current_users.md5 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    exit 0
    
# if the md5 checksum of "users.txt" does not match then we print the Date and Time that the changes oocurred in a new file /var/log/user_changes.log and then the new hash of users.txt would be redirected to the file /var/log/current_users.md5

else
    echo "$(date +%Y-%m-%d\ %H:%M:%S) changes occurred" >> /var/log/user_changes.log
    md5sum users.txt > /var/log/current_users.md5
fi
```

Finally, write a crontab entry that runs these scripts hourly.
Provide both scripts and the crontab entry for the answer to be complete.

## Starting the Cronjob Service:
`sudo systemctl start cron`

Run the following command to check the status of our crontab service before we run the command to start the cron:

`sudo systemctl status cron`

Run the following command to open the crontab file so that we can add the job to make it run every hour:

`crontab -e`

Proceed to press `CTRL O` to edit the crontab file and add the following code:
the format for the crontab file to schedule the time is as follows:

Source: https://tecadmin.net/crontab-in-linux-with-20-examples-of-cron-schedule/#:~:text=Linux%20Crontab%20Syntax,31)%2C%20and%20so%20on.

` < Minute > < Hour > < Day_of_the_Month > < Month_of_the_Year > < Day_of_the_Week > < command > `

```
0 * * * * /Deskstop/userscript.sh && /Desktop/secondscript.sh
```

# 2. A user is complaining that it's taking a long time to load a page on our web application. In your own words, write down and discuss the possible cause(s) of the slowness. Also, describe how you would begin to troubleshoot this issue.
Keep the following information about the environment in mind:

* The web application is written in a modern MVC web framework.

* Application data is stored in a relational database.

* All components (web application, web server, database) are running on a single Linux box with 8GB RAM, 2 CPU cores, and SSD storage with ample free space.

* You have root access to this Linux box.

We are interested in learning about your experience with modern web applications, and your ability to reason about system design and architectural trade-offs. There are no right and wrong answers to this question. Feel free to write as much or as little as you feel is necessary.

# Answer

Causes of Slowness Based on Information Given:
 * The Relational Database might be experiencing network issues.
 * The architecture of the database is not meeting the standards of the MVC framework model of the web app; by poor design.
 * The web app is running on only two cores and 8 gb of rams; which could be too low to handle the high series of request made to the database, ultimately the memory utility is causing response from the web app to be too slow.
 * There are only two core specified for the web app which limits the amount of threads as requests coming through are only limited to two threads to handle.
 * Requests are failing to go through with 500 status error and this could build up and stop the app from responding to further requests.

How I would trouble shoot:

1. I would start out by trying to replicate the issue on my end by loading the web application on my local machine. If the the behavior is expected as reported by the user, this would indicate that the error is a global issue experienced by all users to this web app. If the issue is not reproducible on my end it would indicate that the issue might be on the client side and this would require further partnering with the user to troubleshoot. If the issue is an Global issue I would proceed internally via the following steps. 
2. Furthermore given that I have root access to the Linux box, I can try to log into the linux server and try to see how long it take to log me into or if logging into the server is stalled. Any signs of stalling would potentially point to high workload being passed on the server.
3. Going back to the low ram specs, I would check the linux box to make sure that there is sufficient ram for the web app. I can do this by running the htop command in the SSH terminal. This would allow me to view the number of proccessed running and to see if any are putting a strain on the storage. If I notice that certain processes are causing problems for the system, I can safely restart the Linux machine without disrupting any important traffic, as long as the system can restart smoothly. I am can also partner with members of the DevOps or teams in charge of infrasture to possibly increase strained resources and this can be brought about via and JIRA submission to the respective team. 
4. First, I would check if the memory usage and system load are not too high. Then, I would move on to checking the connection on the database by pinging it and observing how long it takes to get a response. This would give me an indication if there are any issues with the database connection.
5. If everything seems fine with the database connection, my next step would be to look at the application logs using the logging tools for the MVC web framework we're using. This would give me a clear idea of any errors that might be happening and where they could be originating from.

# 3. Study the Git commit graph shown below. What sequence of Git commands could have resulted in this commit graph?

![GitGraph!](https://raw.githubusercontent.com/NLe97/Gitlab-Tech-Assessment/main/Question%203%20Graph.png)

# Answer

We can see that initially the graph has two branches: one for the main branch and the other for the Feature Branch:

Based on the Git Commit Graph shown above I will show the the sequence of Git Commands the could have results in what is shown below:
Things to take into consideration is that the user has already added their git account as a part of the first commit: 

```
git config: git config-global user.name "[name]" -> This command set the username and the associated email that will be tied to the commits made further on.

# Initial the repository for the Git Project
git init 
```

First Commit Command Sequence:
```
#This adds files to the first commit of the Git Repo:
git add .

#Commits new files from stagging to the main branch with a message describing the commit:
git commit -m "Main: Initial implementation"

#This extra step is to set up an account and to add repository to Gitlab:
git remote add origin https://gitlab.com/<username>/gitlab.git
git push -u origin main: Push
```
Second Commit Command Sequence:
```
git add .
git commit -m "Main: second commit"
git push -u origin main
```
feature-branch:
```
git checkout -b feature-branch
git pull origin main

#Add new features
git add .
git commit -m "Feature-branch: Initial commit of first feature branch"
git push -u origin feature-branch
```
Third Commit Command Sequence:
```
git checkout main
#adding changes files and commiting them on main branch
git add .
git commit -m "Main: third commit changes made"
git push -u origin main
```
Merging feature-branch and main branch
```
git checkout feature-branch
git merge main
#Conflicts may arise here when trying to merge and so you can try to resolve via checking the repo files via and IDE such as VSCode or via the rebasing if the commits from each branch are not aligned in terms of time.
git add .
git commit -m "feature-branch: resolved conflicts, merge with main branch"
git push -u origin feature-branch
git merge main
```
Fourth Commit
```
#Going back to the main branch
git checkout main
#Changes are added to stagging and with the feature-branch content that was previously merged after the third commit
git add .git commit -m "Main Branch Fourth Commit"
git push -u origin main
```

# 4. GitLab has hired you to write a Git tutorial for beginners on: Using Git to implement a new feature/change without affecting the main branch. In your own words, write a tutorial/blog explaining things in a beginner-friendly way. 

Make sure to address both the "why" and "how" for each Git command you use. Assume the audience are readers of a well-known blog.

# Answer: 
> Source for Response: https://www.atlassian.com/git/glossary

# Topic: Using Git to implement a new feature/change without affecting the main branch 

:wave: Hello there and welcome to my tutorial on how to use Git to implement a new feature/change without affecting the main branch. 

* Before we jump into how to use Git, we need to understand why it's important to keep the main branch of our code stable. The main branch is the production stage of your code and is already deployed to your users. Any changes made can cause errors or cause potential instability for your users, making their experience bad. Thus we have to maitntain the stability of the main branch, and changes can be make on a separate branch. We are assumming here that we are working on a remote repository which is hosted of services such as Github or Gitlab.

:ok_hand: Now lets jump into how to use Git given what we know! 

# Step 1: Make a brand new branch for our changes:
* The work flow seen here is in assumption that we are working off of a remote repository on services such as Github or Gitlab.
* We need to first make a branch where our changes will occur and the command to do some is seen below:
```
git checkout -b feature-branch
```
I have created a new branch called "feature-branch" where I essentially checked out, so now any changes or commits made will go on this branch instead of the main branch.


# Step 2: Adding our changes/features to the new branch
* Now that we are on the new branch; we can go ahead and add any features that we want to implement to the repository or implement any changed to the exisitng code in the repo without affecting any codes/files on the production (main) branch 
```
git add . 
```
The git add command adds any files that have had any changes made within the 'feature-branch' that we are currently on

# Step 3: Commit our changes
* When we do a "git add" command, we are moving our changes or updated files within the repository to stagging. This would allow for us to then fully commit to the branch for the changes to occur.
```
git commit -m "Added a New Feature"
```
The commit command is usually followed by a message that we input in a string in order to clarify or remind others of what we are commiting here.

# Step 4: Push our new feature
* At this step we need to push our commited changes to our remote repository.
```
git push origin feature-branch
```
The push command pushes the changes to the 'feature-branch' on the remote repository.

# Step 5: Considering Merging :monocle_face:
After the changes have been pushed to the remote "feature-branch". We can go into discussion with the team to determine whether to merge the to the main branch or not. 

If the team considers merging the changes to the main branch, we can create a merge request and interact via the ui on whatever service the Remote Repo are hosted on whether that be Github or Gitlab

# 5. What is a technical book/blog you read recently that you enjoyed? Please include a brief review of what you especially liked or didn’t like about it.

> Article to Review: https://www.dice.com/career-advice/will-a.i.-doom-human-programmers

# Answer:
With the rise of ChatGPT the popular AI chatbot that could essentially do the impossible, I can see that there is essentially a lot of doom and gloom as to how this will apply to the future jobs of Software Engineering. The article titled " Will A.I. Doom Human Programmer" by David Bolton seem to show us a more balanced view on the matter as there are discussion of what the AI chatbot can do and also the things that takes a human touch to get done. 

I particularly liked the balanced views set in the article by David Bolton as he explains his own experience with working with Mircrosoft's experimental A.I. Intellicode and how it assisted him with coding by saving time via setting up boilerplate code; which he could work off of. Furthermore, the con presented with this next point is that A.I. can still create buggy code and this is to be taken as a cautionary insight for people solely relying on A.I. generated codes. The reason being AI chat bots such as ChatGPT can reiterate information even if they are false and thus we have to always make sure to check the output.

Additionally, I appreciated David's explanation of ANI and AGI models as it pertains to AI. ANI being defined as an AI model with "clearly defined functionality" where as the AGI model is what you would perceive in Sci-Fi movies with an example he provided being "Data: from Star Trek" which has reasoning and creating capabilities.

Furthermore, a point that I didn't like from the article was that David didn't provide any insight into how AI has the potential to revolutionize other areas of software development or that there was a lack of elaboration on this such as software testing and debugging with AI tools. 

Overall, the article presented a quick overview of the how AI can implement itself into the Software Engineering space but still has a long way to go before any profound effects would be made to the Software Engineering as a whole. This is due to the fact that software engineering goes beyond writing lines and lines of code but rather it expands to include other programming principles and complexitied that requires the human touch. Thus, in the future implementation of AI tools would serve to help software engineers rather than replace them. 




 

