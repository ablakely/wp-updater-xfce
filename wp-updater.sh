# wp-updater-xfce
# Written by Aaron Blakely <aaron@ephasic.org>
#
# This code is public domain.  You can do whatever
# you want with it.

RUNDIR=".wp-updater/"	# Directory which this script is ran from
MONITOR_COUNT=1		# The count of monitors, starting at 0.
IMGDIR="~/Pictures/wp"	# Directory where the images are.
INTTIME="15m"		# sleep(1) paramater

cd "$RUNDIR"


while [ 1 ]; do
	for ((i=0; i < MONITOR_COUNT; i++)); do
		echo `ls -d -1 ${IMGDIR}/**` > listu.tmp	# Get the image list

		# As far as I can tell, this next line is required...  Or I was doing something wrong before.
		echo "# xfce backdrop list" > list.tmp
		tr ' ' '\n' < listu.tmp >> list.tmp		# Replace spaces with newlines
		IMG_PATH="`pwd`/list"

		xfconf-query -c xfce4-desktop -p "/backdrop/screen0/monitor${i}/image-path" -s ""		# Clear the current list
		xfconf-query -c xfce4-desktop -p "/backdrop/screen0/monitor${i}/image-path" -s "${IMAGE_PATH}"	# Load the new one

		rm listu.tmp list.tmp	# cleanup the tmp files
	done

	sleep $INTTIME
done

