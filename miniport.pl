#!/usr/bin/perl

# MiniPort Project Port scanner

use IO::Socket;


$| = 1;

print q{ 
  __  __ _       _ ____            _
 |  \/  (_)_ __ (_)  _ \ ___  _ __| |_
 | |\/| | | '_ \| | |_) / _ \| '__| __|
 | |  | | | | | | |  __/ (_) | |  | |_
 |_|  |_|_|_| |_|_|_|   \___/|_|   \__|
     Coder: SyberCodeV1 & GrayTurkish
};
print "İp Adresini gir : ";


chop ($target = <stdin>);
print "Başlayacak Port Sayısını Gir : ";
chop ($start_port = <stdin>);
&check_port($start_port);
print "Biticek Port Sayısını Gir : ";
chop ($end_port = <stdin>);
&check_port($end_port);


foreach ($port = $start_port ; $port <= $end_port ; $port++) 
{

	print "\rScan Başladı $port";
	

	$socket = IO::Socket::INET->new(PeerAddr => $target , PeerPort => $port , Proto => 'tcp' , Timeout => 1);
	

	if( $socket )
	{
		print "\r = Port $port is open.\n" ;
	}
	else
	{
		
	}
}

print "\n\nScan Bitmiştir Açık Olan Portlar Üstte Çıkmıştır - SyberCodeV\n";

exit (0);

sub check_port {
    my $port = shift;

    if ($port =~ /\D+/ or $port > 65535 or $port < 0) {
        print "Lütfen Port Formatını Kontrol edin:: $port\n";
        exit 1;
    }
}
