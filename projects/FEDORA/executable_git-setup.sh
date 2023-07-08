#!/bin/bash
#
project=$(basename `pwd`)
githubdir="hcarter1112"
echo "-----------------------------------------------------------------------------"
echo "this is project https://github.com/$githubdir/$project"
echo "-----------------------------------------------------------------------------"

git config --global pull.rebase false
	git config --global push.default simple
	git config --global user.name "hcarter1112"
	git config --global user.email "hcarter1112@gmail.com"
	sudo git config --system core.editor vim
	#git config --global credential.helper cache
	#git config --global credential.helper 'cache --timeout=32000'
  git remote set-url origin git@github.com:$githubdir/$project
  echo
  echo "Everything set"
