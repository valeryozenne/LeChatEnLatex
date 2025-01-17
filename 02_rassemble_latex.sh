#!/bin/bash

# Vérifiez si deux arguments ont été fournis
if [ $# -ne 2 ]; then
    echo "Usage: $0 <dossier_source> <fichier_sortie>"
    exit 1
fi

# Dossier contenant les fichiers LaTeX
dossier_source=$1

# Nom du fichier de sortie final
fichier_sortie=$2

# Vérifiez si le dossier source existe
if [ ! -d "$dossier_source" ]; then
    echo "Le dossier $dossier_source n'existe pas."
    exit 1
fi

#ls  "$dossier_source"/*_chat.tex 
# Rassemblez tous les fichiers .tex dans le dossier source en un seul fichier
cat "$dossier_source"/*_chat.tex  > "$fichier_sortie"

echo "Les fichiers du dossier $dossier_source ont été rassemblés dans le fichier $fichier_sortie."
