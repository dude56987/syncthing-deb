#! /bin/bash
syncthing &
sleep 10
sed -i.bak 's/127.0.0.1:8080/localhost:7070/g' ~/.config/syncthing/config.xml
sed -i.bak 's/<startBrowser>true<\/startBrowser>/<startBrowser>false<\/startBrowser>/g' ~/.config/syncthing/config.xml
