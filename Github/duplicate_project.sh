#!/bin/bash
# Copy Project that already has a potential git repo
# and create a new repo under a different name,
# make an initial commit,
# and open in the browser.

# This script takes 4 arguments.
# 1 = the original project to copy
# 2 = the name of the new project
# 3 = Github Username
# 4 = Github Password

cp -r "$1" "$2"
cd "$2"
del .git
git init
repo_name="$2"
username="$3"
password="$4"
curl "${$username:$password}" https://api.github.com/usr/repos -d '{"name":"'$repo_name'"}' > /dev/null 2>&1
git remote add origin https://github.com/$username/$repo_name.git
git add .
git commit -m 'initial commit'
git push -u origin master
open https://github.com/$username/$repo_name.git
ls -aFGh
