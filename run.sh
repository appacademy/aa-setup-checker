#!/usr/bin/env bash -l

if [ -d $HOME/.aa-setup-checker ]; then
   cd ~/.aa-setup-checker
   git pull --rebase
   ./check.sh
   cd -
   exit 0;
fi

mkdir $HOME/.aa-setup-checker
git clone https://github.com/bartdorsey/aa-setup-checker.git ~/.aa-setup-checker

cd ~/.aa-setup-checker
./check.sh
cd -
