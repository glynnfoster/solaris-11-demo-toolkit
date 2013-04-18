#!/usr/bin/perl -w

use Term::ANSIColor;
use Term::ANSIColor qw(:constants);
use lib 'scripts';
use demotools;

require "scripts/demo-common.pl";

print RESET;
system("clear");


print $STORY_COL, "In this demo we are going to demonstrate network resource management\n";
print $STORY_COL, "using virtual networking capabilities of Solaris 11.\n";
print $STORY_COL, "We assume that there is at least one zone, zone1 already configured\n";
print $STORY_COL, "and installed in the system. Let's check:\n";
print $CMD_COL;
demotools::cmd("zoneadm list -cv");
print $STORY_COL, "If it's not the case, please stop this demo (Ctrl-C) and run demo\n";
print $STORY_COL, "scripts to create and install zone1.\n";
print $STORY_COL, "\n";
print $STORY_COL, "In the demo we will change the bandwidth of the zone1's network\n";
print $STORY_COL, "interface and measure transfer time of a big file.\n";
print $STORY_COL, "First, boot the zone and wait until it gets an IP address.\n";
print $CMD_COL;
demotools::cmd("zoneadm -z zone1 boot");
system("./wait4ip", "zone1", "vnic1");

print $STORY_COL, "What is our current bandwidth to zone1 via vnic1?\n";
print $CMD_COL;
demotools::cmd("dladm show-vnic");
print $STORY_COL, "We've got 1 Gigabit/s.\n";
print $STORY_COL, "We have a pretty large file in our Java runtime library:\n";
print $CMD_COL;
demotools::cmd("ls -lh /usr/java/jre/lib/rt.jar");
print $STORY_COL, "Let's copy it to the zone1\n";
print $STORY_COL, "Remember: zuser1\'s password is oracle1\n";
print $CMD_COL;
demotools::cmd("scp /usr/java/jre/lib/rt.jar zuser1\@10.0.2.21:/var/tmp");
print $STORY_COL, "Note how many seconds it took to transfer the file (should\n";
print $STORY_COL, "be around 3-6 seconds)\n";
print $STORY_COL, "Now change the vnic1\'s bandwidth:\n";
print $CMD_COL;
demotools::cmd("dladm set-linkprop -p maxbw=10 vnic1");
print $STORY_COL, "...and try to copy the file again:\n";
print $CMD_COL;
demotools::cmd("scp /usr/java/jre/lib/rt.jar zuser1\@10.0.2.21:/var/tmp");
print $STORY_COL, "Did you notice the difference?\n";
print $STORY_COL, "\n";
print $STORY_COL, "Double the bandwidth and copy the file again:\n";
print $CMD_COL;
demotools::cmd("dladm set-linkprop -p maxbw=20 vnic1");
print $CMD_COL;
demotools::cmd("scp /usr/java/jre/lib/rt.jar zuser1\@10.0.2.21:/var/tmp");
print $STORY_COL, "Double the bandwidth again:\n";
print $CMD_COL;
demotools::cmd("dladm set-linkprop -p maxbw=40 vnic1");
print $CMD_COL;
demotools::cmd("scp /usr/java/jre/lib/rt.jar zuser1\@10.0.2.21:/var/tmp");
print $STORY_COL, "Doubling the bandwidth again most likely will get you the\n";
print $STORY_COL, "same transfer speed as with your initial (maximum) bandwidth.\n";
print $STORY_COL, "Please explain.\n";
print $STORY_COL, "\n";
demotools::wait4enter;

print $STORY_COL, "Try to repeat this exercise on your own hardware. Bare metal performance\n";
print $STORY_COL, "results might be different.\n";
print $STORY_COL, "\n";
print $STORY_COL, "This concludes Network Resource Management demo.\n";
demotools::wait4enter;



print RESET;
