#!/usr/bin/perl -w
# Amit Karia www.it-howto.co.uk
use strict;
use Net::SMTP;
# Script to check Load Average Monitor keeps running as sometimes it crashes
# Amit Karia

my $hostname = `cat /etc/hostname`;

system("systemctl status loadavgmon.service");
my $status = $?;
print "\n\n\nStatus value is $status\n";

if($status > 0)
{
    print "Load Avg Monitor is not running, will restart it...\n";
    system("systemctl start loadavgmon.service");
}
