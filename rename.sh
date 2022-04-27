#!/bin/bash


function show_usage  #afficher usage
{
	echo "rename.sh: [-h|--help][-T][-t][-n][-N] [-d][-m][-s] chemin.."
exit 1 
}

function Miniscule_nom #changer le nom en miniscule
{
    echo "Donner le nom du fichier ou repertoire que vous voulez changer en miniscule: "
    
    read nom
    
    if (test -f $nom)||(test -d $nom)
       then
       mv -v "$nom"  "`echo $nom | tr '[A-Z]' '[a-z]'`"
    fi
}


function Miniscule_nom1 #changer le nom en miniscule graphique 
{
   nom=`yad --center --width=500 --height=100 --text="Donner le nom du fichier ou repertoire que vous voulez changer en miniscule: " --entry`
	
   if (test -f $nom)||(test -d $nom)
     then
     mv -v "$nom"  "`echo $nom | tr '[A-Z]' '[a-z]'`"
   fi
}

function Majuscule_nom #changer le nom en majuscule
{
   echo "Donner le nom du fichier ou repertoire que vous voulez changer en majuscule: "
   
   read nom
   
   if (test -f $nom)||(test -d $nom)
     then
     mv -v "$nom" "`echo $nom | tr '[a-z]' '[A-Z]'`"
   fi
}

function Majuscule_nom1 #changer le nom en majuscule graphique
{
   nom=`yad --center --width=500 --height=100 --text="Donner le nom du fichier ou repertoire que vous voulez changer en majuscule: " --entry`
	
   if (test -f $nom)||(test -d $nom)
     then
     mv -v "$nom" "`echo $nom | tr '[a-z]' '[A-Z]'`"
   fi
}

function HELP #afficher help
{
	cat help.txt
}

function HELP1 #afficher help graphique
{
  yad --center --width=500 --height=100 --image="gtk-dialog-info" --title="HELP" --text="$(cat help.txt)"
}

function Auteurs_code #afficher les auteurs et version du code
{
	echo "Le programme est developpé par Ines Meddeb et Zeineb Ben Fredj"
	echo "version 1.0"
	echo "version du systeme"
	cat /etc/os-release
}

function Auteurs_code1 #afficher les auteurs et version du code graphique
{

	yad --center --width=600 --height=100 --image="gtk-dialog-info" --title="HELP" --text="$(cat auteurs.txt)"
}

function Espaces_nomf 
{
	for f in *\ *; do mv "$f" "${f// /_}"; done
}


function Extension_enlever # enlever l'extension du nom
{
   echo "Donner le nom du fichier que vous voulez enlever son extension "
   read nom
  
   if test -f $nom
     then
     name=$(echo "$nom" | cut -f 1 -d '.')
     mv $nom $name
   else
     echo "le fichier n'existe pas"
   fi
}

function Extension_enlever1 #enlever extension du nom graphique
{
   nom=`yad --center --width=400 --height=100 --text="Donner le nom du fichier que vous voulez enlever son extension: " --entry`
	
   if test -f $nom
     then
     name=$(echo "$nom" | cut -f 1 -d '.')
     mv $nom $name
   else
     echo "le fichier n'existe pas"
   fi

}



function Extension_ajouter #ajouter une extension au nom
{
    echo "Donner le nom du fichier dont vous voulez ajouter une extension: "
    read nom
    echo "Donner l'extension à ajouter: "
    read ex
    
   if test -f $nom
     then
     mv "${nom}" "${nom}.${ex}"
   else
     echo "le fichier n'existe pas"
   fi
}

function Extension_ajouter1 #ajouter une extension au nom graphique
{
	nom=`yad --center --width=400 --height=100 --text="Donner le nom du fichier dont vous voulez ajouter une extension: " --entry`
	ex=`yad --center --width=400 --height=100 --text="Donner l'extension à ajouter: " --entry`
	
    if test -f $nom
      then
      mv "${nom}" "${nom}.${ex}"
    else
      echo "le fichier n'existe pas"
    fi
}

function Ajouter_d_nomrep #ajouter_d au nom de la repertoire
{
   echo "Donner le nom de la repertoire dont vous voulez ajouter _d: "
   read nom
   
   if test -d $nom
     then
     mv "${nom}" "${nom}_d"
   else
     echo "la repertoire n'existe pas"
   fi
   
}

function Ajouter_d_nomrep1 #ajouter_d au nom de la repertoire graphique
{
     nom=`yad --center --width=400 --height=100 --text="Donner le nom de la repertoire dont vous voulez ajouter _d: " --entry`
	
   if test -d $nom
     then
     mv "${nom}" "${nom}_d"
   else
     echo "la repertoire n'existe pas"
   fi
}



function Menu_Graphique #menu graphique
{ 
  export -f HELP1
  export -f Auteurs_code1
  export -f Extension_ajouter1
  export -f Miniscule_nom1
  export -f Majuscule_nom1
  export -f Extension_enlever1
  export -f Ajouter_d_nomrep1
  export -f Espaces_nomf
  
  yad --title "Menu graphique" --form --field "help:btn" "bash -c HELP1" --field "Auteurs et version du code:btn" "bash -c Auteurs_code1" --field "Ajouter une extension:btn" "bash -c Extension_ajouter1" --field "Transformer le nom d'une repertoire ou d'un fichier en miniscule:btn" "bash -c Miniscule_nom1" --field "Transformer le nom d'un repertoire ou d'un fichier en majuscule:btn" "bash -c Majuscule_nom1" --field "Enlever une extension:btn" "bash -c Extension_enlever1" --field "Ajouter _d a la fin du nom de repertoire:btn" "bash -c Ajouter_d_nomrep1" --field "Renommer les fichiers dont le nom contient des espaces:btn" "bash -c Espaces_nomf"
}


function menu #menu textuel
{
    while true; do
	
        clear
        echo "Menu"
        echo "------------------------"
        echo "1- Help"
        echo "2- Ajouter une extension"
        echo "3- version du code"
      	echo "4- Transformer le nom d'un repertoire ou d'un fichier en miniscule"
        echo "5- Transformer le nom d'un repertoire ou d'un fichier en majuscule"
        echo "6- Enlever une extension"
        echo "7- Ajouter _d a la fin du nom de repertoire"
        echo "8- Renommer les fichiers dont le nom contient des espaces"
	echo "0- Quitter"
        echo "------------------------"
        echo "Taper votre choix"
        read choix
		
        case "$choix" in
			0) exit ;;
			1) HELP;;
			2) Extension_ajouter;;
			3) Auteurs_code;;
			4) Miniscule_nom;;
			5) Majuscule_nom;;
			6) Extension_enlever;;
			7) Ajouter_d_nomrep;;	
			8) Espaces_nomf;;
			*) echo "Choix incorrect";;
        esac
		
        read -p "Appuyez sur la touche Entrer pour continuer"
    done
}


  if (test $# == 0); then
      echo "Pas d'arguments dans ce fichier!"
      2>&1 | show_usage > erreur_sc.txt
  else
  
    while getopts "hmvg" option
     do
	case $option in
		h) help;;
		m) menu;;
		v) Auteurs_code;;
		g) Menu_Graphique;;
		*) echo "invalid option";;
	esac
     done
  fi

