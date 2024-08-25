#!/bin/bash
set -e
useragent="https://github.com/satanicantichrist/ (satanciantichrist1@protonmail.com)"
#Checks if server file exists
if [[ $1 == "" ]]
then
	if ! [ -e version.json ]
	then
		echo "Server version missing, nothing to update. To download it, specify the game version."
		exit 1
	fi
	mcversion=$(jq '.minecraft' ./version.json | cut -d "\"" -f 2)
	prversion=$(jq '.paper' ./version.json)
	echo Current minecrat version $mcversion
	echo Current Paper version $prversion

	echo Fetching newest Paper version...
	paperdata=$(curl -s https://api.papermc.io/v2/projects/paper/versions/$mcversion/builds)
	nprversion=$(echo $paperdata | jq '[.builds.[].build] | max')
	if [[ $prversion -ge $nprversion ]]
	then
		echo You already have the newest version of Paper.
		exit 0
	fi
	
	echo New version of Paper found, downloading...
	curl -s https://api.papermc.io/v2/projects/paper/versions/$mcversion/builds/$nprversion/downloads/paper-$mcversion-$nprversion.jar -o ./server.jar
	echo "{\"minecraft\": \""$mcversion"\",\"paper\": "$nprversion"}" > version.json
	exit 0
else
	mcversion=$1
	echo Fetching newest Paper version "for" Minecraft $mcversion...
	paperdata=$(curl -s https://api.papermc.io/v2/projects/paper/versions/$mcversion/builds)
	nprversion=$(echo $paperdata | jq '[.builds.[].build] | max')
	echo Downloading Paper...
	curl -s https://api.papermc.io/v2/projects/paper/versions/$mcversion/builds/$nprversion/downloads/paper-$mcversion-$nprversion.jar -o "./server.jar"
	echo "{\"minecraft\": \""$mcversion"\",\"paper\": "$nprversion"}" > version.json
	exit 0
fi