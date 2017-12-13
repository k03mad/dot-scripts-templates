# remove all local merged branches
git branch -D `git branch --merged | grep -v \* | xargs`
# remove all local branches
git branch -D `git branch | grep -v \* | xargs`