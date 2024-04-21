#! /usr/bin/zsh
{jj st --color always | grep -vE "(Working|Parent)"} && echo "\n========\n" && jj log --color always
