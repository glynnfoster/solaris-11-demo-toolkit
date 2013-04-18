#!/usr/bin/perl -w

use Term::ANSIColor;
use Term::ANSIColor qw(:constants);
use lib 'scripts';
use demotools;

require "scripts/demo-common.pl";

system("clear");


print $STORY_COL, "In this demo we will show new Solaris 11 networking commands.\n";
print $STORY_COL, "The main difference from Solaris 10 is that new networking commands are persistent,\n";
print $STORY_COL, "that means all changes will sustain the reboot.\n";
print $STORY_COL, "\n";
print $STORY_COL, "First, we show how to configure network in manual mode.\n";
print $STORY_COL, "We start with switching to the manual mode:\n";
print $CMD_COL;
demotools::cmd("netadm enable -p ncp DefaultFixed");
print $STORY_COL, "Show physical network interfaces:\n";
print $CMD_COL;
demotools::cmd("dladm show-phys");
print $STORY_COL, "Create an interface with static IPv4 address:\n";
print $CMD_COL;
demotools::cmd("ipadm delete-ip net0");
print $CMD_COL;
demotools::cmd("ipadm create-ip net0");
print $CMD_COL;
demotools::cmd("ipadm show-if");
print $CMD_COL;
demotools::cmd("ipadm create-addr -T static -a local=10.9.8.7/24 net0/addr");
print $CMD_COL;
demotools::cmd("ipadm show-addr");
print $STORY_COL, "Create an interface and get the address from DHCP\n";
print $CMD_COL;
demotools::cmd("ipadm delete-ip net0");
print $CMD_COL;
demotools::cmd("ipadm create-ip net0");
print $CMD_COL;
demotools::cmd("ipadm create-addr -T dhcp net0/addr");
print $CMD_COL;
demotools::cmd("ipadm show-addr");
print $STORY_COL, "Create an interface with auto-generated IPv6 configuration:\n";
print $CMD_COL;
demotools::cmd("ipadm delete-ip net0");
print $CMD_COL;
demotools::cmd("ipadm create-ip net0");
print $CMD_COL;
demotools::cmd("ipadm create-addr -T addrconf net0/addr");
print $CMD_COL;
demotools::cmd("ipadm show-addr");
print $STORY_COL, "Configure the default route\n";
print $CMD_COL;
demotools::cmd("route -p add default 192.168.1.1");
print $STORY_COL, "Activate DNS configuration:\n";
print $CMD_COL;
demotools::cmd("svccfg -s dns/client \'setprop config/nameserver = net_address: 192.168.1.1\'");
print $CMD_COL;
demotools::cmd("svccfg -s dns/client \'setprop config/domain = astring: \"example.com\"\'");
print $CMD_COL;
demotools::cmd("svccfg -s name-service/switch \'setprop config/host = astring: \"files dns\"\'");
print $CMD_COL;
demotools::cmd("svcadm refresh name-service/switch");
print $CMD_COL;
demotools::cmd("svcadm refresh dns/client");
print $STORY_COL, "You get the idea...\n";
print $STORY_COL, "\n";
print $STORY_COL, "Alternatively, you can edit the usual files resolv.conf and nsswitch.conf,\n";
print $STORY_COL, "but you have to import them into the naming service configuration:\n";
print $CMD_COL;
demotools::cmd("nscfg import -f svc:/system/name-service/switch:default");
print $CMD_COL;
demotools::cmd("nscfg import -f svc:/network/dns/client:default");
print $CMD_COL;
demotools::cmd("svcadm refresh dns/client");
print $STORY_COL, "Let's switch back to the Automatic network profile:\n";
print $CMD_COL;
demotools::cmd("netadm enable -p ncp Automatic");


print RESET;
