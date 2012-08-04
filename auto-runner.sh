# wp-updater-xfce
# Written by Aaron Blakely <aaron@ephasic.org>
#
# This code is public domain.  You can do whatever
# you want with it.

. /etc/wp-updater.conf

if [ -a /tmp/wp-updater.lock ]; then
	echo "WP updater already running..." >> /dev/null	# he he
else
	bash $RUNDIR/wp-updater.sh &
	touch /tmp/wp-updater.lock
fi
