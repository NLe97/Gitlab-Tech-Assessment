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
