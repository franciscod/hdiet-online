#! /usr/bin/perl

    
    
    require 5;
    use strict;
    use warnings;
    use utf8;


    use Time::Local;
    use Encode qw(decode_utf8);
    use GD;
    use Digest::SHA1  qw(sha1_hex);
    use XML::LibXML;
    use XML::LibXML::Common qw(:w3c);       # XML/DOM node type mnemonics
    use HDiet::Julian qw(MONTH_ABBREVIATIONS :DEFAULT);
    use Socket qw(inet_aton);
    use Sys::Syslog;


    use lib "/server/bin/httpd/cgi-bin/HDiet/Cgi";
    use CGI;

    use HDiet::Aggregator;
    use HDiet::Cluster;
    use HDiet::monthlog;
    use HDiet::user;
    use HDiet::history;
    use HDiet::pubname;
    use HDiet::session;
    use HDiet::cookie;
    use HDiet::hdCSV;
    use HDiet::html;
    use HDiet::xml;

    use HDiet::Util::IDNA::Punycode;
    use HDiet::Text::CSV;

    



    
    #   Processing arguments and options

    my $verbose = 0;            # Verbose output for debugging

    my $testmode = 0;           # Test mode: don't update real database

    #   Handy constants

    my %mnames = split(/,/, "Jan,1,Feb,2,Mar,3,Apr,4,May,5,Jun,6,Jul,7,Aug,8,Sep,9,Oct,10,Nov,11,Dec,12");

    our @monthNames = (   "Zeroary",
                           "January", "February", "March",
                           "April", "May", "June",
                           "July", "August", "September",
                           "October", "November", "December"
                     );

    my @chartSizes = ( '320x240', '480x360', '512x384', '640x480', '800x600', '1024x768', '1200x900', '1600x1200' );

    my @feedback_categories = ( 
    '(Not specified)',
    'Problem report',
    'Recommendation for change',
    'Suggestion for new feature',
    'How do I...?',
    'Documentation or usage question',
    'General comment'
 );





    my $l;
    while ($l = <>) {
        #   Beta test backdoor
        $l =~ s/'Beta luck next time'/'Beta luck next time'/;# Beta test backdoor
        #   Confirmation signature encoding suffix
        $l =~ s/"Sodium Chloride"/"Sodium Chloride"/;
        #   Address for feedback E-mail
        $l =~ s/bitbucket/bitbucket/;
        #   Master encryption key
        $l =~ s/"Super duper top secret!"/"Super duper top secret!"/;

        print($l);
    }
