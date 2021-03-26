#!/usr/bin/perl -w
# www.it-howto.co.uk
use strict;

open(my $file,">/usr/local/bin/usernames.yml") || die $!;

print $file "names:\n";

for(1..20)
{
    print $file "  - \"user$_\"\n";
}

close($file);
