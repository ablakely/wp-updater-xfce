# wp-updater-xfce
# Written by Aaron Blakely <aaron@ephasic.org>
#
# This code is public domain.  You can do whatever
# you want with it.

RUNDIR="$HOME/.wp-updater/"		# Directory which this script is ran from
MONITOR_COUNT=2				# The count of monitors.
IMGDIR="$HOME/Pictures/wallpapers"	# Directory where the images are.
INTTIME="15m"				# sleep(1) paramater

cd "$RUNDIR"
while [ 1 ]; do
	for ((i=0; i < $MONITOR_COUNT; i++)); do
		echo `ls -d -1 ${IMGDIR}/**` > /tmp/listu.tmp	# Get the image list

		# As far as I can tell, this next line is required...  Or I was doing something wrong before.
		echo "# xfce backdrop list" > /tmp/list.tmp
		tr ' ' '\n' < /tmp/listu.tmp >> /tmp/list.tmp		# Replace spaces with newlines
		IMG_PATH="/tmp/list.tmp"

		xfconf-query -c xfce4-desktop -p "/backdrop/screen0/monitor${i}/image-path" -s ""		# Clear the current list
		xfconf-query -c xfce4-desktop -p "/backdrop/screen0/monitor${i}/image-path" -s "${IMG_PATH}"	# Load the new one
	done

	sleep $INTTIME
done

