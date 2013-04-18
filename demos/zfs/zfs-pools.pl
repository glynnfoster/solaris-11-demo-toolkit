#!/usr/bin/perl -w


use Term::ANSIColor;
use Term::ANSIColor qw(:constants);
use lib 'scripts';
use demotools;

require "scripts/demo-common.pl";

system("clear");

print $STORY_COL, "The script shows basic ZFS commands with pools and file systems \n\n";
print $STORY_COL, "Let's start with looking at ZFS pools that available in our system\n";
print $CMD_COL;
demotools::cmd("zpool list");
print $STORY_COL, "Check the status of our root pool (rpool)\n";
print $CMD_COL;
demotools::cmd("zpool status rpool");
print $STORY_COL, "Let's create our own ZFS pool. We start with creating 10 fictious disk drives
in the /dev/dsk directory\n";
print $CMD_COL;
demotools::cmd("cd /dev/dsk; mkfile 200m disk{0..9}");
print $STORY_COL, "We'll take four disks and create a ZFS pool with RAID-Z protection\n";
print $CMD_COL;
demotools::cmd("zpool create labpool raidz disk0 disk1 disk2 disk3");
print $STORY_COL, "That was easy, wasn't it? And fast, too! Check our ZFS pools again\n";
print $CMD_COL;
demotools::cmd("zpool list");
print $STORY_COL, "Also check the status of our new ZFS pool\n";
print $CMD_COL;
demotools::cmd("zpool status labpool");
print $STORY_COL, "By the way, a filesystem was also automatically created and mounted\n";
print $CMD_COL;
demotools::cmd("zfs list labpool");
print $STORY_COL, "Do you need more space? Add more disks to the pool:\n";
print $CMD_COL;
demotools::cmd("zpool add labpool raidz disk4 disk5 disk6 disk7");
print $STORY_COL, "Check the pool's status again. Notice two separate groups of disks. 
They are called virtual devices, or vdevs\n";
print $CMD_COL;
demotools::cmd("zpool status labpool");
print $STORY_COL, "And check the available space in the filesystem again:\n";
print $CMD_COL;
demotools::cmd("zfs list labpool");
print $STORY_COL, "We can create another file system in this pool:\n";
print $CMD_COL;
demotools::cmd("zfs create labpool/data");
print $STORY_COL, "By default it will be mounted under /labpool.\n";
print $CMD_COL;
demotools::cmd("zfs list | grep labpool");
print $STORY_COL, "What if we want a new file system to be mounted somewhere else?\n";
print $CMD_COL;
demotools::cmd("zfs create -o mountpoint=/archive labpool/archive");
demotools::cmd("zfs list | grep labpool");
print $STORY_COL, "We have demonstrated basics ZFS operations with pools and filesystems. 
We recommend also watching other ZFS demos on compression, deduplication, snapshots and clones.
Even better, repeat these exercises on your own. Do Try This as Home!\n\n
Now it's time to clean up!\n";
system("zpool destroy labpool");
system("rm /dev/dsk/disk*");
print RESET;
