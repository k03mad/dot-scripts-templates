#!/bin/bash

# remove all local branches
git branch -D "$(git branch | grep -v \* | xargs)"
