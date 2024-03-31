#!/bin/bash


# rsync is not used because I can't install stuff on one of the machines I work on, but I plan to use that eventually...
# Not sure if the notify command will work when running in the background as a daemon... will have to test it...


# Finding roots
PWDir="$(pwd)"
cd $(cd "$(dirname "$0")"; pwd -P)
OwnDir="$(pwd)"
cd "$PWDir"



IPAddress=${1}
if [[ -z ${2} ]]
then
  User=$USER
else
  User=${2}
fi



# Function to send notification
#SendNotification ()
#{
#  sudo -u ${User} notify-send -u critical -t 5000 "Wormhole" "$1"
#}



# Check if rsync is installed, and install it if necessary
#if [[ ! command -v rsync &> /dev/null ]]
#then
#  echo "rsync not installed"
#  sudo apt-get -y install rsync
#fi

if [[ ! -d "${OwnDir}/Outgoing-WH" ]]
then
  mkdir "${OwnDir}/Outgoing-WH"
fi

if [[ ! -d "${OwnDir}/Incoming-WH" ]]
then
  mkdir "${OwnDir}/Incoming-WH"
fi

while true
do
  if ping -c 1 ${IPAddress} &> /dev/null
  then
    if [[ "$(ls -A "${OwnDir}/Outgoing-WH")" ]]
    then
#      rsync -avz --remove-source-files -e ssh "${OwnDir}/Outgoing-WH"/ ${User}@${IPAddress}:"~/HexaTools/Wormhole/Incoming-WH"
      scp -r "${OwnDir}/Outgoing-WH"/* ${User}@${IPAddress}:"~/HexaTools/Wormhole/Incoming-WH"
      rm -r "${OwnDir}/Outgoing-WH"/*
    fi
  fi
  sleep 1
done
