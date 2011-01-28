#!/bin/bash
# It's a small bash script that helps you detect and remove fookies on Mac OS X & Linux ( tested on Ubuntu only )
os=`uname`
if [ $os == "Darwin" ]; then
  fookieLocation="$HOME/Library/Preferences/Macromedia/Flash Player"
elif [ $os == "Linux" ]; then
  fookieLocation="$HOME/.macromedia/Flash_Player/#SharedObjects"
else
  echo "We dont support your OS: $os"
fi

read -p "We are going to remove all the fookies in '$fookieLocation/.../*.sol' [Y/n] " choice

if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
  echo "Deleting ..."
  IFS=$'\n'
  Array=(`find "$fookieLocation" | grep ".sol"`)
  for i in ${Array[@]}
  do
    echo `rm -rfv $i`
  done
  echo "Found ${#Array[@]} sol(s) and deleted"
else
  echo "bye"
fi
