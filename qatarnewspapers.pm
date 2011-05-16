#!/usr/bin/perl

package qatarnewspapers;

use LWP::Simple;
use Date::Format;
use Switch;
use 5.010001;

require Exporter;
require AutoLoader;
our @ISA    = qw(Exporter,AutoLoader);
our @EXPORT = qw(
    &getnewspapers,&getnewspaper
);

our $VERSION = '0.01';

sub getnewspapers
{
    @params = @_;
    @U      = ();
    if ( scalar(@params) == 0 ) { @params = ( 'Raya', 'Watan', 'Alarab', 'Alsharq' ); }
    foreach (@params)
    {
        print "DEBUG:Param:$_\n";
        push @U, getnewspaper($_);
    }
    return (@U);

}

sub getnewspaper
{
    my $newspaper = shift;
    @l = ();

    ( $sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst ) = localtime(time); $year += 1900; $mon += 1;
    $date = "$mday/$mon/$year";
    switch ($newspaper) {
        case ('Raya') {
            $t = get "http://www.raya.com/Pages/home.aspx";
            while ( $t =~ s/href="(([^"]+?)\.pdf)"// ) {
                $u = $1;
                $u =~ s/\s/%20/g;
                push @l, "http://www.raya.com$u";
            }
        }
        case ('Watan') {
            $dt = time2str( "%Y%m%d", time );
            $t = get "http://www.watanepaper.com/downloadpdf.aspx?name=Download&issue=$dt";
            while ( $t =~ s/href='(data(.+?)\.pdf)'// ) {
                push @l, "http://www.watanepaper.com/$1";
            }
        }
        case ('Alarab') {
            $t = get 'GET http://www.alarab.qa/pdf_pages.php?date2=' . time2str( '%Y-%m-%d', time );
            $t =~ s/(\r|\n)/ /g;
            $t =~ s/\t/ /g;
            $t =~ s/\w+="\d+"//g;
            $t =~ s/\s+/ /g;
            $t =~ s/ >/>/g;
            $t =~ s/ </</g;
            $t =~ s/> </></g;
            $i = 1;

            while ( $t =~ s/<a href="(.+?).pdf"// )
            {
                push @l, "http://www.alarab.com.qa/admin/pdf/files/$1.pdf\n";
            }
        }
        case ('Alsharq') {
            $t = get "http://www.al-sharq.com/";
            while ( $t =~ s/href=("|')(\/pdfs\/files\/(.+?)\.pdf)$1// ) {
                push @l, "http://www.al-sharq.com$2";
            }
        }
    }

    return @l;
}

# Preloaded methods go here.

1;
__END__

# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Qatarnewspapers - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Qatarnewspapers;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Qatarnewspapers, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Osama ALASSIRY, E<lt>osama@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Osama ALASSIRY

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
