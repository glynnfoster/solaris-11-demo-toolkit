#!/usr/bin/perl -w


use Term::ANSIColor;
use Term::ANSIColor qw(:constants);
use lib 'scripts';
use demotools;

require "scripts/demo-common.pl";

system("clear");

print $STORY_COL, "The script shows how ZFS deduplication works\n\n";

print $STORY_COL, "First we create a 100 MB flat file to use it as our ZFS 'disk'\n";
print $CMD_COL;
        demotools::cmd("sudo mkfile 100m /dev/dsk/dedupdisk");
	demotools::cmd("ls -lh /dev/dsk/dedupdisk");
print $STORY_COL, "Create a ZFS pool like you normally would from that disk\n";
print $CMD_COL;
	demotools::cmd("sudo zpool create -f dpool dedupdisk");
print $STORY_COL, "Now turn on the dedup attribute\n";
print $CMD_COL;
	demotools::cmd("sudo zfs set dedup=on dpool");
print $STORY_COL, "Show how much space is available for the file system\n";
print $CMD_COL;
	demotools::cmd("zpool list dpool");
print $STORY_COL, "Now show that we have a 50MB file out there that we'll copy 
into our file system\n";
print $CMD_COL;
	demotools::cmd("ls -lh /usr/jdk/latest/jre/lib/rt.jar");
print $STORY_COL, "Copy the file, list the pool and show it's 50% used now\n";
print $CMD_COL;
	demotools::cmd("sudo cp /usr/jdk/latest/jre/lib/rt.jar /dpool/.");
	demotools::cmd("zpool list dpool");
print $STORY_COL, "Grab a second copy of that file, which would normally fill 
the 100MB file system to capacity\n";
print $CMD_COL;
	demotools::cmd("sudo cp /usr/jdk/latest/jre/lib/rt.jar /dpool/rt-1.jar");
print $STORY_COL, "But we see that little-to-no new storage is required because of dedup\n";
print $CMD_COL;
	demotools::cmd("zpool list dpool");
print $STORY_COL, "Repeat the process again and we show that we still are not using 
more space because of dedup\n";
print $CMD_COL;
	demotools::cmd("sudo cp /usr/jdk/latest/jre/lib/rt.jar /dpool/rt-2.jar");
	demotools::cmd("zpool list dpool");
print $STORY_COL, "Tear down the file system\n";
print $CMD_COL;
	demotools::cmd("sudo zpool destroy dpool");
        demotools::cmd("sudo rm /dev/dsk/dedupdisk");

