#!/usr/bin/perl
# Programme de résolution de cache en brute force
# JLL Juillet 2017
# Methode brute force : on essaye toutes les combinaisons !

# Ce tableau va contenir les valeurs possibles pour les noeuds
@tableau=(0,0,0,0,0,0,0,0,0,0);
# Ce tableau contient les valeurs des sommes en fonctions de la valeur du noeud.
@somme=(24,8,26,23,19,15,16,5,25,17);
# Initialisation des compteurs
$starttime=time;
$nbiter=0;
# Appel de la fonction de génération des valeurs de noeud possibles
nextval(0,9);

# Fonction de génération de la liste des valeurs de noeuds
sub nextval {
	my($index,$max) = @_;
	my $i=0;
	#print "Appel nextval pour $index,$max\n";
	# Recherche des valeurs possibles pour la case $index
	valeur:for (my $valeur=0;$valeur<=$max;$valeur ++) {
		#print "Trace \$valeur=$valeur\n";
		# Vérification des champs précédents
		for ($i=0;$i<$index;$i ++) {
			#print "On compare \$valeur avec \$tableau[$i] =".$tableau[$i]."\n";
			next valeur if ($valeur == $tableau[$i]); # Valeur déjà utilisée dans le tableau
		}
		#print "On affecte la valeur $valeur à \$tableau[$index]\n";
		$tableau[$index]=$valeur; # On trouve une valeur libre et on l'affecte dans la case du tableau en cours
		if ($index==$max) {
			$nbiter ++;
			print @tableau; # On affiche le tableau
			if (verif($max)) {
				print " => c'est la solution\n";
				$now=time()-$starttime;
				die "Solution trouvée en $now secondes en testant $nbiter combinaisons !\n";
			} else {
				print "=> KO\n";
			}
		} else {
			nextval($index+1,$max); # On cherche les valeurs suivantes
		}
	}
	return;
}

# Fonction de vérification pour valider la combinaison des valeurs de noeuds
sub verif {
	my($max)=@_;
	# Création d'un tableau @verif qui contient les sommes des noeuds liés
	my @verif=(0,0,0,0,0,0,0,0,0,0);
	$verif[0]=$tableau[1]+$tableau[4]+$tableau[6];
	$verif[1]=$tableau[0]+$tableau[2]+$tableau[4];
	$verif[2]=$tableau[1]+$tableau[8]+$tableau[9];
	$verif[3]=$tableau[4]+$tableau[6]+$tableau[8];
	$verif[4]=$tableau[0]+$tableau[1]+$tableau[3]+$tableau[5]+$tableau[6]+$tableau[7]+$tableau[8];
	$verif[5]=$tableau[4];
	$verif[6]=$tableau[0]+$tableau[3]+$tableau[4]+$tableau[7]+$tableau[8];
	$verif[7]=$tableau[4]+$tableau[6]+$tableau[9];
	$verif[8]=$tableau[2]+$tableau[3]+$tableau[4]+$tableau[6];
	$verif[9]=$tableau[2]+$tableau[7];
	
	# On vérifie chaque noeud
	for (my $i=0;$i<=$max;$i ++) {
		return 0 if ($verif[$i]!=$somme[$tableau[$i]]); # Somme incorrecte
	}
	return 1; # Voila la solution !
	
}
