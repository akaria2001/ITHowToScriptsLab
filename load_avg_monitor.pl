#!/usr/bin/perl -w
use strict;
use Net::SMTP;

my $threshold = 10;
my $hostname = `cat /etc/hostname`;
chomp($hostname);

sub getTime
{
    my $sec;
    my $min;
    my $hours;
    ($sec, $min, $hours) = localtime(time);
    if($sec < 10)
    {
        $sec = "0" . $sec;
    }
    if($min < 10)
    {
        $min = "0" . $min;
    }
    if($hours < 10)
    {
        $hours = "0" . $hours;
    }
    my $time = "$hours:$min:$sec";
    return($time);
}

sub getDate
{
    my $sec;
    my $min;
    my $hours;
    my $mday;
    my $month;
    my $year;
    my $WeekDay;
    my $DayOfYear;
    my $IsDST;
    ($sec, $min, $hours, $mday, $month, $year, $WeekDay, $DayOfYear, $IsDST) = localtime(time);
    my $formattedMonth = $month + 1;

    if($formattedMonth < 10)
    {
        $formattedMonth = "0" . $formattedMonth;
    }

    my $formattedYear = $year + 1900;
    my $date = "$mday/$formattedMonth/$formattedYear";
    return($date);
}

sub log_output
{
    my $time = getTime();
    my $date = getDate();
    my $line = shift;
    open(LOG,">>/var/log/load_average.log") || die $!;
    print LOG "$date $time INFO: $line\n";
    close LOG;
}

sub error_output
{
    my $time = getTime();
    my $date = getDate();
    my $line = shift;
    open(ERR,">>/var/log/load_average.err") || die $!;
    print ERR "$date $time ERROR: $line\n";
    close ERR;
}

sub execute
{
    my $load;
    
    open(my $file,"/proc/loadavg") || die $!;
    
    while(<$file>)
    {
	chomp($_);
	my $string = $_;
	$load = ((split(/\ /,$string))[1]);
	log_output("5 Minute Load Average is : $load");
	if($load >= $threshold)
	{
	    my $emailaddress;
	    log_output("Threshold ($threshold) has been breached, value is : $load");
	}
    }
    
     close($file);
}

while(1)
{
  execute();
  sleep 300;
}
