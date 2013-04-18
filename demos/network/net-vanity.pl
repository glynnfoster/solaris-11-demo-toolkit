#!/usr/bin/perl -w

use Term::ANSIColor;
use Term::ANSIColor qw(:constants);
use lib 'scripts';
use demotools;

require "scripts/demo-common.pl";

system("clear");


print $STORY_COL, "In this demo we show how you can name your interface with any name you want\n";
print $STORY_COL, "We start with switching to the manual mode:\n";
print $CMD_COL;
demotools::cmd("netadm enable -p ncp DefaultFixed");

print $STORY_COL, "Show our current devices\n";
print $CMD_COL;
demotools::cmd("dladm show-phys");
print $CMD_COL;
demotools::cmd("ipadm show-addr");
print $STORY_COL, "We now decide to rename net0 to foo1. Start by deleting the net0 IP interface\n";
print $CMD_COL;
demotools::cmd("ipadm delete-ip net0");
print $STORY_COL, "...now rename the NIC\n";
print $CMD_COL;
demotools::cmd("dladm rename-link net0 foo1");
print $CMD_COL;
demotools::cmd("dladm show-phys");
print $STORY_COL, "Add back in the IP interface\n";
print $CMD_COL;
demotools::cmd("ipadm create-ip foo1");
print $STORY_COL, "And put it under DHCP control like ti was\n";
print $CMD_COL;
demotools::cmd("ipadm create-addr -T dhcp foo1/dhaddr");
print $CMD_COL;
demotools::cmd("ipadm show-addr");
print $STORY_COL, "Cleaning up... Undo it all\n";
print $CMD_COL;
demotools::cmd("ipadm delete-ip foo1");
print $CMD_COL;
demotools::cmd("dladm rename-link foo1 net0");
print $CMD_COL;
demotools::cmd("ipadm create-ip net0");
print $CMD_COL;
demotools::cmd("ipadm create-addr -T dhcp net0/dhaddr");
print $CMD_COL;
demotools::cmd("ipadm show-addr");
print $STORY_COL, "Let's switch back to the Automatic network profile:\n";
print $CMD_COL;
demotools::cmd("netadm enable -p ncp Automatic");

print $STORY_COL, "Now you can create interface names you want! No more bge0, e1000g0 etc.\n";
print RESET;
