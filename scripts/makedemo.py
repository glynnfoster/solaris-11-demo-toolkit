#!/usr/bin/python

import sys

print """#!/usr/bin/perl

use Term::ANSIColor;
use Term::ANSIColor qw(:constants);
use lib 'scripts';
use demotools;

require "scripts/demo-common.pl";

print RESET;
system("clear");

"""

for arg in sys.argv[1:]:
    script = open(arg, 'r')
    lines = script.readlines()

    for line in lines:
        fline = line[2:].rstrip()
        fline = fline.replace('@', '\@')
        fline = fline.replace('\"', '\\"')
        if line[0] == 'C':
            print 'print $CMD_COL;\ndemotools::cmd("%s");' % (fline)
        elif line[0] == 'S':
            print 'print $STORY_COL, "%s\\n";' % (fline)
        else:
            print line

print "print RESET;"
