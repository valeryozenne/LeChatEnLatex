import os
from mistralai import Mistral

def lire_fichier(nom_fichier):
    with open(nom_fichier, 'r') as fichier:
        return fichier.read().strip()

def ecrire_fichier(nom_fichier, contenu):
    with open(nom_fichier, 'w') as fichier:
        fichier.write(contenu)

def main(nom_fichier_entree, nom_fichier_sortie):
    # Lire la clé API à partir du fichier
    api_key = os.environ["MISTRAL_API_KEY"]

    # Lire le texte à corriger à partir du fichier spécifié
    texte_a_corriger = lire_fichier(nom_fichier_entree)

    # Initialiser le client Mistral
    model = "mistral-large-latest"
    client = Mistral(api_key=api_key)

    # Poser la question de correction d'orthographe à l'API de Mistral AI
    prompt = f"Propose une correction orthographique et syntaxique en ajoutant une balise LaTeX de couleur rouge à chaque changement. Attention il faut faire prévaloir les règles suivantes: 1) Le texte contient des balises LaTeX, ne pas modifier les balises Latex . 2) Ne pas corriger les acronymes avec les balises '\ac' et '\acro'. 3) Vérifier que les balises ajoutées sont bien correctes sinon les enlever surtout s'il y a un doublon. Mettre juste le texte corrigé. Voici le texte à corriger : {texte_a_corriger}"
    chat_response = client.chat.complete(
        model=model,
        messages=[
            {
                "role": "user",
                "content": prompt,
            },
        ]
    )

    # Récupérer la réponse corrigée
    texte_corrige = chat_response.choices[0].message.content

    # Sauvegarder la réponse dans le fichier spécifié
    ecrire_fichier(nom_fichier_sortie, texte_corrige)

    # Afficher la réponse
    print("Texte corrigé:", texte_corrige)

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 3:
        print("Usage: python script.py <nom_fichier_entree> <nom_fichier_sortie>")
        sys.exit(1)

    nom_fichier_entree = sys.argv[1]
    nom_fichier_sortie = sys.argv[2]
    main(nom_fichier_entree, nom_fichier_sortie)
