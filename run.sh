#!/bin/bash -l

if [ -d $HOME/.aa-setup-checker ]; then
   rm -rf $HOME/.aa-setup-checker
fi

mkdir $HOME/.aa-setup-checker
git clone -q https://github.com/appacademy/aa-setup-checker.git ~/.aa-setup-checker

cd ~/.aa-setup-checker
./check.sh
cd -
