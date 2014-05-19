syncthing-deb
=============

####THIS PROJECT IS ONLY TO PACKAGE SYNCTHING AS A DEB PACKAGE####

Syncthing for ubuntu and linux mint in the form of a deb package.

Orignal Project can be found at the link below<br>
https://github.com/calmh/syncthing

This package uses a copy of the 32 bit binary from 
https://github.com/calmh/syncthing/releases/tag/v0.8.7
The program is setup to run the syncthing -upgrade command whenever the system is rebooted. The program also launches in the background for each user individually since syncthing stores each users settings seprately. 


- To build this package yourself download the source and run make build.
- To build and install it run make install
- If you just want a prebuilt package the link below will download the latest. 

###Download###
Package for Ubuntu and Linux Mint<br>
https://github.com/dude56987/syncthing-deb/blob/master/syncthing_UNSTABLE.deb?raw=true

NOTE: The _UNSTABLE is for the package itself syncthing should only upgrade to the newest stable version.
