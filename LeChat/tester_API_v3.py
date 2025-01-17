import os
from mistralai import Mistral

def lire_fichier(nom_fichier):
    with open(nom_fichier, 'r') as fichier:
        return fichier.read().strip()

def main():
    # Lire la clé API à partir du fichier
    api_key = os.environ["MISTRAL_API_KEY"]

    # Lire le texte à corriger à partir du fichier
    texte_a_corriger = lire_fichier("phrase.txt")

    # Initialiser le client Mistral
    model = "mistral-large-latest"
    client = Mistral(api_key=api_key)

    # Poser la question de correction d'orthographe à l'API de Mistral AI
    prompt = f"Corrige l'orthographe : {texte_a_corriger}"
    chat_response = client.chat.complete(
        model=model,
        messages=[
            {
                "role": "user",
                "content": prompt,
            },
        ]
    )

    # Afficher la réponse
    print("Texte corrigé:", chat_response.choices[0].message.content)

if __name__ == "__main__":
    main()
