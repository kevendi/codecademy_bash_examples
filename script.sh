#!/bin/bash
echo $"Welcome to my script"
firstline=$(head -n1 "source/changelog.md")

read -a splitfirstline <<< $firstline

version=${splitfirstline[1]}
echo "Your are building version $version"

echo "Enter 1 to continue or 0 to exit"
read versioncontinue

if [ $versioncontinue -eq 1 ]
then
  echo "OK"
  for filename in source/*
  do
    if [ $filename == "source/secretinfo.md" ]
    then
      sed -i 's/42/XX/g' $filename
    fi
    cp $filename build
  done
  cd build
  echo "Buld version $version contains:"
  ls
  cd ..
else
  echo "Please come back when you are ready"
fi
