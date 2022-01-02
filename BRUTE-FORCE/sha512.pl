#!/usr/bin/perl
# Programme de brute force sur hash
use Digest::SHA qw(sha512_hex);
$cible='50d88ebad68cc8b4ae9cc7543f93fdf0fcab7da79f2b35448bd5e8c18b1fe608cbf7f94fbe9de58091dbe0657f9e14f0b1f29ad0fb45c4442d2432191df61978';

for ($a = 46; $a < 49; $a ++) {
	for ($b = 11; $b < 14; $b ++) {
		for $i (0 .. 999) {
			for $j (0 .. 999) {
				# Padding sur 3 digits
				$lat=sprintf("%03u",$i);
				$lon=sprintf("%03u",$j);
				# Construction de la chaîne à hasher
				$data="N 43 $a.$lat E 007 $b.$lon";
				$digest=sha512_hex($data);
				#print "$data => $digest\n";
				$try ++;
				if ($digest eq $cible) {
					die "Coord : $data ( $try essais)\n";
				}
			}
		}
	}
}
