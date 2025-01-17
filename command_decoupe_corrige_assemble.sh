#!/bin/bash

# rm -r Correction/

# pick a chapter to correct
echo '=================================================='
echo " COMPILATION "
echo '=================================================='
pdflatex Chapitre1.tex

echo '=================================================='
echo " DECOUPAGE "
echo '=================================================='
CHAPTER_NUMBER=1
# pick a new number, if you want to check the correction
NEW_CHAPTER_NUMBER=1_rouge

# create a temporary folder to host the correction
FOLDER_CHAPITRE=Corrections/Chap${CHAPTER_NUMBER}/
mkdir ${FOLDER_CHAPITRE}

#split the latex chapter into small parts
./01_decoupe_latex.sh Chapitre${CHAPTER_NUMBER}.tex ${FOLDER_CHAPITRE}

# active l'environnement python où est installé mistralai
source /home/vozenne/Dev/mistral-env/bin/activate

# get total number of small parts 
NUMBER=$(ls ${FOLDER_CHAPITRE}/partie_??.tex | wc -l)

echo '=================================================='
echo " CORRECTION "
echo '=================================================='
# loop over 
for NUM in $( eval echo {1..$NUMBER} )
do 
#for NUM in $( eval echo {4..4 )

compteur_formatte=$(printf "%02d" "$NUM")
# call Le Chat, cocorico!
#if [[ $NUM -eq 8 ]]; then
echo ' ======= miaouh '${compteur_formatte}
#python3 LeChat/tester_API_v4.py ${FOLDER_CHAPITRE}/partie_${compteur_formatte}.tex ${FOLDER_CHAPITRE}/partie_${compteur_formatte}_chat.tex
#fi
done 
deactivate

echo '=================================================='
echo " ASSEMBLAGE "
echo '=================================================='
# merge each corrected file into a new chapter with a new number
./02_rassemble_latex.sh  ${FOLDER_CHAPITRE} Chapitre${NEW_CHAPTER_NUMBER}.tex

echo '=================================================='
echo " COMPILATION AVEC CORRECTION "
echo '=================================================='
pdflatex Chapitre${NEW_CHAPTER_NUMBER}.tex
echo '=================================================='
echo " Le document Chapitre${NEW_CHAPTER_NUMBER}.tex est prêt "
echo '=================================================='
