make sure you are at local master branch

*to create a branch*

1)  
$git checkout -b "abc" #creating a branch on local machine (locally)
write ur code,......

$git add .
$git commit
i
insert ur commit message
esc
:wq!

2)
$git checkout master
$git pull origin master #in case my team member updated the github master branch
$git checkout abc
$git merge master
solve any conflicts if any

solved already, then now u can push to github.com
$git push origin abc # creating a branch called abc on github.com
goto github.com create pull request and merge pull request (make sure base fork is ur own repo not next academy repo)
$git check master
$git pull origin master


if i want to update the users login logout
$git checkout users_login_logout
edit the code,,,,,,,

repeat from 2)
