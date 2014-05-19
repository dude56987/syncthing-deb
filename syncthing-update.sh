#! /bin/bash
if ps -e | grep syncthing; then
	killall syncthing
	syncthing -upgrade
fi
