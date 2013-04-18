#!/usr/bin/perl -w

use Term::ANSIColor;
use Term::ANSIColor qw(:constants);
use lib 'scripts';
use demotools;

require "scripts/demo-common.pl";

system("clear");


print $STORY_COL, "In this demo we will demonstrate that you can use your zone as you \nwould use your normal Oracle Solaris system: you can create users, \ninstall packages, enable services etc.\n";
print $STORY_COL, "First, boot the zone.\n";
print $CMD_COL;
demotools::cmd("zoneadm -z zone1 boot");
print $STORY_COL, "Then log into the zone.\n";
print $CMD_COL;
demotools::cmd("zlogin zone1","");
demotools::setprompt("root\@zone1:~#");
print $STORY_COL, "Let's start with finding out our network address:\n";
print $CMD_COL;
demotools::cmd("ipadm show-addr","zlogin zone1 ipadm show-addr");
print $STORY_COL, "What packages are installed here?\n";
print $CMD_COL;
demotools::cmd("pkg list","zlogin zone1 pkg list");
print $STORY_COL, "How many of them?\n";
print $CMD_COL;
demotools::cmd("pkg list | wc -l", "zlogin zone1 pkg list | wc -l");
print $STORY_COL, "Is Apache web server package installed?\n";
print $CMD_COL;
demotools::cmd("pkg list '*apache*'","zlogin zone1 pkg list '*apache*'");
print $STORY_COL, "No, it's not installed. Is it available?\n";
print $CMD_COL;
demotools::cmd("pkg list -a '*apache*'","zlogin zone1 pkg list -a '*apache*'");
print $STORY_COL, "Let's install it in the zone:\n";
print $CMD_COL;
demotools::cmd("pkg install apache-22", "zlogin zone1 pkg install apache-22");
print $STORY_COL, "Is it enabled after the installation?\n";
print $CMD_COL;
demotools::cmd("svcs '*apache*'","zlogin zone1 svcs '*apache*'");
print $STORY_COL, "No, it's not. Enable it:\n";
print $CMD_COL;
demotools::cmd("svcadm enable apache22","zlogin zone1 svcadm enable apache22");
print $STORY_COL, "Check it again:\n";
print $CMD_COL;
demotools::cmd("svcs '*apache*'","zlogin zone1 svcs '*apache*'");
print $STORY_COL, "Check if the zone1's webserver is available from the global zone:\n";
demotools::setprompt("root\@solaris:~#");
print $CMD_COL;
demotools::cmd("/usr/bin/firefox -new-tab http://10.0.2.21 > /dev/null 2>&1");
print $STORY_COL, "To make sure it's our zone speaking, let's change the default index.html file:\n";
demotools::setprompt("root\@zone1:~#");
print $CMD_COL;
demotools::cmd("echo '<html><body><h1>It's Zone1 and it works!</h1></body></html>' > /var/apache2/2.2/htdocs/index.html","zlogin zone1 'echo \"<html><body><h1>It is Zone1 and it works</h1></body></html>\" > /var/apache2/2.2/htdocs/index.html'");
print $STORY_COL, "Check it again:\n";
demotools::setprompt("root\@solaris:~#");
print $CMD_COL;
demotools::cmd("/usr/bin/firefox -new-tab http://10.0.2.21 > /dev/null 2>&1");
print $STORY_COL, "Now: is it possible to create users in the zone? Let's try\n";
demotools::setprompt("root\@zone1:~#");
print $CMD_COL;
demotools::cmd("useradd -m jack","zlogin zone1 useradd -m jack");
print $STORY_COL, "Check if you can login into the zone as 'jack' from our global zone:\n";
demotools::setprompt("root\@solaris:~#");
print $CMD_COL;
demotools::cmd("zlogin -l jack zone1");
print $STORY_COL, "It works!\n";
demotools::wait4enter; 

print RESET;
