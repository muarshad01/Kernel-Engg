#!/bin/bash

# ssh-add -k ~/.ssh/id_rsa

clear

git pull

git add .
git commit -m "update"
git push
