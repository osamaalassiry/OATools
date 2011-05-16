# OATools

## Introduction
This is a collection of scripts that I use on my Linux machines. I license these scripts as GPLv3 (refer to the file COPYING)

## The Scripts
I would classify them in categories:

### Qatar
Scripts related to Qatar, the frequency (daily, weekly) is controlled in crontab.
qatarnewspapers: Sends a daily email containing links to the pdf files of Arabic newspapers from Qatar.
qatarmovies: Sends a weekly email of the movie times.

### Filenames
Scripts to fix filenames.
fixarabicfilename: Change the codepage of filenames from cp1256 to UTF8
fixarabicnumfilename: Change the numbers in files from unicode "Hindi" numbers to normal Arabic number.
fixext: Fix the extensions of files depending on the content of the file.

### Utils
rs: custom rsync command
run: run a command in the background, hiding output and errors.
csv2mysql: creates an SQL script to create a table and insert all the rows. The first row should have the field names.
### GPS
flight2coords: retreives the location of a flight from a website.
garmin2kml: gets the waypoints stored in a Garmin GPS device and stores in a KML file.
gpx2kml: converts waypoint files from GPX to KML.
kml2garmin: puts the waypoints stored in a KML file into a Garmin GPS device.

### Get
Get from the internet
getytpls: gets all the videos in a Youtube playlist.
getsite: mirrors a website.

### Audio
m4b2mp3all: converts all m4b files into mp3.
rm2mp3: converts real media rm files into mp3 (audio).
mp3ize: converts any file into mp3 (audio)
mp3merge: merges multiple mp3 files into one.
whitenoise: generates white noise.

### Compressed
These scripts deal with compressed files.

rarmaxdel: creates a RAR file containing the files at maximum compression, and deletes them.
unrarall: unrar all the files given to it.
unzipall: unzips all the files given to it.



