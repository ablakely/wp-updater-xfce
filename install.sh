#!/bin/bash

if [ `whoami` == "root" ] && [ -n INSTALL_ROOT ]; then
	echo "Error: Detected running as root.  This is probably not what you want."
	echo "If you do mean to run this as root, use:"
	echo "INSTALL_ROOT=yes && ./install.sh"
	exit
fi


INSTALLDIR="${HOME}/.wp-updater"

if [ -a $INSTALLDIR ]; then
	echo "Error: It looks like wp-updater-xfce is already installed."
	echo "Abort mission!"
	exit
fi


mkdir $INSTALLDIR			# create the directory
cp wp-updater.sh "${INSTALLDIR}/"
cp auto-runner.sh "${INSTALLDIR}/"

chmod +x "${INSTALLDIR}/wp-updater.sh"
chmod +x "${INSTALLDIR}/auto-runner.sh"

# Copy the config file
sudo cp wp-updater.conf /etc/
sudo chmod 755 /etc/wp-updater.conf

# Append the auto runner script to the bashrc
if [ -a "${HOME}/.bashrc" ]; then
	echo "# wp-updater-xfce autorun" >> "${HOME}/.bashrc"
	echo ". ${INSTALLDIR}/auto-runner.sh" >> "${HOME}/.bashrc"
fi

#########

echo 'Done!  Make sure to edit /etc/wp-updater.conf'
