show:
	echo 'Run "make install" as root to install program!'
run:
	syncthing
install: build
	sudo gdebi --non-interactive syncthing_UNSTABLE.deb
uninstall:
	sudo rm /usr/bin/syncthing
build: 
	sudo make build-deb;
build-deb:
	mkdir -p debian;
	mkdir -p debian/DEBIAN;
	mkdir -p debian/usr;
	mkdir -p debian/usr/bin;
	mkdir -p debian/usr/share;
	mkdir -p debian/usr/share/applications;
	mkdir -p debian/etc;
	mkdir -p debian/etc/xdg;
	mkdir -p debian/etc/xdg/autostart;
	# make post and pre install scripts have the correct permissions
	chmod 775 debdata/*
	# copy over the binary
	cp -vf syncthing ./debian/usr/bin/syncthing
	cp -vf syncthing-update.sh ./debian/usr/bin/syncthing-update
	cp -vf syncthing-launcher.sh ./debian/usr/bin/syncthing-launcher
	cp -vf syncthing-autostart.sh ./debian/usr/bin/syncthing-autostart
	# copy over the launcher
	cp -vf syncthing.desktop ./debian/usr/share/applications/syncthing.desktop
	cp -vf syncthing-autostart.desktop ./debian/etc/xdg/autostart/syncthing-autostart.desktop
	# make the program executable
	chmod +x ./debian/usr/bin/syncthing
	chmod +x ./debian/usr/bin/syncthing-update
	chmod +x ./debian/usr/bin/syncthing-launcher
	chmod +x ./debian/usr/bin/syncthing-autostart
	# Create the md5sums file
	find ./debian/ -type f -print0 | xargs -0 md5sum > ./debian/DEBIAN/md5sums
	# cut filenames of extra junk
	sed -i.bak 's/\.\/debian\///g' ./debian/DEBIAN/md5sums
	sed -i.bak 's/\\n*DEBIAN*\\n//g' ./debian/DEBIAN/md5sums
	sed -i.bak 's/\\n*DEBIAN*//g' ./debian/DEBIAN/md5sums
	rm -v ./debian/DEBIAN/md5sums.bak
	cp -rv debdata/. debian/DEBIAN/
	chmod -Rv go+r debian/
	# figure out the package size	
	du -sx --exclude DEBIAN ./debian/ > Installed-Size.txt
	# build the package
	dpkg-deb --build debian
	cp -v debian.deb syncthing_UNSTABLE.deb
	rm -v debian.deb
	rm -rv debian
