# 4. GitLab has hired you to write a Git tutorial for beginners on: Using Git to implement a new feature/change without affecting the main branch. In your own words, write a tutorial/blog explaining things in a beginner-friendly way. 

Make sure to address both the "why" and "how" for each Git command you use. Assume the audience are readers of a well-known blog.

# Answer: Source for Response: https://www.atlassian.com/git/glossary

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
