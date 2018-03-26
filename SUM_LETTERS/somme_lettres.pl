#!/usr/bin/perl
# Fait le somme des valeurs des lettres
# Usage : somme_lettres.pl file.txt
open FILE,$ARGV[0];

for (<FILE>) {
   chomp;
   @lettres=split //;
   print $_."=";
   $total=0;
   for $char (@lettres) {
      $val=ord("\u$char")-64;
      #print "\n\u$char $val\n";
      if ($val>0 && $val <27) {
         $total+=$val;
      }
   }
   print "$total\n";
}

close FILE;
