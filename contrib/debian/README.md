
Debian
====================
This directory contains files used to package noded/node-qt
for Debian-based Linux systems. If you compile noded/node-qt yourself, there are some useful files here.

## node: URI support ##


node-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install node-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your nodeqt binary to `/usr/bin`
and the `../../share/pixmaps/node128.png` to `/usr/share/pixmaps`

node-qt.protocol (KDE)

