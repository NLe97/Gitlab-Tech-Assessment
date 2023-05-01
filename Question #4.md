# 4. GitLab has hired you to write a Git tutorial for beginners on: Using Git to implement a new feature/change without affecting the main branch. In your own words, write a tutorial/blog explaining things in a beginner-friendly way. 

Make sure to address both the "why" and "how" for each Git command you use. Assume the audience are readers of a well-known blog.

# Answer

# Topic: Using Git to implement a new feature/change without affecting the main branch 

:wave: Hello there and welcome to my tutorial on how to use Git to implement a new feature/change without affecting the main branch. 

* Before we jump into how to use Git we need to understand why it's important to keep the main branch of our code stable. The main branch is the production stage of your code and is already deployed to your users. Any changes made can cause errors or cause potential instability for your users, making their experience worse. Thus we have to maitntain the stability of the main branch, and changes can be make on a separate branch.

:ok_hand: Now let jump into how to use Git given what we know! 

# Step 1: Make a brand new branch for our changes:
* We need to first make a branch where our changes will occur and the command to do some is seen below:
```
git checkout -b feature-branch
```
I have created a new branch called "feeature-branch" where I essentially checked out so now any changes or commits made will go on this branch instead of the main branch


