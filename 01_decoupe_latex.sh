#!/bin/bash

# Vérifiez si deux arguments ont été fournis
if [ $# -ne 2 ]; then
    echo "Usage: $0 <fichier_latex> <dossier_sortie>"
    exit 1
fi

# Nom du fichier LaTeX à découper
fichier_latex=$1

# Dossier de sortie
dossier_sortie=$2

# Vérifiez si le fichier existe
if [ ! -f "$fichier_latex" ]; then
    echo "Le fichier $fichier_latex n'existe pas."
    exit 1
fi

# Créez le dossier de sortie s'il n'existe pas
mkdir -p "$dossier_sortie"

# Compteur pour les fichiers de sortie
compteur=1

# Fichier temporaire pour stocker le contenu actuel
fichier_temp=$(mktemp)

# Lire le fichier LaTeX ligne par ligne
while IFS= read -r ligne; do
    # Ajoutez la ligne au contenu actuel
    echo "$ligne" >> "$fichier_temp"

    # Si la ligne contient le séparateur "\\", sauvegardez le contenu actuel et réinitialisez le buffer
    if [[ "$ligne" == *"\\\\"* ]]; then
        # Sauvegardez le contenu actuel dans un fichier
        if [ -s "$fichier_temp" ]; then
            # Formatez le compteur avec des zéros pour les chiffres avant les dizaines
            compteur_formatte=$(printf "%02d" "$compteur")
            mv "$fichier_temp" "$dossier_sortie/partie_$compteur_formatte.tex"
            compteur=$((compteur + 1))
            fichier_temp=$(mktemp)
        fi
    fi
done < "$fichier_latex"

# Sauvegardez la dernière partie si elle existe
if [ -s "$fichier_temp" ]; then
    # Formatez le compteur avec des zéros pour les chiffres avant les dizaines
    compteur_formatte=$(printf "%02d" "$compteur")
    mv "$fichier_temp" "$dossier_sortie/partie_$compteur_formatte.tex"
fi

echo "Le fichier $fichier_latex a été découpé en $compteur parties dans le dossier $dossier_sortie."
