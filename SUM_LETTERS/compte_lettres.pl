#!/usr/bin/perl
# Compte le nombre de lettres
# Usage : compte_lettres.pl source.txt
open FILE,$ARGV[0];

for (<FILE>) {
   chomp;
   @lettres=split //;
   for $char (@lettres) {
      $val=ord("\u$char")-64;
      #print "\u$char $val\n";
      if ($val>0 && $val <27) {
         $nb{"\u$char"} ++;
      }
   }
}
close FILE;

for $i (0..25) {
	$lettre=chr(65+$i);
	print "$lettre => ";
	if (exists $nb{$lettre}) {
		print "$nb{$lettre}\n";
	} else {
		print "0\n";
	}
}
