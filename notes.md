### Reminder for how to commit updated files to git

- git status: Shows the updated files to be committed
- git add --all: Puts the edited files in a staging area
- To unstage a file, use 'git reset HEAD YOUR-FILE'.
- git commit -m "Add existing file". Commits the files with a message. Commits the tracked changes and prepares them to be pushed to a remote repository. To remove this commit and modify the file, use 'git reset --soft HEAD~1' and commit and add the file again.
- $ git push origin YOUR_BRANCH: YOUR_BRANCH is usually main or master. This command pushes the changes in your local repository up to the remote repository you specified as the origin.
