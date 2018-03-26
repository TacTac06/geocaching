#!/usr/bin/perl
#Decode en ROTxx
# Usage : decode.pl fichier.txt decalage

open FILE,$ARGV[0];
@FILE=<FILE>;
close FILE;

for $ligne (@FILE) {
  chomp $ligne;
  @ligne=split //,$ligne;
  for $char (@ligne) {
    unless ($char=~/(\d| |:)/) {
      $codeAscii=ord("\U$char");
      $codeAscii-=64;
      $codeAscii+=$ARGV[1];
      $codeAscii-=26 if ($codeAscii>26);
      $char=chr(64+$codeAscii);
    }
    print $char;  
  }
  print "\n";
} 
