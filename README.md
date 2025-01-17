[English version](README_EN.md)

# Intéragir avec les modèles de langage que propose Mistral AI.

Petit code pour intéragir avec l'outil de conversation de Mistral AI afin d'effectuer des corrections orthographiques d'un document Latex. Le proposition sont alors soulignés en rouge dans le nouveau document. Dans le fichier LeChat/tester_API_v4, le prompt peut être modifié pour effectuer une traduction du document. Le language peut aussi être modifié. Il est aussi possible de lister l'ensemble des corrections effectuées dans un second fichier.

Testé sur Ubuntu 22.04 lors de la rédaction de mon HDR en janvier 2024

# Pré-requis

- Ouvrir un compte sur [https://mistral.ai/en/](https://mistral.ai/en/)
- Activer l'API gratuite dans Paramètres du compte.
- Puis générer une clé API.
- Enregistrer la clé API dans votre ~/.bashrc ou la copier e dur dans le code python.
- Créer un environnement virtuel python avec [mistralai](https://pypi.org/project/mistralai/)
- Mettre un fichier Latex pouvant être compilé avec pdflatex. Si possible le nommer `Chapitre1.tex`. Le fichier .pdf corrigé sera alors nommé `Chapitre1_rouge.pdf`

# Usage

```
./command_decoupe_corrige_assemble.sh 
```

Des erreurs sont possibles. Dans ce cas modifier le prompt ou modifier manuellement le fichier Chapitre1_rouge.tex puis taper la commande suivante

```
pdflatex Chapitre1_rouge.tex
```

Si besoin pensez à supprimer le dossier `Correction` pour un nouveau chapitre


# Liste non exhaustives d'erreurs (grossières) ajoutées

- Le temps réel en traitement d’image désignent
- des image
- la capacité de contrôlé
- Les opérations effectués
- afin quelles soient
- perçu 
  
# Mots Clés

Mistral-AI, Le Chat, Latex, Correction Orthographiques, Prompt, LeChat, These, Doctorat, PhD, Habilitation à diriger des recherches.

# Python Environnement

```
python3 -m venv mistral-env
source mistral-env/bin/activate 
pip install mistralai
deactivate
```